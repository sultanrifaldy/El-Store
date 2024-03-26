//
//  CategoryListInteractor.swift
//  E Store
//
//  Created by Sultan Rifaldy on 20/12/23.
//

import Foundation


protocol CategoryListInteractor {
    func loadCategories(completion: @escaping ([Category], Error?) -> Void)
}

class DefaultCategoryListInteractor: CategoryListInteractor {
    private let apiService: ApiService
    
    init(apiService: ApiService) {
        self.apiService = apiService
    }
    
    func loadCategories(completion: @escaping ([Category], Error?) -> Void) {
        apiService.loadCategories(completion: completion)
    }
}
