//
//  DailyPageViewController.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 7. 16..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit
import RealmSwift

class DailyPageViewController: UIPageViewController {

    var date: Int?

    let realm = try! Realm()

    var todayWords: Results<Word>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        generateTestWords()

        self.dataSource = self
        
        self.setViewControllers([getViewControllerAtIndex(index: 0)] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        
        removeSwipeGesture()


        todayWords = realm.objects(Word.self).filter("dayId == %d", date!)

    }

}

extension DailyPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let pageContent: DailyDetailViewController = viewController as! DailyDetailViewController
        var index = pageContent.pageIndex
        if ((index == 0) || (index == NSNotFound)) {
            return nil
        }
        index -= 1;
        return getViewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let pageContent: DailyDetailViewController = viewController as! DailyDetailViewController
        var index = pageContent.pageIndex
        if (index == NSNotFound) {
            return nil;
        }
        index += 1;
        if (index == 30) {
            return nil;
        }
        
        return getViewControllerAtIndex(index: index)
    }
    
    // cellForRow와 같은 데이터 다루기
    func getViewControllerAtIndex(index: NSInteger) -> DailyDetailViewController {
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "DailyDetailViewController") as! DailyDetailViewController

        let indexPath = IndexPath(item: index, section: 0)

        pageContentViewController.pageIndex = index
        pageContentViewController.word = todayWords[indexPath.row]
        
        pageContentViewController.parentController = self
        
        return pageContentViewController
    }
    
}

extension DailyPageViewController {
    func goToNextPage(){
        
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let nextViewController = dataSource?.pageViewController( self, viewControllerAfter: currentViewController ) else { return }
        
        setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
    }
    
    
    func goToPreviousPage(){
        
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let previousViewController = dataSource?.pageViewController( self, viewControllerBefore: currentViewController ) else { return }
        
        setViewControllers([previousViewController], direction: .reverse, animated: true, completion: nil)
    }
    
    func removeSwipeGesture(){
        for view in self.view.subviews {
            if let subView = view as? UIScrollView {
                subView.isScrollEnabled = false
            }
        }
    }
}
