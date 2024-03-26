//
//  Product.swift
//  E Store
//
//  Created by Bayu Yasaputro on 21/10/23.
//

import Foundation

struct Product {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: Category?
    let images: [String]
}

extension Product: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case description
        case category
        case images
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        price = try container.decodeIfPresent(Double.self, forKey: .price) ?? 0
        description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        category = try container.decodeIfPresent(Category.self, forKey: .category)
        images = try container.decodeIfPresent([String].self, forKey: .images) ?? []
    }
}
