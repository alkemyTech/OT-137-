//
//  HomeViewModel.swift
//  SomosMasApp
//
//  Created by Antonella Brini Vago on 21/02/2022.
//

import Foundation

class HomeViewModel {
    let newsAPI = NewsAPI()
    
    func getNews(onSuccess: @escaping ([News]) -> (), onError: @escaping (String) -> ()) {
        newsAPI.getNews { requestStatus in
            onSuccess(requestStatus.data)
        } onError: { errorData in
            onError(errorData.debugDescription)
        }
    }
}
