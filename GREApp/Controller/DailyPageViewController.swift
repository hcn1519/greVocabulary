//
//  DailyPageViewController.swift
//  GREApp
//
//  Created by 홍창남 on 2017. 7. 16..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit

class DailyPageViewController: UIPageViewController {
    
    var arrPageTitle: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrPageTitle = ["a", "b", "c"]
        self.dataSource = self
        
        self.setViewControllers([getViewControllerAtIndex(index: 0)] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
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
        if (index == arrPageTitle.count) {
            return nil;
        }
        
        return getViewControllerAtIndex(index: index)
    }
    
    func getViewControllerAtIndex(index: NSInteger) -> DailyDetailViewController {
        // Create a new view controller and pass suitable data.
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "DailyDetailViewController") as! DailyDetailViewController
        
        pageContentViewController.pageIndex = index
        return pageContentViewController
    }
}
