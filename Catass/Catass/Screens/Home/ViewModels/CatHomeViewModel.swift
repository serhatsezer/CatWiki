//
//  HomeViewModel.swift
//  Catass
//
//  Created by Serhat Sezer on 07/10/2019.
//  Copyright © 2019 Serhat Sezer. All rights reserved.
//

import Foundation
import RxSwift

struct CatHomeViewModel {
    private var cat: Cat
    
    init(cat: Cat) {
        self.cat = cat
    }
    
    var name: String {
        return "Hello! my name is; \(cat.name)"
    }
    
    var detailDescription: String {
        return "Get to know me: \(cat.description)"
    }
}
