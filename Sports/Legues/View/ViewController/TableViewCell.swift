//
//  TableViewCell.swift
//  Sports
//
//  Created by Tarek on 20/06/2022.
//

import UIKit


class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var youtubeImage: UIImageView!
    @IBOutlet weak var legueName: UILabel!
    @IBOutlet weak var legueImage: UIImageView!
    var link: String?
    override func awakeFromNib() {
        super.awakeFromNib()
        legueImage.roundImg()

        // Initialization code
    }
    func setUpCell(item: League)
    {
        legueName.text = item.strLeague
        legueImage.loadFrom(URLAddress: item.strBadge ?? "")
        link = item.strYoutube ?? ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func btnYoutube(_ sender: UIButton) {
        if let url = URL(string: "https:\(link ?? "")") {
            UIApplication.shared.open(url, options: [:])
        }
   }
}
