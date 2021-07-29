//
//  Entities.swift
//  Travel ID
//
//  Created by Patricia Fiona on 28/07/21.
//

import Foundation

struct APIData: Decodable{
    var error: Bool = false
    var message: String = ""
    var count: Int = 0
    var places: [Places] = [Places]()
}

struct Places: Decodable{
    let id: Int
    let name: String
    let description: String?
    let address: String?
    let longitude: Double?
    let latitude: Double?
    let like: Int?
    let image: String
}
