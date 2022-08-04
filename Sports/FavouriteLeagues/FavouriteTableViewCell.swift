//
//  FavouriteTableViewCell.swift
//  Sports
//
//  Created by Tarek on 22/06/2022.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {

    
    @IBOutlet weak var youtubeImage: UIImageView!
    @IBOutlet weak var leagueNameFav: UILabel!
    @IBOutlet weak var leagueImageFav: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        leagueImageFav.roundImg()
        // Initialization code
    }
  
    var link: String?
    func setUpCellFav(item: Favourite)
    {
        leagueNameFav.text = item.strLeague
        leagueImageFav.loadFrom(URLAddress: item.strBadge ?? "")
        link = item.strYoutube ?? ""
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func leagueLinkFav(_ sender: Any) {
        if let url = URL(string: "https:\(link ?? "")") {
            UIApplication.shared.open(url, options: [:])
    }
}
}

