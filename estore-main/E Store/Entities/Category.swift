//
//  Category.swift
//  E Store
//
//  Created by Bayu Yasaputro on 14/10/23.
//

import Foundation

struct Category {
    let id: Int
    let name: String
    let image: String
}

extension Category: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case name = "name"
        case image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
    }
}
