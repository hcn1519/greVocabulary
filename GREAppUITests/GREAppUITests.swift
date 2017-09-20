//
//  GREAppUITests.swift
//  GREAppUITests
//
//  Created by 홍창남 on 2017. 9. 11..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import XCTest

class GREAppUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        
        continueAfterFailure = false

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSnapshot() {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        let cellsQuery = app.collectionViews.cells
        cellsQuery.otherElements.containing(.staticText, identifier:"Day 8").element.swipeUp()

        snapshot("01-main")
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element.swipeUp()
        cellsQuery.otherElements.containing(.staticText, identifier:"Day 14").element.tap()

        snapshot("02-dailyCover")

        app.buttons["시작하기"].tap()

        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.children(matching: .other).element(boundBy: 0).tap()

        element.tap()

        snapshot("03-dailyWord")

        app.buttons["x"].tap()
        app.alerts["메인 화면으로"].buttons["끝내기"].tap()
        app.tabBars.buttons["Settings"].tap()

        snapshot("04-setting")

        app.tables.staticTexts["읽어도 그만.. 안 읽어도 그만.."].tap()
        app.navigationBars["GREApp.SettingMyTalkView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()

    }
    
}
