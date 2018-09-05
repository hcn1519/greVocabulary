//
//  WordListViewController.swift
//  GREApp
//
//  Created by 홍창남 on 2018. 9. 5..
//  Copyright © 2018년 홍창남. All rights reserved.
//

import UIKit

class WordListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let pageDataSource = PageDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        pageDataSource.setWords(date: nil, isOnlyWrongWords: true, isListing: true)
        tableView.dataSource = self
    }
}

extension WordListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pageDataSource.getWords?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WordListCell {
            if let words = pageDataSource.getWords {
                cell.configureCell(word: words[indexPath.row])
            }
            return cell
        }
        return UITableViewCell()
    }
}
