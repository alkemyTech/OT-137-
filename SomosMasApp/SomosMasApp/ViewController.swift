//
//  ViewController.swift
//  SomosMasApp
//
//  Created by Mariano Uriel Delgado on 26/01/2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        fetchFilms()

      
        
        //getData()
        // Do any additional setup after loading the view.
    }
    
    func fetchFilms() {
        // 1
        let request = AF.request()
        // 2
        request.responseJSON { (data) in
          print(data)
        }
      }
   

}

