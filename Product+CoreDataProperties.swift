//
//  Product+CoreDataProperties.swift
//  A2_iOS_Anna_101399925
//
//  Created by Anna on 26.03.25.
//
//

import Foundation
import CoreData


extension ProductObj {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductObj> {
        return NSFetchRequest<ProductObj>(entityName: "Product")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var desc: String?
    @NSManaged public var price: Double
    @NSManaged public var provider: String?

}

extension ProductObj : Identifiable {

}
