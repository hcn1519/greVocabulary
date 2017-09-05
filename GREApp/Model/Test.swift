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
    dynamic var testId = 0
    dynamic var problemCount = 0
    dynamic var rightAnswer = 0
    dynamic var createDate: Date? = Date()

    override class func primaryKey() -> String? {
        return "testId"
    }

}
