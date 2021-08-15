//
//  MainTabBarController.swift
//  memo_todo
//
//  Created by izumiyoshiki on 2021/08/14.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
    }
}
extension MainTabBarController: UITabBarControllerDelegate {
    // TabBarItemが選択された時に呼ばれる
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        // TabBarItemタップでModal表示をする画面を指定して実装
        return true
    }
}
