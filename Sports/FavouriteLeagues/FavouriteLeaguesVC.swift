//
//  FavouriteLeaguesVC.swift
//  Sports
//
//  Created by Tarek on 22/06/2022.
//

import UIKit

class FavouriteLeaguesVC: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let reachability = try! Reachability()
    var arrFavourite = [Favourite]()
    @IBOutlet weak var tableViewFav: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewFav.delegate = self
        tableViewFav.dataSource = self
        tableViewFav.register(UINib(nibName: "FavouriteTableViewCell", bundle: nil), forCellReuseIdentifier: "FavouriteCell")        
        // Do any additional setup after loading the view.
    }
}


extension FavouriteLeaguesVC: UITableViewDelegate, UITableViewDataSource
{
    override func viewWillAppear(_ animated: Bool) {
        let db = DBManager.sharedInstance
        arrFavourite = db.fetchData(appDelegate: appDelegate)
        print("Data Featched")
        tableViewFav.reloadData()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFavourite.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewFav.dequeueReusableCell(withIdentifier: "FavouriteCell") as! FavouriteTableViewCell
        cell.setUpCellFav(item: arrFavourite[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let leaguesDetailes = self.storyboard?.instantiateViewController(withIdentifier: "LeaguesDetailesVC") as! LeaguesDetailesVC
        switch reachability.connection {
          case .wifi:
            leaguesDetailes.leagueName = self.arrFavourite[indexPath.row].strLeague
            leaguesDetailes.idLeague = self.arrFavourite[indexPath.row].idLeague
            self.present(leaguesDetailes, animated: true, completion: nil)
              print("Reachable via WiFi")
          case .cellular:
              print("Reachable via Cellular")
          case .unavailable:
            let alert = UIAlertController(title: "OOPs..", message: "No Connection", preferredStyle: .alert)
            let tryAgain = UIAlertAction(title: "Try Again", style: .default, handler: { action in
                self.dismiss(animated: true, completion: nil)
        })
            alert.addAction(tryAgain)
             DispatchQueue.main.async(execute: {
                self.present(alert, animated: true)
                self.tableViewFav.reloadData()
                  })
            print("Network not reachable")
          }

    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "delete") { [self] Action, view, completionHandler in
            DBManager.sharedInstance.delete(league: self.arrFavourite[indexPath.row], indexPath: indexPath, appDelegate: self.appDelegate, delegate: self)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

 

extension FavouriteLeaguesVC: DeletionDelegate{
    func deleteLeagueAtIndexPath(indexPath: IndexPath){
        arrFavourite.remove(at: indexPath.row)
        DispatchQueue.main.async {
            self.tableViewFav.reloadData()
        }
    }
}

func openURLFav(_ urlString: String) {
    guard let url = URL(string: urlString) else {
        return
    }
    UIApplication.shared.open(url, completionHandler: { success in
        if success {
            print("opened")
        } else {
            print("failed")
        }
    })
}
