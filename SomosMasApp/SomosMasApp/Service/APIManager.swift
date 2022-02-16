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
        
        AF.request(url, method: .post, parameters: params,  encoder: JSONParameterEncoder.default).validate(statusCode: 200...299).responseDecodable(of: LoginUserResponse.self) {
            response in
            
            
            if let userResponse = response.value?.data {
                sucess(userResponse)
            } else {
                failure(response.error)
            }
        }
        
    }
    
    
    func registerUser(register: SignUpModel, completionHandler: @escaping (Bool) -> ()){
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        let url = Constants.URL.BASE_URL+Constants.URL.Endpoints.REGISTER
        AF.request(url, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: headers).response{
            response in
            debugPrint(response)

            switch response.result{
                
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    if response.response?.statusCode == 200{
                        completionHandler(true)
                    }else{
                        completionHandler(false)
                    }
                }catch{
                    //print(error.localizedDescription)
                    completionHandler(false)
                }
            case .failure(let err):
                //print(err.localizedDescription)
                completionHandler(false)
            }
        }
    }
}


