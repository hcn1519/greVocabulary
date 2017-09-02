//
//  Day.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 9. 2..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import Foundation
import RealmSwift

class Day: Object {
    dynamic var dayId = 0
    dynamic var isFinished = false
    dynamic var finishedDate = Date()
}
