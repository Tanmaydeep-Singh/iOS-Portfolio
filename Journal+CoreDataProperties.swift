//
//  Journal+CoreDataProperties.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 28/01/26.
//
//

public import Foundation
public import CoreData


public typealias JournalCoreDataPropertiesSet = NSSet

extension Journal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Journal> {
        return NSFetchRequest<Journal>(entityName: "Journal")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var body: String?
    @NSManaged public var date: Date?

}

extension Journal : Identifiable {

}
