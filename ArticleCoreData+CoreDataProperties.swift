//
//  ArticleCoreData+CoreDataProperties.swift
//  
//
//  Created by Ilya Schevchenko on 22.06.2024.
//
//

import Foundation
import CoreData


extension ArticleCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleCoreData> {
        return NSFetchRequest<ArticleCoreData>(entityName: "ArticleCoreData")
    }

    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    @NSManaged public var previewImage: Data
    @NSManaged public var coreImage: Data
    @NSManaged public var source: String
    @NSManaged public var publishedDate: String
    @NSManaged public var updatedDate: String
    @NSManaged public var section: String
    @NSManaged public var abstract: String

}
