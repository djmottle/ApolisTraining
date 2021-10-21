//
//  CustomView.swift
//  LuluLemonCopy
//
//  Created by David Mottle on 10/17/21.
//

import UIKit

class CustomView: UIView, UITableViewDelegate, UITableViewDataSource {

    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortOrder: UISegmentedControl!
    
    let listVM = ListViewModel()
    
    //init() {
    //    sortOrder.setcolor()
     //   sortOrder.setBorder()
   // }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listVM.getGarmentCount()
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = listVM.getGarmentName(index: indexPath.row)
        return cell
    }
    

}

