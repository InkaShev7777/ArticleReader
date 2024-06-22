//
//  PreviewArticleCollectionViewCell.swift
//  TestApplication
//
//  Created by Ilya Schevchenko on 21.06.2024.
//

import Foundation
import SDWebImage

class PreviewArticleCollectionViewCell: UICollectionViewCell {
    static let identifire = "PreviewArticleCollectionViewCell"
    
    private var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        image.layer.cornerRadius = 8
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.addSubview(imageView)
        contentView.addSubview(label)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = CGRect(x: 0, y: 0, width: Int(contentView.frame.width), height: Int(contentView.frame.height)-80)
        
        label.frame = CGRect(x: 10, y: Int(imageView.frame.height), width: Int(contentView.frame.width)-20, height: Int(contentView.frame.height-50)/2)
    }
    
    func configure(with title: String, imageUrl: String?) {
        label.text = title
        if let url = URL(string: imageUrl ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqrEjjUHn9M9TT65gTVLXc_rN6ry5TraQf4w&s") {
            imageView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"), options: .continueInBackground, completed: nil)
        }
    }
    
    func configureFromCoreData(with title: String?, data: Data?) {
        label.text = title
        guard let data = data else {
            return
        }
        if let image = UIImage(data: data) {
            imageView.image = image
        } else {
            print("Failed to convert data to UIImage.")
        }
    }
}
