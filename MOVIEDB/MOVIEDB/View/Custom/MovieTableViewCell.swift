//
//  MovieTableViewCell.swift
//  MOVIEDB
//
//  Created by David Mottle on 9/24/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
    }

    func setData(movie: Movie) {
        guard let url = URL(string: (Constant.WEBSITE_URL.rawValue + (movie.backdrop_path)!)) else {return}
        let data = try! Data(contentsOf: url)
        if let imageData = UIImage(data: data){
            imgView.image = imageData
        }

        nameLabel.text = movie.title
        popularityLabel.text = String((movie.popularity)!)
        ratingLabel.text = movie.release_date
    }
}
