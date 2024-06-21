//
//  SharedViewController.swift
//  TestApplication
//
//  Created by Ilya Schevchenko on 20.06.2024.
//

import UIKit

class SharedViewController: UIViewController {
    
    private let collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { _, _ -> NSCollectionLayoutSection? in
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            
            item.contentInsets = NSDirectionalEdgeInsets(
                top: 2,
                leading: 2,
                bottom: 2,
                trailing: 2
            )
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(220)),
                subitem: item,
                count: 2
            )
            
            group.contentInsets = NSDirectionalEdgeInsets(
                top: 10,
                leading: 0,
                bottom: 10,
                trailing: 0
            )
            
            return NSCollectionLayoutSection(group: group)
        })
    )
    
    private var results = [Results]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Most Shared"
        view.backgroundColor = .systemBackground
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        collectionView.register(PreviewArticleCollectionViewCell.self, forCellWithReuseIdentifier: PreviewArticleCollectionViewCell.identifire)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    func fetchData() {
        ApiCaller.shared.getMostShared { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    self?.results = results
                    self?.collectionView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
    }
}
extension SharedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewArticleCollectionViewCell.identifire, for: indexPath) as? PreviewArticleCollectionViewCell else {
            return UICollectionViewCell()
        }
        let countOfResult = self.results.count
        let title = self.results[indexPath.row].title
        let imageUrl = results[indexPath.row].media.first?.metaData[0].url
        

        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.7
        cell.layer.shadowOffset = CGSize(width: 1, height: 3)
        cell.layer.shadowRadius = 8
        cell.layer.masksToBounds = false
        
        cell.configure(with: title, imageUrl: imageUrl)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let article = results[indexPath.row]
        let vc = MoreInfoViewController(article: article)
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
}
