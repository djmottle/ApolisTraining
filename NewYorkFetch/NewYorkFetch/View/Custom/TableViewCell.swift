//
//  TableViewCell.swift
//  NewYorkFetch
//
//  Created by David Mottle on 10/15/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var bylineLbl: UILabel!
    @IBOutlet weak var datelbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLbl.numberOfLines = 0
    }
    
    func setData(name: String, byline: String, date: String) {
        nameLbl.text = name
        bylineLbl.text = byline
        datelbl.text = date
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
