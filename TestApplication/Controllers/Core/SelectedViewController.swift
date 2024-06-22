//
//  SelectedViewController.swift
//  TestApplication
//
//  Created by Ilya Schevchenko on 20.06.2024.
//

import UIKit

class SelectedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Selected"
        view.backgroundColor = .systemBackground
        
        fetchData()
    }
    
    var articles = [ArticleCoreData]()
    
    private func fetchData() {
//        DataCoreManager.shared.createArticleDataCore(1, title: "Tets Id")
        articles = DataCoreManager.shared.fetchArticlesCoreData() ?? []
        print(articles[0].title)
    }
}
