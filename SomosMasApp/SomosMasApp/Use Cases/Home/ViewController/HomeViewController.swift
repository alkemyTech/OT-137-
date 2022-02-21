//
//  HomeViewController.swift
//  SomosMasApp
//
//  Created by Antonella Brini Vago on 11/02/2022.
//

import UIKit

class HomeViewController: UIViewController {

    var newsData: [News] = []
    var homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        exit(0)
    }
    
    func fetchNews() {
        homeViewModel.getNews(onSuccess: { newsData in
            self.newsData = newsData
            print(self.newsData.prefix(5))
        }) { error in
            print(error.debugDescription)
        }
    }
}
