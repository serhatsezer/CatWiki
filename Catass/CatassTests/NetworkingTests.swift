//
//  NetworkingTests.swift
//  CatassTests
//
//  Created by Serhat Sezer on 08/10/2019.
//  Copyright © 2019 Serhat Sezer. All rights reserved.
//

import XCTest
import Nimble
@testable import Catass

/// Mocking Requestable in order to meet protocol requirenements
class MockRequest: Requestable {
    var url: URL
    var method: HTTPMethod
    var parameters: Parameters?
    var headers: HTTPHeaders?
    var handleError: Bool = false
    
    init(url: URL, method: HTTPMethod, parameters: Parameters?, headers: HTTPHeaders?) {
        self.url = url
        self.method = method
        self.parameters = parameters
        self.headers = headers
    }
    
    func loadMockJSONData(_ completion: @escaping (_ data: Data) -> Void) {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "CatSuccessResponse", withExtension: "json"), let data = try? Data(contentsOf: url) else { return }
        completion(data)
    }
    
    func response(_ completion: @escaping (Result<Data, Error>) -> Void) {
        guard !handleError else {
            let error = NSError(domain: "com.serhatsezer.networkmanager", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data found."])
            completion(.failure(error))
            return completion(.failure(error))
        }
        let mockRequest = MockRequest(url: URL(string: "http://google.com")!, method: .get, parameters: nil, headers: nil)
        mockRequest.loadMockJSONData { (data) in
            completion(.success(data))
        }
    }
    
    func responseObject<T: Decodable>(_ completion: @escaping (Result<T, Error>) -> Void) {
        guard !handleError else {
            let error = NSError(domain: "com.serhatsezer.networkmanager", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data found."])
            completion(.failure(error))
            return completion(.failure(error))
        }
        
        let mockRequest = MockRequest(url: URL(string: "http://google.com")!, method: .get, parameters: nil, headers: nil)
        mockRequest.loadMockJSONData { (data) in
            let jsonDecoder = JSONDecoder()
            let codableResults = try! jsonDecoder.decode(T.self, from: data)
            completion(.success(codableResults))
        }
    }
}

/// Mocking networking manager that handles all requests
class MockNetworkManager: Networking {
    public static var handleError: Bool = false
    
    public static func request(_ url: URL,
                               method: HTTPMethod,
                               parameters: Parameters? = nil,
                               headers: HTTPHeaders? = nil,
                               configurationBlock: URLRequestConfigurationBlock? = nil) -> Requestable {
        let request = MockRequest(url: url, method: method, parameters: parameters, headers: headers)
        request.handleError = handleError
        return request
    }
}

class NetworkingTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test_network_request_codable() {
        MockNetworkManager.request(URL(string:"https://google.com")!, method: .get).responseObject { (result: Result<[Cat], Error>) in
            switch result {
            case .success(let cats):
                expect(cats.count) > 0
                expect(cats.first!.name).to(equal(TestExpectedFixtures.name))
                expect(cats.first!.adaptability).to(equal(TestExpectedFixtures.adaptability))
                expect(cats.first!.description).to(equal(TestExpectedFixtures.desc))
                expect(cats.first!.origin).to(equal(TestExpectedFixtures.origin))
                expect(cats.first!.childFriendly).to(equal(TestExpectedFixtures.childFriendly))
                expect(cats.first!.temperament).to(equal(TestExpectedFixtures.temperament))
            case .failure(let error):
                fail(error.localizedDescription)
            }
        }
    }
    
    func test_network_request_data() {
        MockNetworkManager.request(URL(string:"https://google.com")!, method: .get).response { result in
            switch result {
            case .success(let data):
                expect(data.count) > 0
            case .failure(let error):
               fail(error.localizedDescription)
            }
        }
    }
    
    func test_network_request_return_error() {
        MockNetworkManager.handleError = true
        MockNetworkManager.request(URL(string:"https://google.com")!, method: .get).response { result in
            switch result {
            case .success(let data):
                expect(data.count) > 0
            case .failure(let error):
                fail(error.localizedDescription)
            }
        }
    }
}

enum TestExpectedFixtures {
    static let name = "Aegean"
    static let origin = "Greece"
    static let adaptability = 5
    static let childFriendly = 4
    static let temperament = "Affectionate, Social, Intelligent, Playful, Active"
    static let desc = "Native to the Greek islands known as the Cyclades in the Aegean Sea, these are natural cats, meaning they developed without humans getting involved in their breeding. As a breed, Aegean Cats are rare, although they are numerous on their home islands. They are generally friendly toward people and can be excellent cats for families with children."
}
