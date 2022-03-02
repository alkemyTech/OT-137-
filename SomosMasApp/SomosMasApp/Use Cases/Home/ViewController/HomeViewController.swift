//
//  HomeViewController.swift
//  SomosMasApp
//
//  Created by Antonella Brini Vago on 11/02/2022.
//

import UIKit

class HomeViewController: UIViewController {

    var homeViewModel = HomeViewModel()
    var newsArray = [News]()
    var slidesArray = [Slides]()
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBinds()
        self.homeViewModel.getNews()
        self.homeViewModel.getSlides()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        exit(0)
    }
    
    func setBinds() {
        self.homeViewModel.bindStartRequest = {() -> Void in
            print("Inicia la consulta")
        }
        
        self.homeViewModel.bindRequestData = {(_ arrayNews: [News]) -> Void in
            let prefix = arrayNews.prefix(5)
            self.newsArray = Array(prefix)
            print(self.newsArray)
        }
        
        self.homeViewModel.bindRequestSlidesData = {(_ arraySlides: [Slides]) -> Void in
            let prefix = arraySlides.prefix(6)
            self.slidesArray = Array(prefix)
        }
        
        self.homeViewModel.bindErrorMessage = {(_ errorMessage: String) -> Void in
            print(errorMessage)
        }
        
        self.homeViewModel.bindEndRequest = {() -> Void in
            print("Termina la consulta")
        }
    }
}
