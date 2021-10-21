//
//  ListViewModel.swift
//  LuluLemonCopy
//
//  Created by David Mottle on 10/14/21.
//

import UIKit

class ListViewModel {
    var garments = [Garment]()
    let apiManager = APIManager.shared
    
    func fetchDataFromDB(sortIndex: Int) {
        var sort = NSSortDescriptor()
        switch sortIndex {
        case 0:
            sort = NSSortDescriptor(key: "name", ascending: true)
        case 1:
            sort = NSSortDescriptor(key: "creationTime", ascending: true)
        default:
            break
        }
        
        apiManager.fetchDataFromDB(sort: sort) { garments in
            self.garments = garments
        }
    }
    
    func deleteGarment(index: Int) {
        apiManager.deleteGarment(garment: garments[index])
    }
    
    func getGarmentCount() -> Int {
        return garments.count
    }
    
    func getGarmentName(index: Int) -> String {
        return garments[index].name ?? ""
    }
    
}
