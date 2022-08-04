//
//  DBManager.swift
//  Sports
//
//  Created by Tarek on 22/06/2022.
//

import Foundation
import CoreData

protocol DeletionDelegate{
    func deleteLeagueAtIndexPath(indexPath: IndexPath)
}

class DBManager{
    static let sharedInstance = DBManager()
    private init(){
        print("Data Base")
    }
}
extension DBManager{


    func addLeague(idLeague: String,leagueName: String, leagueBadge: String, leagueLink: String, appDelegate: AppDelegate){
        let managedContext = appDelegate.persistentContainer.viewContext
        if let entity = NSEntityDescription.entity(forEntityName: "Favourite", in: managedContext){
            let league = NSManagedObject(entity: entity, insertInto: managedContext)
            league.setValue(leagueName, forKey: "strLeague")
            league.setValue(leagueBadge,forKey: "strBadge")
            league.setValue(leagueLink, forKey: "strYoutube")
            league.setValue(idLeague, forKey: "idLeague")
            print("Set Data")
            do {
                try managedContext.save()
                print("Save Data Base")
            }catch let error as NSError {
                print("Error in saving")
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchData(appDelegate: AppDelegate) -> [Favourite]{

        var fetchedList : [Favourite] = []
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favourite")


        do{
            fetchedList = try managedContext.fetch(fetchRequest) as! [Favourite]
        }catch let error as NSError {
            print("Error in saving")
            print(error.localizedDescription)
        }
        return fetchedList
    }

    func delete(league:Favourite, indexPath: IndexPath, appDelegate: AppDelegate, delegate: DeletionDelegate){

        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(league)
        do{
            try managedContext.save()
            delegate.deleteLeagueAtIndexPath(indexPath: indexPath)
            print("Cell Is Deleted")
        }catch let error as NSError{
            print("Error in saving")
            print(error.localizedDescription)
        }
        
    }
}

