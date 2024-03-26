//
//  CategoryListRouter.swift
//  E Store
//
//  Created by Sultan Rifaldy on 20/12/23.
//

import UIKit

protocol CategoryListRouter {
    func create() -> UIViewController
    func showProductList(category: Category)
}
