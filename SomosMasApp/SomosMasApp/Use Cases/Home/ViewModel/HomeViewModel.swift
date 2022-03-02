//
//  HomeViewModel.swift
//  SomosMasApp
//
//  Created by Antonella Brini Vago on 21/02/2022.
//

import Foundation

class HomeViewModel {
    let newsAPI = NewsAPI()
    var newsData: [News] = []{
        didSet {
            self.bindRequestData(newsData)
        }
    }
    
    var slidesData: [Slides] = [] {
        didSet {
            self.bindRequestSlidesData(slidesData)
        }
    }
    
    
    
    var bindStartRequest = {() -> Void in }
    var bindEndRequest = {() -> Void in }
    var bindErrorMessage = {(_ errorMessage: String) -> Void in }
    var bindRequestData = {(_ arrayNews: [News]) -> Void in }
    
    var bindRequestSlidesData = {(_ arraySlides: [Slides]) -> Void in }
    
    func getNews() {
        bindStartRequest()
        newsAPI.getNews { requestStatus in
            self.bindEndRequest()
            self.newsData = requestStatus.data
        } onError: { errorData in
            self.bindEndRequest()
            self.bindErrorMessage(errorData.debugDescription)
        }
    }
    
    func getSlides() {
        bindStartRequest()
        APIManager.shared.getSlides { requestStatus in
            self.bindEndRequest()
            self.slidesData = requestStatus.data
        } onFailure: { errorData in
            self.bindEndRequest()
            self.bindErrorMessage(errorData.debugDescription)
        }

    }
}
