//
//  TeamDeatailsVC.swift
//  Sports
//
//  Created by Tarek on 23/06/2022.
//

import UIKit

class TeamDeatailsVC: UIViewController {
    var teamNameDetailes: String?
    var teamImageDetailes: String?
    var leagueNameDetailes: String?
    var teamStduimDetailes: String?
    var teamDescriptionDet: String?
    var teamYearDtatiles: String?
    

    @IBOutlet weak var viewBackGround: UIView!
    @IBOutlet weak var teamStduimlbl: UILabel!
    @IBOutlet weak var teamYearlbl: UILabel!
    @IBOutlet weak var teamNamelbl: UILabel!
    @IBOutlet weak var teamDescription: UILabel!
    @IBOutlet weak var teamStduimDet: UILabel!
    @IBOutlet weak var teamYearDet: UILabel!
    @IBOutlet weak var teamNameDet: UILabel!
    @IBOutlet weak var teamImageDet: UIImageView!
    @IBOutlet weak var leagueNameDet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        teamImageDet.roundImg()
        teamDescription.text = teamDescriptionDet ?? ""
        teamYearDet.text = teamYearDtatiles ?? ""
        teamNameDet.text = teamNameDetailes ?? ""
        teamStduimDet.text = teamStduimDetailes ?? ""
        teamImageDet.loadFrom(URLAddress: teamImageDetailes ?? "")
        leagueNameDet.text = leagueNameDetailes ?? ""
        
    }
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
