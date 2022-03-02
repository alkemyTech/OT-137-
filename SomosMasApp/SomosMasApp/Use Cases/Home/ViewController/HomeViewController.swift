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
    var newsCollectionView: UICollectionView!
    var newsTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBinds()
        self.homeViewModel.getNews()
        self.setupNewsLabel()
        self.setupNewsCollections()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        exit(0)
    }
    
    func setupNewsLabel(){
        newsTitleLabel = UILabel()
        
        self.view.addSubview(newsTitleLabel)
        newsTitleLabel.text = "Últimas novedades"
        newsTitleLabel.font = .systemFont(ofSize: 20)
        newsTitleLabel.textAlignment = .center
        
        newsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        newsTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        newsTitleLabel.topAnchor.constraint(equalTo: exampleCollection.bottomAnchor, constant: 20).isActive = true
        newsTitleLabel.heightAnchor.constraint(equalToConstant: 23).isActive = true
        newsTitleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupNewsCollections() {
        let newsCollectionViewFlow = UICollectionViewFlowLayout()
        newsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: newsCollectionViewFlow)
        
        self.view.addSubview(newsCollectionView)
        newsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        newsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        newsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        newsCollectionView.topAnchor.constraint(equalTo: newsTitleLabel.bottomAnchor, constant: 10).isActive = true
        newsCollectionView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
        
        let nibNews = UINib(nibName: "NewsCollectionViewCell", bundle: nil)
        newsCollectionView.register(nibNews, forCellWithReuseIdentifier: "NewsCollectionViewCell")
        
        newsCollectionViewFlow.itemSize = CGSize(width: view.frame.width * 0.75, height: 240)
        newsCollectionViewFlow.scrollDirection = .horizontal
        newsCollectionViewFlow.sectionInset.left = 12
        newsCollectionViewFlow.sectionInset.right = 12
    }
    
    func setBinds() {
        self.homeViewModel.bindStartRequest = {() -> Void in
            print("Inicia la consulta")
        }
        
        self.homeViewModel.bindRequestData = {(_ arrayNews: [News]) -> Void in
            let prefix = arrayNews.prefix(5)
            self.newsArray = Array(prefix)
            self.newsCollectionView.reloadData()
        }
        
        self.homeViewModel.bindErrorMessage = {(_ errorMessage: String) -> Void in
            print(errorMessage)
        }
        
        self.homeViewModel.bindEndRequest = {() -> Void in
            print("Termina la consulta")
        }
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var numbersItems: Int = 0
        
        switch collectionView {
        case newsCollectionView:
            numbersItems = self.newsArray.count
        default:
            print("Error")
        }

        return numbersItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case newsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as? NewsCollectionViewCell
            cell?.getImage(linkData: newsArray[indexPath.row].image ?? "imagen")
            cell?.newsTitle.text = newsArray[indexPath.row].name
            cell?.newsInfo.text = newsArray[indexPath.row].content
            return cell ?? NewsCollectionViewCell()
        default:
            return NewsCollectionViewCell()
        }
    }
}
