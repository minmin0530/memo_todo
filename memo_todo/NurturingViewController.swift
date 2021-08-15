//
//  NurturingViewController.swift
//  memo_todo
//
//  Created by izumiyoshiki on 2021/08/14.
//

import UIKit
import SpriteKit

class NurturingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            if let scene = SKScene(fileNamed: "GameScene") {
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            }
        }
    }
}
