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
    
    func loginUser(email: String, password: String,  sucess: @escaping (_ loginDataResponse: LoginUserResponse) -> (), failure: @escaping ( _ error: Error?) -> () ) {
        
        let params: [String: String] = ["email": email, "password": password]
        let serverUrl = Bundle.main.object(forInfoDictionaryKey: "ServerURL") as! String
        let finalUrl = serverUrl + "login"
        
        AF.request(finalUrl, method: .post, parameters: params,  encoder: JSONParameterEncoder.default).validate(statusCode: 200...299).responseDecodable(of: LoginUserResponse.self) {
            response in
            if let userResponse = response.value {
                sucess(userResponse)
            } else {
                failure(response.error)
            }
        }
        
    }
        
    
}
