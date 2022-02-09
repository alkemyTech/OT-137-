//
//  APIManager.swift
//  SomosMasApp
//
//  Created by Rodrigo Torres on 06/02/2022.
//

import Foundation
import Alamofire

class APIManager {
    
    static let shared = APIManager()
    
    func loginUser(email: String, password: String,  sucess: @escaping (_ loginDataResponse: LoginDataResponse) -> (), failure: @escaping ( _ error: Error?) -> () ) {
        
        let url = Constants.URL.BASE_URL+Constants.URL.Endpoints.LOGIN
        let params: [String: String] = ["email": email, "password": password]
        
        AF.request(url, method: .post, parameters: params,  encoder: JSONParameterEncoder.default).validate(statusCode: 200...299).responseDecodable(of: LoginDataResponse.self) {
            response in
            
            
            if let userResponse = response.value {
                sucess(userResponse)
            } else {
                failure(response.error)
            }
        }
        
    }
        
    
}
