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
                destination.pageDataSource = pageDataSource
            }
        }
    }

    @IBAction func testAllWordsTapped(_ sender: UIButton) {
        pageDataSource.updateWords { [weak self] in
            guard let `self` = self else { return }

            self.pageDataSource.setWords(date: nil, isOnlyWrongWords: false)
            if self.pageDataSource.testWords.count != 0 {
                self.performSegue(withIdentifier: "testStartSegue", sender: false)
            } else {

                let alert: UIAlertController = UIAlertController(title: "단어 부족",
                                                                 message: "공부를 완료한 단어가 없어요.", preferredStyle: .alert)

                let ok = UIAlertAction(title: "OK", style: .default, handler: {_ in
                    self.dismiss(animated: true) {
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                })

                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            }
        }

    }

    @IBAction func testWrongWordTapped(_ sender: UIButton) {
        pageDataSource.setWords(date: nil, isOnlyWrongWords: true)
        performSegue(withIdentifier: "testStartSegue", sender: true)
    }

}

