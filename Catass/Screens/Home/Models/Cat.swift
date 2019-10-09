//
//  Cat.swift
//  Catass
//
//  Created by Serhat Sezer on 07/10/2019.
//  Copyright © 2019 Serhat Sezer. All rights reserved.
//

import Foundation

struct Cat: Decodable {
    let name: String
    let description: String
    let origin: String
    let adaptability: Int
    let childFriendly: Int
    let temperament: String
    
    enum CodingKeys: String, CodingKey {
        case name, description, origin, adaptability, temperament
        case childFriendly = "child_friendly"
    }
}
