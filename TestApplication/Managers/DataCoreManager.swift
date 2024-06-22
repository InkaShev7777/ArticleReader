//
//  DataCoreManager.swift
//  TestApplication
//
//  Created by Ilya Schevchenko on 22.06.2024.
//

import Foundation
import CoreData
import UIKit

public final class DataCoreManager: NSObject {
    static let shared = DataCoreManager()
    
    private override init() {}
    
    private var appDeletate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDeletate.persistentContainer.viewContext
    }
    
    public func createArticleDataCore(_ id: Int64, title: String, previewImage: String) {
        guard let articleCoreDataDescription = NSEntityDescription.entity(forEntityName: "ArticleCoreData", in: context) else {
            return
        }
        let articleCoreData = ArticleCoreData(entity: articleCoreDataDescription, insertInto: context)
        articleCoreData.id = id
        articleCoreData.title = title
        
        guard let urlFromString = URL(string: previewImage) else {
            return
        }
        
        URLSession.shared.dataTask(with: urlFromString) { [weak self] data, _, error in
                    guard let self = self else { return }

                    if let error = error {
                        print("Failed to fetch image data:", error)
                        return
                    }
                    guard let data = data else {
                        print("No data received.")
                        return
                    }

                    // Save image data to Core Data on the main thread
                    DispatchQueue.main.async {
                        articleCoreData.previewImage = data
                        self.appDeletate.saveContext()
                    }
                }.resume()
    }
    
    public func fetchArticlesCoreData() -> [ArticleCoreData]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ArticleCoreData")
        
        do {
            return try? context.fetch(fetchRequest) as [ArticleCoreData]
        }
    }
}
