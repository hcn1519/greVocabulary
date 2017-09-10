//
//  DailyCoverViewController.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 7. 16..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit
import RealmSwift

// Learning Day 1 페이지
class DailyCoverViewController: UIViewController {
    
    var date: Int?
    let realm = try! Realm()

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dayStartBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "Learning Day \(date!)"


    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if stackView.arrangedSubviews.count < 3 {
            if let today = realm.object(ofType: Day.self, forPrimaryKey: date!) {
                if today.isFinished {

                    let label = UILabel()
                    label.text = "해당 날짜의 단어는 이미 공부했습니다."
                    label.textColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
                    label.font = UIFont(name: "Helvetica Neue", size: 14)
                    stackView.addArrangedSubview(label)

                    dayStartBtn.setTitle("굳이 또 하기", for: .normal)
                } else {
                    dayStartBtn.setTitle("시작하기", for: .normal)
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dayStartSegue" {
            if let destination = segue.destination as? DailyPageViewController {
                destination.date = date!
            }
        }
    }
}
