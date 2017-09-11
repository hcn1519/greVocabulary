//
//  SettingListViewController.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 9. 10..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit


class SettingListViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.tintColor = UIColor(red: 78/255, green: 186/255, blue: 74/255, alpha: 1.0)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MyTalkSegue" {
            if let destination = segue.destination as? SettingMyTalkViewController {
                destination.myString = "안녕하세요, 앱 개발자입니다. 먼저 굳이 인사말을 봐주셔서 감사합니다. 😀\n\n 이 앱은 GRE 단어를 공부하시는 분들이 좀 더 수월하게 단어 공부를 할 수 있었으면 하는 마음에서 제작한 앱입니다.(실상은 이 앱의 디자이너가 GRE를 공부해서 만들었습니다. 😂) 앱에 들어가 있는 단어 데이터는 디자이너분이 모르는 단어들을 하나씩 정리한 자료를 기반으로 구성되어 있으며, 현재는 1500개의 단어가 앱에 들어가 있습니다.📚\n\n이 앱은 GRE 단어를 공부하는 분들이 단어를 잘 암기할 수 있도록 매일매일 공부하고, 공부한 단어를 테스트하는 형태로 구성되어 있습니다. 단어와 새로운 기능들은 지속적으로 추가될 예정입니다. 앱 개발에 대한 의견이나 추가되었으면 하는 내용들은 앱 리뷰에 남겨주시면, 확인하여 빠른 시일내에 업데이트하도록 노력하겠습니다. 개미는 뜐뜐 🐜....🐜.... . .   ."
            }
        } else if segue.identifier == "UpdateScheduleSegue" {
            if let destination = segue.destination as? SettingMyTalkViewController {
                destination.myString = "Comming Soon\n\n공부한 단어들에 대해 테스트를 볼 수 있는 탭이 곧 업데이트 될 예정입니다. 개미는 뜐뜐 🐜....🐜.... . .   ."
            }
        }
    }
}

extension SettingListViewController {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}
