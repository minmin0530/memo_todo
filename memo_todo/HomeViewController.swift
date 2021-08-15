//
//  HomeViewController.swift
//  memo_todo
//
//  Created by izumiyoshiki on 2021/08/14.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var realm: Realm!
    private var itemList: Results<Item>?
    @IBOutlet weak var tableView: UITableView!
    private var refreshControl: UIRefreshControl?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()
        itemList = realm.objects(Item.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.refreshTable), for: UIControl.Event.valueChanged)
        self.refreshControl = refreshControl
        
        tableView.addSubview(self.refreshControl!)

    }
    @objc func refreshTable() {
        realm = try! Realm()
        itemList = realm.objects(Item.self)
        tableView.reloadData()
        refreshControl!.endRefreshing()
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let doneAction = UIContextualAction(style: .normal, title: "✔️") { (action, view, completionHandler) in

            try! self.realm.write {
                self.itemList![indexPath.row].itemState = Item.State.done.rawValue
            }
            tableView.reloadData()
            self.refreshControl!.endRefreshing()

            completionHandler(true)
        }
        doneAction.backgroundColor = .green

        let progressAction = UIContextualAction(style: .destructive, title: "・・・") { (action, view, completionHandler) in

            try! self.realm.write {
                self.itemList![indexPath.row].itemState = Item.State.progress.rawValue
            }
            tableView.reloadData()
            self.refreshControl!.endRefreshing()

            completionHandler(true)
        }
        progressAction.backgroundColor = .blue

        return UISwipeActionsConfiguration(actions: [progressAction, doneAction])
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        try! realm.write {
            realm.delete(itemList![indexPath.row])
        }
        itemList = realm.objects(Item.self)

        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.personName.text = itemList![indexPath.row].title
        cell.timeLabel.text = itemList![indexPath.row].time
        cell.personImage.image = UIImage(systemName: itemList![indexPath.row].itemState)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemList!.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
