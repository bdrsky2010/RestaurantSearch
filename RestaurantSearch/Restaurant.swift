//
//  Restaurant.swift
//  RestaurantSearch
//
//  Created by Minjae Kim on 5/24/24.
//

import Foundation

struct Restaurant {
    static func === (lhs: Restaurant, rhs: Restaurant) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id = UUID()
    let image: String
    let latitude: Double
    let longitude: Double
    let name: String
    let address: String
    let phoneNumber: String
    let category: String
    let price: Int
    let type: Int
    var isLike: Bool
}


