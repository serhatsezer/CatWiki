//
//  CatDetailViewModel.swift
//  Catass
//
//  Created by Serhat Sezer on 07/10/2019.
//  Copyright © 2019 Serhat Sezer. All rights reserved.
//

import Foundation

struct CatDetailViewModel {
    private var cat: Cat
    
    init(cat: Cat) {
        self.cat = cat
    }
    
    var traits: String {
        return "Adaptability: \(cat.adaptability) - Child friendly: \(cat.childFriendly)"
    }
    
    var origin: String {
        return "🌍 I'm from \(cat.origin)"
    }
    
    var temperament: String {
        return "I'm kinda \(cat.temperament) type of cat 🐈"
    }
}
