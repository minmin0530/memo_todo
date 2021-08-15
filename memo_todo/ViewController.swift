//
//  ViewController.swift
//  memo_todo
//
//  Created by izumiyoshiki on 2021/08/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        let nextVC = storyboard?.instantiateViewController(identifier: "MainTabBarController") as! MainTabBarController
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
}

