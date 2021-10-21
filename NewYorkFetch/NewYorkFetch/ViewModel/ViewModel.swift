//
//  ViewModel.swift
//  NewYorkFetch
//
//  Created by David Mottle on 10/15/21.
//

import UIKit
import Foundation

class ViewModel {
    typealias CompletionHandler = (()->())?
    
    private var arrResponse = HeadlineModel()
    private var error: Error?
    
    func get(completionHandler: CompletionHandler) {
        APIHandler.shared.get(url: URL.init(string: "https://api.nytimes.com/svc/topstories/v2/arts.json?api-key=aDFfPYP6tsmCYHNdOPUcNqPCvus1O4Ed")!) { arr, err in
            self.arrResponse = arr ?? HeadlineModel()
            self.error = err
            completionHandler?()
        }
    }
    
    func getDataArray()->HeadlineModel {
        return arrResponse
    }
    
    func getCount()->Int {
        return arrResponse.results?.count ?? 0
    }
    
    func getError()->Error? {
        return error
    }
    
    func getTitle(index: Int)->String? {
        return arrResponse.results![index].title
    }
    
    func getDate(index: Int)->String? {
        let date = arrResponse.results![index].published_date
        let convertedDate = date.convertToDateFormat(current: "yyyy-MM-dd'T'HH:mm:ssZZZZZ", convertTo: "MM-dd-yyyy")
        
        return convertedDate
    }
    
    func getByline(index: Int)->String? {
        return arrResponse.results![index].byline
    }
    
    func getURL(index: Int)->URL? {
        return arrResponse.results![index].url
    }
}

extension String {
    func convertToDateFormat(current: String, convertTo: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = current
    guard let date = dateFormatter.date(from: self) else {
        return self
    }
    dateFormatter.dateFormat = convertTo
    return dateFormatter.string(from: date)
    }
}
