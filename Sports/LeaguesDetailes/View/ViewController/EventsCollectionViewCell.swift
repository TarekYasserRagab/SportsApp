//
//  EventsCollectionViewCell.swift
//  Sports
//
//  Created by Tarek on 22/06/2022.
//

import UIKit

class EventsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewBackGround: UIView!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUPCellEvents(item: Eventes)
    {
        eventName.text = item.strEvent ?? ""
        eventDate.text = item.dateEvent ?? ""
        eventTime.text = item.strTime ?? ""
    }

}
