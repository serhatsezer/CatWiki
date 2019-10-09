//
//  CatDetailTests.swift
//  CatassTests
//
//  Created by Serhat Sezer on 09/10/2019.
//  Copyright © 2019 Serhat Sezer. All rights reserved.
//

import Nimble
import XCTest
@testable import Catass

class CatDetailTests: XCTestCase {
    var cat: Cat!
    var catDetailViewModel: CatDetailViewModel!
    
    override func setUp() {
        cat = Cat(name: "Aegean",
                  description: "Native to the Greek islands known as the Cyclades in the Aegean Sea, these are natural cats, meaning they developed without humans getting involved in their breeding. As a breed, Aegean Cats are rare, although they are numerous on their home islands. They are generally friendly toward people and can be excellent cats for families with children.",
                  origin: "Greece",
                  adaptability: 5,
                  childFriendly: 4,
                  temperament: "Affectionate, Social, Intelligent, Playful, Active")
        catDetailViewModel = CatDetailViewModel(cat: cat)
    }
    
    func test_cat_detail_viewModel_return_right_traits_format() {
        let expectedResult = "Adaptability: 1 - Child friendly: 1"
        expect(self.catDetailViewModel.traits).to(equal(expectedResult))
    }
    
    func test_cat_detail_viewModel_return_wrong_traits_format() {
        let expectedResult = "1 1"
        expect(self.catDetailViewModel.traits).to(equal(expectedResult))
    }
    
    func test_cat_detail_viewModel_return_right_origin_format() {
        let expectedResult = "🌍 I'm from Greece"
        expect(self.catDetailViewModel.origin).to(equal(expectedResult))
    }
    
    func test_cat_detail_viewModel_return_wrong_origin_format() {
        let expectedResult = "I'm from Greece"
        expect(self.catDetailViewModel.origin).to(equal(expectedResult))
    }
    
    func test_cat_detail_viewModel_return_right_temperament_format() {
        let expectedResult = "I'm kinda Affectionate, Social, Intelligent, Playful, Active type of cat 🐈"
        expect(self.catDetailViewModel.temperament).to(equal(expectedResult))
    }
    
    func test_cat_detail_viewModel_return_wrong_temperament_format() {
        let expectedResult = "Affectionate, Social, Intelligent, Playful, Active"
        XCTAssertTrue(catDetailViewModel.temperament == expectedResult)
        expect(self.catDetailViewModel.temperament).to(equal(expectedResult))
    }
}
