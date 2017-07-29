//
//  GREAppTests.swift
//  GREAppTests
//
//  Created by 홍창남 on 2017. 7. 29..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import XCTest
@testable import GREApp

class GREAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testWord() {
        let ad = UIApplication.shared.delegate as? AppDelegate
        let context = ad?.persistentContainer.viewContext
        
        let word = Word(context: context!)
        
        word.wordId = 1
        word.title = "abalone"
        word.meaning = "전복"
        
    }
//    func testUser() {
//        let user = UserDefaults.standard.object(forKey: <#T##String#>)
//    }
    
}
