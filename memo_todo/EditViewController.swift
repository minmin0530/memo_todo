//
//  EditViewController.swift
//  memo_todo
//
//  Created by izumiyoshiki on 2021/08/14.
//

import UIKit
import RealmSwift

class EditViewController: UIViewController {
    private var realm: Realm!
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var time: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = try! Realm()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        let item: Item = Item()
        item.title = titleText.text!
        item.time = time.date.toStringWithCurrentLocale()
        item.itemState = Item.State.progress.rawValue
        print(item.time)
        
        try! realm.write {
            realm.add(item)
        }
        
        tabBarController?.selectedViewController = tabBarController?.viewControllers![0]
        tabBarController?.selectedViewController?.loadView()
        tabBarController?.selectedViewController?.viewDidLoad()

    }
    
}
