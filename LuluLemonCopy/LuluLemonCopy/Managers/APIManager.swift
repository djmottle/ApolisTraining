//
//  APIManager.swift
//  LuluLemonCopy
//
//  Created by David Mottle on 10/14/21.
//

import UIKit

class APIManager {
    static let shared = APIManager()
    
    private init() {}
    
    let db = DBManager.shared
    
    func fetchDataFromDB(sort: NSSortDescriptor, completionHandler: @escaping ([Garment])->()) {
        let garments = db.fetchGarments(sort: sort)
        completionHandler(garments)
    }
    
    func saveGarment(name: String) {
        db.saveGarment(name: name)
    }
    
    func deleteGarment(garment: Garment) {
        db.deleteGarment(garment: garment)
    }
    
}
