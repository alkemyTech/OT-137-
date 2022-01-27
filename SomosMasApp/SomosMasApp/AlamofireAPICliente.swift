//
//  AlamofireAPICliente.swift
//  SomosMasApp
//
//  Created by Mariano Uriel Delgado on 26/01/2022.
//

import Foundation
import Alamofire

class AlamofireAPIClient {
    let baseURL = "http://ongapi.alkemy.org/"
    
    static let shared = AlamofireAPIClient()
    
    func Get<T: Decodable>(responseType: T.Type, endpoint : String, completionHandler: @escaping (_ status: Bool, _ data: T?) ->()){
        
        
        Alamofire.Session.default.session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        AF.request("\(self.baseURL)\(endpoint)")
            .validate(statusCode: 200..<300)
            .responseData { response in
            switch response.result{
                case .success(let value):
                do {
                    let data = try JSONDecoder().decode(T.self, from: value)
                    completionHandler(true, data)
                } catch {
                    print(error)
                    completionHandler(false, nil)
                }
                break
            case .failure(let error):
                print(error)
                completionHandler(false, nil)
                break
            }
            
    }
    
}
    
}
