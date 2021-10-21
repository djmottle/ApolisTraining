//
//  AddViewController.swift
//  LuluLemonCopy
//
//  Created by David Mottle on 10/14/21.
//

import UIKit
import CoreData

class AddViewController: UIViewController {

    @IBOutlet weak var addField: UITextField!
    var completionHandler: (()->Void)?
    let addVM = AddViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.rightBarButtonItem?.title = "Save"
       // self.navigationController?.title = "ADD"
        self.navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
    }
    @IBAction func saveBtn(_ sender: Any) {
        if let name = addField.text?.capitalized {
            if name.count > 0 {
                addVM.saveDataToDB(name: name)
                completionHandler?()
            }
        }
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}
