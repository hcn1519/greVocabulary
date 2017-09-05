//
//  TestViewController.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 9. 5..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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

