//
//  Test.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 9. 5..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import Foundation
import RealmSwift

class Test: Object {
    @objc dynamic var testId = 0
    @objc dynamic var problemCount = 0
    @objc dynamic var rightAnswer = 0
    @objc dynamic var createDate: Date? = Date()

    override class func primaryKey() -> String? {
        return "testId"
    }

}
