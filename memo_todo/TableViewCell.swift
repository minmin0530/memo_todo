//
//  TableViewCell.swift
//  memo_todo
//
//  Created by izumiyoshiki on 2021/08/14.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        personName.text = "aaaaa"
        timeLabel.text = "2021/08/14 06:55"
    }
}
