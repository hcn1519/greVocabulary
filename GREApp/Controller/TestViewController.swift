//
//  TestViewController.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 9. 5..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit
import RealmSwift

class TestViewController: UIViewController {

    // 여기서 테스트를 시작하기 전 데이터 nil 체크 필요
    let pageDataSource = PageDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        pageDataSource.setWords(date: nil, isOnlyWrongWords: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "testStartSegue" {
            if let destination = segue.destination as? TestPageViewController {
                if let onlyWrongWords = sender as? Bool {
                    destination.isOnlyWrongWords = onlyWrongWords
                }
            }
        }
    }

    @IBAction func testAllWordTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "testStartSegue", sender: false)
    }

    @IBAction func testWrongWordTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "testStartSegue", sender: true)
    }

}

