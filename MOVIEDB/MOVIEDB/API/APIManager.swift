//
//  APIManager.swift
//  MOVIEDB
//
//  Created by David Mottle on 9/27/21.
//

import UIKit

protocol  APIManagerProtocol {
    func getData(movieListModel: MovieListModel)
}

class APIManager {
    
    var delegate: APIManagerProtocol?
    
    static let shared = APIManager()

    func getMovieList(url: String) {
        let objUrlSession = URLSession.shared
        objUrlSession.dataTask(with: URL.init(string: url)!) {data, response, error in
            guard let data = data else {return}

            let jsondecoder = JSONDecoder()
            let movieList = try! jsondecoder.decode(MovieListModel.self, from: data)
            self.delegate?.getData(movieListModel: movieList)
            //completionHander(movieList)
        }.resume()
    }
}


