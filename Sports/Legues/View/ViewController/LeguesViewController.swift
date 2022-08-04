//
//  LeguesViewController.swift
//  Sports
//
//  Created by Tarek on 20/06/2022.
//

import UIKit


class LeguesViewController: UIViewController, LeguesView {
    
    var leguesaArray = [League]()
    var leaguesAraayPrint = [League]()
    var nameSport : String?
    var leagueName: String?
    var leagueImage: String?
    var youtibeLink: String?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "LeguesCell")
        let leaguesPresenter: LeguesPresenter = LeguesPresenterImplemntation(view: self)
        leaguesPresenter.fetchData(endPoint: "search_all_leagues.php?s=\(nameSport ?? "")")
    }
}

extension LeguesViewController: UITableViewDelegate, UITableViewDataSource
{
    
//    override func viewDidAppear(_ animated: Bool) {
//        for item in leguesaArray{
//            if item.strSport == nameSport {
//                leaguesAraayPrint.append(item)
//                tableView.reloadData()
//            }else{
//                let alert = UIAlertController(title: "Alert", message: "No Data", preferredStyle: .alert)
//
//                     let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
//                         self.navigationController?.popViewController(animated: true)
//                     })
//                    alert.addAction(ok)
//                     DispatchQueue.main.async(execute: {
//                        self.present(alert, animated: true)
//                        self.tableView.reloadData()
//                })
//
//            }
//        }
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leguesaArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeguesCell", for: indexPath) as! TableViewCell
        
       
        cell.setUpCell(item: leguesaArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let leaguesDetailes = storyboard?.instantiateViewController(withIdentifier: "LeaguesDetailesVC") as! LeaguesDetailesVC
        
        leaguesDetailes.leagueName = leguesaArray[indexPath.row].strLeague
        leaguesDetailes.leagueBadge = leguesaArray[indexPath.row].strBadge
        leaguesDetailes.leagueLink = leguesaArray[indexPath.row].strYoutube
        leaguesDetailes.idLeague = leguesaArray[indexPath.row].idLeague
        present(leaguesDetailes, animated: true, completion: nil)
    }
}

extension LeguesViewController
{
    func postSuccessLeaguesView(leagues: [League]) {
        leguesaArray = leagues
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func postErrorLeaguesView(error: Error) {
        print(error.localizedDescription)
    }

}
