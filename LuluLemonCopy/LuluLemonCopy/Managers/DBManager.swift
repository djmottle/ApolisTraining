//
//  DBManager.swift
//  LuluLemonCopy
//
//  Created by David Mottle on 10/14/21.
//

import UIKit
import CoreData
import Foundation

class DBManager {
    static let shared = DBManager()
    private init() {} //for singletons
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func fetchGarments(sort: NSSortDescriptor) -> [Garment] {
        
        var garments: [Garment] = []
        
        do {
            let request = Garment.fetchRequest() as NSFetchRequest<Garment>
            request.sortDescriptors = [sort]
            garments = try self.context?.fetch(request) ?? [Garment]()
        } catch let error as NSError {
            print(error)
        }
        return garments
    }
    
    func saveGarment(name: String) {
        
        let garment = Garment(context: self.context!)
        garment.name = name
        garment.creationTime = Date()
        
        do {
           try self.context?.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    func deleteGarment(garment: Garment) {
        
        self.context?.delete(garment)
        
        do {
           try self.context?.save()
        } catch let error as NSError {
            print(error)
        }
    }
}
