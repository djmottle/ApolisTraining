//
//  AddViewModel.swift
//  LuluLemonCopy
//
//  Created by David Mottle on 10/14/21.
//

import UIKit

class AddViewModel {
    
    let apiManager = APIManager.shared
    
    func saveDataToDB(name: String) {
        apiManager.saveGarment(name: name)
    }
        

}
