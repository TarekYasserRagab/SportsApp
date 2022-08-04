//
//  HomeCollectionViewCell.swift
//  Sports
//
//  Created by Tarek on 20/06/2022.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewBackGround: UIView!
    @IBOutlet weak var sportName: UILabel!
    @IBOutlet weak var sportImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        sportImage.roundImg()
}
    
    func setUpcell(item: Sport)
    {
        sportName.text = item.strSport
        sportImage.loadFrom(URLAddress: item.strSportThumb)
    }
}

extension UIImageView{
    func roundImg(){
        
        let radius = self.frame.width/2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        
    }
}
