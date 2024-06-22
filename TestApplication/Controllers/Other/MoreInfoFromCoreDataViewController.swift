//
//  MoreInfoFromCoreDataViewController.swift
//  TestApplication
//
//  Created by Ilya Schevchenko on 22.06.2024.
//

import UIKit

class MoreInfoFromCoreDataViewController: UIViewController {

    let article: ArticleCoreData
    
    let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        return image
    }()
    
    let sourceTitle: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 22, weight: .semibold)
        title.textAlignment = .center
        return title
    }()
    
    let publishedDateLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    let updatedDateLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    let sectionLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    let abstractLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let imageSecond: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        return image
    }()
    
    init(article: ArticleCoreData) {
        self.article = article
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = article.title
        view.backgroundColor = .systemBackground
        
        configure()
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.down"), style: .done, target: self, action: nil)
        
        view.addSubview(image)
        view.addSubview(sourceTitle)
        view.addSubview(publishedDateLable)
        view.addSubview(updatedDateLable)
        view.addSubview(sectionLable)
        view.addSubview(abstractLable)
    }
    
    private func configure() {
        //
        //  image
        //
        image.frame = CGRect(x: Int(view.frame.width/2)-200, y: 100, width: 400, height: 400)
        
        let data: Data?
        data = article.coreImage
        if let image = UIImage(data: data!) {
            self.image.image = image
        } else {
            print("Failed to convert data to UIImage.")
        }
        
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOpacity = 0.7
        image.layer.shadowOffset = CGSize(width: 1, height: 3)
        image.layer.shadowRadius = 8
        image.layer.masksToBounds = false
        
        //
        // source title
        //
        
        sourceTitle.text = article.source
        sourceTitle.frame = CGRect(
            x: Int(0),
            y: Int(image.frame.maxY+5),
            width: Int(view.frame.width),
            height: 40
        )
        
        //
        //  published label
        //
        publishedDateLable.text = "Publised: \(article.publishedDate)"
        publishedDateLable.frame = CGRect(x: 5, y: sourceTitle.frame.maxY+10, width: view.frame.width, height: 30)
        
        //
        //  updatedDateLable
        //
        updatedDateLable.text = "Updated: \(article.updatedDate)"
        updatedDateLable.frame = CGRect(x: 5, y: publishedDateLable.frame.maxY+10, width: view.frame.width, height: 30)
        
        //
        // sectionLable
        //
        sectionLable.text = "Section: \(article.section)"
        sectionLable.frame = CGRect(x: 5, y: updatedDateLable.frame.maxY+10, width: view.frame.width, height: 30)
        
        //
        //  abstractLable
        //
        abstractLable.text = article.abstarct
        abstractLable.frame = CGRect(x: 5, y: sectionLable.frame.maxY+10, width: view.frame.width-5, height: 100)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }

}
