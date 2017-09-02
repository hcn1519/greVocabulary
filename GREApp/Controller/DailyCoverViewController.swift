//
//  DailyCoverViewController.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 7. 16..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit
import CoreData

// Learning Day 1 페이지
class DailyCoverViewController: UIViewController {
    
    var date: Int?
    var wordList: [Word] = []

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "Learning Day \(date!)"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dayStartSegue" {
            if let destination = segue.destination as? DailyPageViewController {
                destination.date = date!
            }
        }
    }
}

