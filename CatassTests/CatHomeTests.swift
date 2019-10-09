//
//  CatassTests.swift
//  CatassTests
//
//  Created by Serhat Sezer on 07/10/2019.
//  Copyright © 2019 Serhat Sezer. All rights reserved.
//

import Nimble
import XCTest
@testable import Catass

class CatHomeTests: XCTestCase {
    var cat: Cat!
    var catHomeViewModel: CatHomeViewModel!
    
    override func setUp() {
        cat = Cat(name: "Abyssinian",
                  description: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
                  origin: "Egypt",
                  adaptability: 1,
                  childFriendly: 1,
                  temperament: "Active, Energetic, Independent, Intelligent, Gentle")
        catHomeViewModel = CatHomeViewModel(cat: cat)
    }
    
    func test_cat_home_viewModel_return_right_name_format() {
        let expectedResult = "Hello! my name is; Abyssinian"
        expect(self.catHomeViewModel.name).to(equal(expectedResult))
    }
    
    func test_cat_home_viewModel_return_wrong_name_format() {
        let expectedResult = "Abyssinian"
        expect(self.catHomeViewModel.name).to(equal(expectedResult))
    }
    
    func test_cat_home_viewModel_return_right_description_format() {
        let expectedResult = "Get to know me: The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals."
        expect(self.catHomeViewModel.detailDescription).to(equal(expectedResult))
    }
    
    func test_cat_home_viewModel_return_wrong_description_format() {
        let expectedResult = "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals."
        expect(self.catHomeViewModel.detailDescription).to(equal(expectedResult))
    }
}
