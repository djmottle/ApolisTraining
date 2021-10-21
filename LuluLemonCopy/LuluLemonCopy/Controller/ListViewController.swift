//
//  ViewController.swift
//  LuluLemonCopy
//
//  Created by David Mottle on 10/13/21.
//

import UIKit
import CoreData

class ListViewController: UIViewController {

    @IBOutlet weak var sortControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    let listVM = ListViewModel()

    @IBAction func goToAdd(_ sender: Any) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        if let vc = st.instantiateViewController(withIdentifier: "AddViewController") as? AddViewController {
            vc.completionHandler = {
                self.fetchAndReload()
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        sortControl.setcolor()
        sortControl.setBorder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchAndReload()
    }
    
    func fetchAndReload() {
        listVM.fetchDataFromDB(sortIndex: sortControl.selectedSegmentIndex)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @IBAction func changeSortOrder(_ sender: Any) {
        fetchAndReload()
    }
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listVM.getGarmentCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = listVM.getGarmentName(index: indexPath.row)
        return cell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { action, view, completionHander in
            self.listVM.deleteGarment(index: indexPath.row)
            self.fetchAndReload()
        }
    return UISwipeActionsConfiguration(actions: [action])
    }
    
}

extension UISegmentedControl {
    func setcolor() {
        self.layer.borderColor = UIColor.red.cgColor
    }
    func setBorder() {
        self.layer.borderWidth = 2.0
    }
}

