//
//  ViewController.swift
//  NewYorkFetch
//
//  Created by David Mottle on 10/15/21.
//

import UIKit

class ViewController: UIViewController {

    let vm = ViewModel.init()
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        vm.get {
            DispatchQueue.main.async {
                self.tblView.reloadData()
            }
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell
    
        cell?.setData(name: vm.getTitle(index: indexPath.row) ?? "", byline: vm.getByline(index: indexPath.row) ?? "", date: vm.getDate(index: indexPath.row) ?? "")
        return cell ?? TableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        if let vc = st.instantiateViewController(withIdentifier: "WebViewVC") as? WebViewVC {
            vc.url = vm.getURL(index: indexPath.row)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

