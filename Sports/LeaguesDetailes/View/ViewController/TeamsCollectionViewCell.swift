//
//  TeamsCollectionViewCell.swift
//  Sports
//
//  Created by Tarek on 23/06/2022.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewBackGround: UIView!
    @IBOutlet weak var teamImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        teamImage.roundImg()
        // Initialization code
    }

}
