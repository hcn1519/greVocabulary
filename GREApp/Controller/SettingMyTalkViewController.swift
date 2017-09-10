//
//  SettingMyTalkViewController.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 9. 10..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit

class SettingMyTalkViewController: UIViewController {

    @IBOutlet weak var myTalkLabel: UILabel!

    var myString: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        myTalkLabel.text = myString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
