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
    
    public func createArticleDataCore(
        _ id: Int64,
        title: String,
        abstract: String,
        section: String,
        source: String,
        updated: String,
        publishedDate: String,
        previewImage: String,
        coreImage: String
    ) -> Bool {
        
        if !isExistArticle(id) {
            guard let articleCoreDataDescription = NSEntityDescription.entity(forEntityName: "ArticleCoreData", in: context) else {
                return false
            }
            let articleCoreData = ArticleCoreData(entity: articleCoreDataDescription, insertInto: context)
            articleCoreData.id = Int64(id)
            articleCoreData.title = title
            articleCoreData.abstarct = abstract
            articleCoreData.publishedDate = publishedDate
            articleCoreData.section = section
            articleCoreData.source = source
            articleCoreData.updatedDate = updated
            
            
            guard let urlFromString = URL(string: previewImage) else {
                return false
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
                
                DispatchQueue.main.async {
                    articleCoreData.previewImage = data
                    self.appDeletate.saveContext()
                }
            }.resume()
            
            guard let urlFromStringCoreImage = URL(string: coreImage) else {
                return false
            }
            
            URLSession.shared.dataTask(with: urlFromStringCoreImage) { [weak self] data, _, error in
                guard let self = self else { return }
                
                if let error = error {
                    print("Failed to fetch image data:", error)
                    return
                }
                guard let data = data else {
                    print("No data received.")
                    return
                }
                
                DispatchQueue.main.async {
                    articleCoreData.coreImage = data
                    self.appDeletate.saveContext()
                }
            }.resume()
            
            return true
        } else {
            return false
        }
    }
    
    public func fetchArticlesCoreData() -> [ArticleCoreData]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ArticleCoreData")
        
        do {
            return try? context.fetch(fetchRequest) as [ArticleCoreData]
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public func deleteArticleById(_ id: Int64){
        
    }
    
    private func isExistArticle(_ id: Int64) -> Bool {
        guard let articles = fetchArticlesCoreData() else { return false}
        
        for item in articles {
            if item.id == id {
                return true
            }
        }
        return false
    }
}
