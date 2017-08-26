//
//  Day+CoreDataProperties.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 8. 26..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import Foundation
import CoreData


extension Day {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Day> {
        return NSFetchRequest<Day>(entityName: "Day")
    }

    @NSManaged public var dateNumber: Int16
    @NSManaged public var dayId: Int16
    @NSManaged public var isFinished: Bool
    @NSManaged public var toWord: NSSet?

}

// MARK: Generated accessors for toWord
extension Day {

    @objc(addToWordObject:)
    @NSManaged public func addToToWord(_ value: Word)

    @objc(removeToWordObject:)
    @NSManaged public func removeFromToWord(_ value: Word)

    @objc(addToWord:)
    @NSManaged public func addToToWord(_ values: NSSet)

    @objc(removeToWord:)
    @NSManaged public func removeFromToWord(_ values: NSSet)

}
