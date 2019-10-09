//
//  APIManagable.swift
//  Catass
//
//  Created by Serhat Sezer on 07/10/2019.
//  Copyright © 2019 Serhat Sezer. All rights reserved.
//

import Foundation

public protocol Endpoint {
    var baseURL: URL { get }
    var method: HTTPMethod  { get }
    var path: String { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
}

extension Endpoint {
    /// Build `Request` for corresponding API.
    var request: Requestable {
        let url = baseURL.appendingPathComponent(path)
        return NetworkManager.request(url, method: method, parameters: parameters, headers: headers)
    }
}

enum CatAPI: Endpoint {
    case search(breed: String)
    
    var baseURL: URL {
        return URL(string: "https://api.thecatapi.com/v1")!
    }
    
    var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .search:
            return "/breeds"
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .search(let breed):
           return ["attached_breed": breed]
        }
    }
    var headers: [String : String]? {
        return ["x-api-key": "ddf43a37-496b-41e4-8015-fecfa9904889"]
    }
    
}
