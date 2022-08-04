//
//  ResualtTableViewCell.swift
//  Sports
//
//  Created by Tarek on 23/06/2022.
//

import UIKit

class ResualtTableViewCell: UITableViewCell {

    @IBOutlet weak var awayScore: UILabel!
    @IBOutlet weak var colone: UILabel!
    @IBOutlet weak var homeScore: UILabel!
    @IBOutlet weak var awayTeam: UILabel!
    @IBOutlet weak var VS: UILabel!
    @IBOutlet weak var homeTeam: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCellResault(item: Eventes)
    {
        awayScore.text = item.intAwayScore
        homeScore.text = item.intHomeScore
        awayTeam.text = item.strAwayTeam
        homeTeam.text = item.strHomeTeam
    }
    
}
