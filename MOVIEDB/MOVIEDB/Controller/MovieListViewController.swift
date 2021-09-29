//
//  ViewController.swift
//  MOVIEDB
//
//  Created by David Mottle on 9/24/21.
//

import UIKit

class MovieListViewController: UIViewController, APIManagerProtocol {
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var objTableView: UITableView!
    var objMovieListModel: MovieListModel?
    var isSearching = false
    var tempArray = [Movie]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        APIManager.shared.getMovieList(url: Constant.MOVIE_LIST_URL.rawValue) {
//            (objMovieList) in
//
//            self.objMovieListModel = objMovieList
//
//            DispatchQueue.main.async {
//                self.objTableView.reloadData()
//            }
//        }
        let objAPIManager = APIManager.shared
        objAPIManager.delegate = self
        
        objAPIManager.getMovieList(url: Constant.MOVIE_LIST_URL.rawValue)
    }
    func getData(movieListModel: MovieListModel) {
        objMovieListModel = movieListModel
        DispatchQueue.main.async {
            self.objTableView.reloadData()
        }
    }
}


extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !isSearching {
            return objMovieListModel?.results?.count ?? 0
        } else {
            return tempArray.count
        }
        
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let objMovieCell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as? MovieTableViewCell
        if !isSearching {
            let movie = objMovieListModel?.results?[indexPath.row]
            if let movie = movie {
                objMovieCell?.setData(movie: movie)
            }
        }
        if isSearching {
            let movie = tempArray[indexPath.row]
            objMovieCell?.setData(movie: movie)
        }
        if let objMovieCell = objMovieCell {
            return objMovieCell
        }
        return UITableViewCell()
    }
}

extension MovieListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        tempArray = (objMovieListModel?.results?.filter({$0.title?.contains(searchText) == true}))!
//        isSearching = true
//        DispatchQueue.main.async {
//            self.objTableView.reloadData()
//        }
        if tempArray.count != 0 {
            tempArray.removeAll()
        }
        if searchText == "" {
            isSearching = false
            DispatchQueue.main.async {
                self.objTableView.reloadData()
            }
        }
        for i in 0..<(objMovieListModel?.results!.count)! {
            if ((objMovieListModel?.results?[i].title?.contains(searchText)) == true) {
                tempArray.append((objMovieListModel?.results?[i])!)
                isSearching = true
                DispatchQueue.main.async {
                    self.objTableView.reloadData()
                }
            }
            if i == ((objMovieListModel?.results!.count)!-1) && (searchText != "") {
                isSearching = true
                DispatchQueue.main.async {
                    self.objTableView.reloadData()
                }
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        tempArray.removeAll()
        searchBar.text = ""
        DispatchQueue.main.async {
            self.objTableView.reloadData()
        }
        self.view.endEditing(true)
    }
            
}


