//
//  Item.swift
//  memo_todo
//
//  Created by izumiyoshiki on 2021/08/14.
//

import RealmSwift


class Item: Object {
    @objc dynamic var title = ""
    @objc dynamic var time = ""
    @objc dynamic var itemState = ""

    var type: State {
        get { return State(rawValue: itemState) ?? .start }
        set { itemState = newValue.rawValue }
    }
    enum State: String {
        case done = "checkmark"
        case progress = "ellipsis"
        case start = "minus"
    }
}
