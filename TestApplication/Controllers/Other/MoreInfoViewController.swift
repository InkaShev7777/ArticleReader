//
//  MoreInfoViewController.swift
//  TestApplication
//
//  Created by Ilya Schevchenko on 21.06.2024.
//

import UIKit

class MoreInfoViewController: UIViewController {
    let article: Results
    
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
    
    init(article: Results) {
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
        var imageUrl = ""
        if article.media.count > 0 {
            if article.media[0].metaData[2].url != "" {
                imageUrl = article.media[0].metaData[2].url
            }
        }
        else {
            imageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqrEjjUHn9M9TT65gTVLXc_rN6ry5TraQf4w&s"
        }
        
        if let url = URL(string: imageUrl) {
            image.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"), options: .continueInBackground, completed: nil)
        }
        
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
        updatedDateLable.text = "Updated: \(article.updated)"
        updatedDateLable.frame = CGRect(x: 5, y: publishedDateLable.frame.maxY+10, width: view.frame.width, height: 30)
        
        //
        // sectionLable
        //
        sectionLable.text = "Section: \(article.section)"
        sectionLable.frame = CGRect(x: 5, y: updatedDateLable.frame.maxY+10, width: view.frame.width, height: 30)
        
        //
        //  abstractLable
        //
        abstractLable.text = article.abstract
        abstractLable.frame = CGRect(x: 5, y: sectionLable.frame.maxY+10, width: view.frame.width-5, height: 100)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }

}
