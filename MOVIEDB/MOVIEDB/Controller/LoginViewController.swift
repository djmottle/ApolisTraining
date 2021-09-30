//
//  LoginViewController.swift
//  MOVIEDB
//
//  Created by David Mottle on 9/27/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernamelabel: UILabel!
    @IBOutlet weak var passwordlabel: UILabel!
   
    @IBOutlet weak var textfield1: UITextField!
    @IBOutlet weak var textfield2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernamelabel.isHidden = true
        passwordlabel.isHidden = true
    }

    @IBAction func LoginBtn(_ sender: Any) {
        if (textFieldShouldReturn(textfield1)) {
            usernamelabel.isHidden = true
            if (textFieldShouldReturn(textfield2)) {
                passwordlabel.isHidden = true
                let st = UIStoryboard.init(name: "Main", bundle: nil)
                if let vc = st.instantiateViewController(identifier: "MovieListViewController") as? MovieListViewController {
                    self.navigationController?.pushViewController(vc, animated: true)
                }
               
                
            } else {
                passwordlabel.isHidden = false
            }
        } else {
            usernamelabel.isHidden = false
        }
    }
    
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        if 6 > (textField.text?.count ?? 0) {
            return false
        }
        return true
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


