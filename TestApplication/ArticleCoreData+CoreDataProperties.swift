//
//  ArticleCoreData+CoreDataProperties.swift
//
//
//  Created by Ilya Schevchenko on 22.06.2024.
//
//

import Foundation
import CoreData


@objc(ArticleCoreData)
public class ArticleCoreData: NSManagedObject {}


extension ArticleCoreData {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleCoreData> {
        return NSFetchRequest<ArticleCoreData>(entityName: "ArticleCoreData")
    }
    
    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    
}
