//
//  CategoryListViewController.swift
//  E Store
//
//  Created by Bayu Yasaputro on 14/10/23.
//

import UIKit
import Kingfisher

protocol CategoryListView: AnyObject {
    func reloadData()
}


class CategoryListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var categoryList: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
        loadCategories()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    func setup() {
        title = "Category List"
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func loadCategories() {
        ApiService.shared.loadCategories { categories, error in
            if let error = error {
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true)
            } else {
                self.categoryList = categories
                self.tableView.reloadData()
            }
        }
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}

extension CategoryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let category = categoryList[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Product", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ProductListViewController") as! ProductListViewController
        viewController.category = category
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension CategoryListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom_category_cell", for: indexPath) as! CategoryViewCell
        
        let category = categoryList[indexPath.row]
        cell.nameLabel.text = category.name
        cell.thumbImageView.kf.setImage(with: URL(string: category.image))
        
//        ApiService.shared.loadImage(urlString: category.image) { image in
//            cell.thumbImageView.image = image
//        }
        
        return cell
    }
}
