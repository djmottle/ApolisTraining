//
//  APIHandler.swift
//  NewYorkFetch
//
//  Created by David Mottle on 10/15/21.
//

import UIKit
import Foundation

class APIHandler {
    
    static let shared = APIHandler.init()
    typealias CompletionHandler = ((HeadlineModel?, Error?)->())?

    private init(){}
    
    func get(url:URL, completionHandler: CompletionHandler) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            let model = try? JSONDecoder.init().decode(HeadlineModel.self, from: data!)
            completionHandler?(model, error)
        }.resume()
    }
}
