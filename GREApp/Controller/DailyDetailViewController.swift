//
//  DailyDetailViewController
//  GREApp
//
//  Created by 홍창남 on 2017. 7. 16..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit

class DailyDetailViewController: UIViewController {
    
    var pageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func closeBtnTapped(_ sender: UIButton) {
        
        let alert: UIAlertController = UIAlertController(title: "돌아가기", message: "여기서 끝낼 경우 오늘의 단어가 완료되지 않습니다.", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .destructive, handler: {_ in
            self.dismiss(animated: true, completion: nil)
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: {_ in
            alert.dismiss(animated: true, completion: nil)
        })
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
}

