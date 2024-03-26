//
//  ApiService.swift
//  E Store
//
//  Created by Bayu Yasaputro on 21/10/23.
//

import Foundation
import Moya
import RxSwift
import UIKit

class ApiService {
    static let shared: ApiService = ApiService()
    private init() { }
    
    private lazy var apiProvider: MoyaProvider<Api> = {
        return MoyaProvider<Api>()
    }()
    private let disposeBag = DisposeBag()
    
    func loadCategories(completion: @escaping (_ categories: [Category], Error?) -> Void) {
        apiProvider.rx.request(Api.categories)
            .map([Category].self)
            .subscribe { event in
                switch event {
                case .success(let categories):
                    completion(categories, nil)
                case .failure(let error):
                    completion([], error)
                }
            }
            .disposed(by: disposeBag)
    }
    
    
    func loadProducts(categoryId: Int, completion: @escaping (Result<[Product], Error>) -> Void) {
        apiProvider.rx.request(Api.products(categoryId))
            .map([Product].self)
            .subscribe { event in
                switch event {
                case .success(let products):
                    completion(.success(products))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
            .disposed(by: disposeBag)
    }
    
    /*
    func loadCategories(completion: @escaping (_ categories: [Category], Error?) -> Void) {
        let url = URL(string: "https://api.escuelajs.co/api/v1/categories")
        var request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let jsonData = data {
                do {
                    let categories = try JSONDecoder().decode([Category].self, from: jsonData)
                    DispatchQueue.main.async {
                        completion(categories, nil)
                    }
                } catch {
                    print(String(describing: error))
                    DispatchQueue.main.async {
                        completion([], error)
                    }
                }
            } else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Categories data is nil"])
                DispatchQueue.main.async {
                    completion([], error)
                }
            }
        }
        task.resume()
    }
     */
    
    /*
    func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        if let url = URL(string: urlString) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if let imageData = data {
                        let image = UIImage(data: imageData)
                        completion(image)
                    } else {
                        completion(nil)
                    }
                }
            }
        } else {
            completion(nil)
        }
    }
     */
}
