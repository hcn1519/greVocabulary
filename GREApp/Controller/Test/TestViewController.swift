//
//  TestViewController.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 9. 5..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit
import RealmSwift

/// 테스트 시작 페이지
class TestViewController: UIViewController {

    let pageDataSource = PageDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "testStartSegue" {
            if let destination = segue.destination as? TestPageViewController {
                if let isOnlyWrongWords = sender as? Bool {
                    pageDataSource.setWords(date: nil, isOnlyWrongWords: isOnlyWrongWords)
                    destination.pageDataSource = pageDataSource
                }
            }
        }
    }

    @IBAction func testAllWordsTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "testStartSegue", sender: false)
    }

    @IBAction func testWrongWordTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "testStartSegue", sender: true)
    }

}

