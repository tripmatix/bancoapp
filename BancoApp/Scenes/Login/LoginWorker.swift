//
//  LoginWorker.swift
//  BancoApp
//
//  Created by Romulo Oliveira Viganico on 19/02/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import Foundation
import Alamofire

protocol LoginWorkerProtocol {
    func login(user: String, password: String, _ onSuccess: @escaping (UserAccount) -> Void, _ onError: @escaping (String) -> Void)
}

class LoginWorker: LoginWorkerProtocol {
    var apiClient: ApiClient?
    
    init() {
        apiClient = ApiManager()
    }
    
    func login(user: String, password: String, _ onSuccess: @escaping (UserAccount) -> Void, _ onError: @escaping (String) -> Void) {
        
        let params: [String: Any] = [
            "user" : "\(user)",
            "password" : "\(password)"
        ]
        
        print("Parametros \(params)")
        
        apiClient?.request(type: LoginResponse.self,
//                           endpoint: "statements/1",
                           endpoint: "login",
                           method: HTTPMethod.post,
                           parameters: params,
                           encoding: URLEncoding.default,
                           onSuccess: {response in
                            if let error = response.error.message{
                                print("error dados invalidos \(error)")
                                onError(error)
                                return
                            }
                            onSuccess(response.userAccount)},
                           onError: { error in
                            //tratar error, por exemplo quando estiver sem internet (ver qual codigo)
                            onError("Ocorreu um error :(")
        })
    }
}
