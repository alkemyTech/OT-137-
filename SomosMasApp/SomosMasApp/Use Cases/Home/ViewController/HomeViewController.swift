//
//  HomeViewController.swift
//  SomosMasApp
//
//  Created by Antonella Brini Vago on 11/02/2022.
//

import UIKit

class HomeViewController: UIViewController{
    
    

    var homeViewModel = HomeViewModel()
    var newsArray = [News]()
    var titleLabel: UILabel!
    var bodyLabel: UILabel!
    var exampleCollection: UICollectionView!
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBinds()
        self.homeViewModel.getNews()
        setupLabel()
        setupCollection()
    }
    
    func setupLabel(){
                titleLabel = UILabel()
                self.view.addSubview(titleLabel)
                titleLabel.text = "Bienvenidos"
                titleLabel.font = .systemFont(ofSize: 25)
                titleLabel.textAlignment = .center
                titleLabel.translatesAutoresizingMaskIntoConstraints = false
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
                titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
                titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true

           
       }
       
       func setupCollection(){
           
        let exampleCollectionsFlow = UICollectionViewFlowLayout()
                   exampleCollection = UICollectionView(frame: .zero, collectionViewLayout: exampleCollectionsFlow)
                   
        self.view.addSubview(exampleCollection)
                   exampleCollection.translatesAutoresizingMaskIntoConstraints = false
                   exampleCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
                   exampleCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
                exampleCollection.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 25).isActive = true
           
                    
                   exampleCollection.heightAnchor.constraint(equalToConstant: 315).isActive = true
                   
                   exampleCollection.delegate = self
                   exampleCollection.dataSource = self
                   
                   let nibCell = UINib(nibName: "SliderCollectionViewCell", bundle: nil)
                   exampleCollection.register(nibCell, forCellWithReuseIdentifier: "SliderCollectionViewCell")
                   
                   exampleCollectionsFlow.scrollDirection = .horizontal
                   exampleCollectionsFlow.itemSize = CGSize(width: view.frame.width * 0.75, height: 320)
                   exampleCollectionsFlow.sectionInset.right = 20
                   exampleCollectionsFlow.sectionInset.left = 20

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
        
        self.homeViewModel.bindErrorMessage = {(_ errorMessage: String) -> Void in
            print(errorMessage)
        }
        
        self.homeViewModel.bindEndRequest = {() -> Void in
            print("Termina la consulta")
        }
    }
    
    
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            var numbersItems: Int = 0
            
            switch collectionView {
            case exampleCollection:
                numbersItems = homeViewModel.images.count
            default:
                print("esto nunca va a pasar")
            }

            return numbersItems
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as? SliderCollectionViewCell
            cell?.imageCollectionViewCell.image = homeViewModel.images[indexPath.row].image
            cell?.titleCollectionViewCell.text = homeViewModel.images[indexPath.row].title
            cell?.descriptionCollectionViewCell.text = homeViewModel.images[indexPath.row].text
            
                return cell ?? SliderCollectionViewCell()
            }
}
