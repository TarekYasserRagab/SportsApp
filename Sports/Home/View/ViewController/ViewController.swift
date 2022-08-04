//
//  ViewController.swift
//  Sports
//
//  Created by Tarek on 20/06/2022.
//

import UIKit

class ViewController: UIViewController, HomeView {
    var sportsArray = [Sport]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let homePresenter: HomePresenter = HomePresenterImplemntation(view: self)
        homePresenter.fetchData(endPoint: "all_sports.php")
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCollectionViewCell
        cell.setUpcell(item: sportsArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 8) / 2, height: 250)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 2, left: 2, bottom: 1, right: 2)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0.1
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let leguesVC = storyboard?.instantiateViewController(withIdentifier: "LeguesViewController") as! LeguesViewController
        leguesVC.nameSport = sportsArray[indexPath.row].strSport
        navigationController?.pushViewController(leguesVC, animated: true)
    }
}

extension ViewController
{
    func postSuccessHomeView(sports: [Sport]) {
        self.sportsArray = sports
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func postErrorHomeView(error: Error) {
        print("Error...\(error.localizedDescription)")
    }
    
}

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}

