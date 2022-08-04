//
//  LeaguesDetailesVC.swift
//  Sports
//
//  Created by Tarek on 21/06/2022.
//

import UIKit

class LeaguesDetailesVC: UIViewController, EventesView {
    var leagueName: String?
    var leagueBadge: String?
    var leagueLink: String?
    var eventesArray = [Eventes]()
    var resualtArray = [Eventes]()
    var teamsArray = [Teams]()
    var favouriteCheck = false
    var idLeague: String?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let db = DBManager.sharedInstance
    
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    @IBOutlet weak var leaguesName: UILabel!
    @IBAction func favouriteLeague(_ sender: UIButton) {
        if favouriteCheck == true {
            favouriteCheck = false
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
        }else{
            favouriteCheck = true
            db.addLeague(idLeague: idLeague ?? "" ,leagueName: leagueName ?? "", leagueBadge: leagueBadge ?? "", leagueLink: leagueLink ?? "", appDelegate: appDelegate)
                sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
       
    }
    @IBOutlet weak var resaultTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        leaguesName.text = leagueName
        eventsCollectionView.delegate = self
        eventsCollectionView.dataSource = self
        resaultTableView.delegate = self
        resaultTableView.dataSource = self
        teamsCollectionView.delegate = self
        teamsCollectionView.dataSource = self
        teamsCollectionView.register(UINib(nibName: "TeamsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TeamCell")
        eventsCollectionView.register(UINib(nibName: "EventsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EventeCell")
        resaultTableView.register(UINib(nibName: "ResualtTableViewCell", bundle: nil), forCellReuseIdentifier: "ReasualtCell")
        
        let leagueName_arr = leagueName?.components(separatedBy: " ")
        var leagueName = (leagueName_arr?[0])!
        for index in 1..<leagueName_arr!.count {
            leagueName += "%20\(leagueName_arr![index])"
                }
        let eventPresenter: EventesPresenter = EventesPresenterImplemntation(view: self)
        eventPresenter.fetchData(endPoint: "eventsseason.php?id=\(idLeague ?? "")")
        let teamsPresenter: EventesPresenter = EventesPresenterImplemntation(view: self)
        teamsPresenter.fetchData(endPoint: "search_all_teams.php?l=\(leagueName)")
    }
    @IBAction func backLeagues(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension LeaguesDetailesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case eventsCollectionView:
            return eventesArray.count
        case  teamsCollectionView:
            return teamsArray.count
        default:
            return 1
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case eventsCollectionView:
            let cell = eventsCollectionView.dequeueReusableCell(withReuseIdentifier: "EventeCell", for: indexPath) as! EventsCollectionViewCell
            cell.setUPCellEvents(item: eventesArray[indexPath.row])
            return cell
        case teamsCollectionView:
            let cell = teamsCollectionView.dequeueReusableCell(withReuseIdentifier: "TeamCell", for: indexPath) as! TeamsCollectionViewCell
            cell.teamImage.loadFrom(URLAddress: teamsArray[indexPath.row].strTeamBadge ?? "")
            return cell
        default:
            let cell = eventsCollectionView.dequeueReusableCell(withReuseIdentifier: "EventeCell", for: indexPath) as! EventsCollectionViewCell
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case eventsCollectionView:
            let teamDetailes = storyboard?.instantiateViewController(withIdentifier: "TeamDeatailsVC") as! TeamDeatailsVC
            print("No Data\(teamDetailes)")
            case teamsCollectionView:
            let teamDetailes = storyboard?.instantiateViewController(withIdentifier: "TeamDeatailsVC") as! TeamDeatailsVC
            teamDetailes.teamNameDetailes = teamsArray[indexPath.row].strTeam
            teamDetailes.teamImageDetailes = teamsArray[indexPath.row].strTeamBadge
            teamDetailes.teamDescriptionDet = teamsArray[indexPath.row].strDescriptionEN
            teamDetailes.teamYearDtatiles = teamsArray[indexPath.row].intFormedYear
            teamDetailes.teamStduimDetailes = teamsArray[indexPath.row].strStadium
            teamDetailes.leagueNameDetailes = teamsArray[indexPath.row].strLeague
            present(teamDetailes, animated: true, completion: nil)
        default:
            let teamDetailes = storyboard?.instantiateViewController(withIdentifier: "TeamDeatailsVC") as! TeamDeatailsVC
            print("NoData\(teamDetailes)")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200)
    }
}

extension LeaguesDetailesVC
{
    func postSuccessEventesView(eventes: [Eventes]) {
        eventesArray = eventes
        DispatchQueue.main.sync {
            self.eventsCollectionView.reloadData()
        }
    }
    
    func postSuccessTeamsView(teams: [Teams]) {
        teamsArray = teams
        DispatchQueue.main.sync {
            self.teamsCollectionView.reloadData()
        }
    }
    
    func postErrorEventesView(error: Error) {
        print(error.localizedDescription)
    }
}


extension LeaguesDetailesVC: UITableViewDelegate, UITableViewDataSource
{
    override func viewDidAppear(_ animated: Bool) {
        resualtArray = eventesArray
        resaultTableView.reloadData()
        print("====================================")
       
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resualtArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resaultTableView.dequeueReusableCell(withIdentifier: "ReasualtCell") as! ResualtTableViewCell
        cell.setUpCellResault(item: resualtArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
