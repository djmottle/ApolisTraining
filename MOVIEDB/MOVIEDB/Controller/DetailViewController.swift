//
//  DetailViewController.swift
//  MOVIEDB
//
//  Created by David Mottle on 9/30/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = movie?.title
        guard let url = URL(string: (Constant.WEBSITE_URL.rawValue + (movie?.backdrop_path)!)) else {return}
        let data = try! Data(contentsOf: url)
        if let imageData = UIImage(data: data){
            imgView.image = imageData
        }

        // Do any additional setup after loading the view.
    }

}
