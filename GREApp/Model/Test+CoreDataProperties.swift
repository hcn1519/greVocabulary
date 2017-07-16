//
//  Test+CoreDataProperties.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 7. 16..
//  Copyright © 2017년 홍창남. All rights reserved.
//
//

import Foundation
import CoreData


extension Test {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Test> {
        return NSFetchRequest<Test>(entityName: "Test")
    }

    @NSManaged public var testDate: NSDate?
    @NSManaged public var testScore: Int16
    @NSManaged public var toWord: NSSet?

}

// MARK: Generated accessors for toWord
extension Test {

    @objc(addToWordObject:)
    @NSManaged public func addToToWord(_ value: Word)

    @objc(removeToWordObject:)
    @NSManaged public func removeFromToWord(_ value: Word)

    @objc(addToWord:)
    @NSManaged public func addToToWord(_ values: NSSet)

    @objc(removeToWord:)
    @NSManaged public func removeFromToWord(_ values: NSSet)

}
