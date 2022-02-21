//
//  AntoSignUpTest.swift
//  SomosMasApp
//
//  Created by Antonella Brini Vago on 12/02/2022.
//

import Foundation
import Alamofire

class SignUpWS {
    
    typealias completionHandler = (_ requestStatus: SignUpResponse) -> Void
    typealias errorHandler = (_ errorData: String) -> Void

    let baseUrl = Constants.URL.BASE_URL
    let endPoint = Constants.URL.Endpoints.REGISTER

    func registerUser(register: SignUpModel, onSuccess: @escaping completionHandler, onError: @escaping errorHandler){

        let url = baseUrl+endPoint
        let encoder = JSONParameterEncoder.default
        let request = AF.request(url,
                                 method: .post,
                                 parameters: register,
                                 encoder: encoder)
        request.responseDecodable(of: SignUpResponse.self, decoder: JSONDecoder()) { response in
            switch response.result {
            case .success(let dataResponse):
                onSuccess(dataResponse)
            case .failure(let errorData):
                onError(errorData.errorDescription ?? "Error")
            }
        }
    }
}


