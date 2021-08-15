//
//  GameScene.swift
//  memo_todo
//
//  Created by izumiyoshiki on 2021/08/15.
//

import SpriteKit
import RealmSwift

class GameScene: SKScene {
    private var realm: Realm!
    private var itemList: Results<Item>?
    
    private var scale: CGFloat = 1.0
    private var rotate: CGFloat = 0.0
    private var translate: CGFloat = 0.0

    private var scaleSpeed: CGFloat = 0.004
    private var rotateSpeed: CGFloat = 0.02
    private var translateSpeed: CGFloat = 4.0

    let chara: SKSpriteNode = SKSpriteNode(imageNamed: "memoman.png")
    override func didMove(to view: SKView) {
        self.backgroundColor = .red
        
        realm = try! Realm()
        itemList = realm.objects(Item.self)
        var count: Int = 1
        itemList?.forEach({ item in
            if item.itemState == Item.State.done.rawValue {
                count += 1
            }
        })


        
        
        
        addChild(chara)
    }
    override func update(_ currentTime: TimeInterval) {
        scale += scaleSpeed
        if scale >= 3.0 || scale < 0.2 {
            scaleSpeed *= -1
        }
        chara.xScale = CGFloat(scale)
        chara.yScale = CGFloat(scale)
        
        rotate += rotateSpeed
        if rotate >= 6 || rotate <= -6 {
            rotateSpeed *= -1
        }
        chara.zRotation = rotate
        
        translate += translateSpeed
        if translate >= 400 || translate <= -400 {
            translateSpeed *= -1
        }
        chara.position.y = translate
    }
}
