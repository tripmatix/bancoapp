//
//  LoginInteractor.swift
//  BancoApp
//
//  Created by Romulo Oliveira Viganico on 19/02/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import Foundation

protocol LoginBusinessLogic {
    func login(user: String, password: String)
}

protocol LoginDataStore {
    var account: UserAccount? {get}
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    
    var account: UserAccount?
    
    var presenter: LoginPresentationLogic?
    var worker: LoginWorkerProtocol?
    
    init() {
        worker = LoginWorker()
    }
    
    func login(user: String, password: String) {
        print("Login")
        print(user)
        print(password)
        print("Login-end")
        if validateFields(user, password){
            print("isValid")
            worker?.login(user: user, password: password, { UserAccount in
                self.account = UserAccount
                self.presenter?.loginSuccess()
            }, { errorMessage in
                print("showMessageError \(errorMessage)")
                self.presenter?.presentError(message: errorMessage)
            })
        }
    }
    
    private func validateFields(_ user: String, _ password: String) -> Bool {
        
        var isValid = true
        
        if (user.isEmpty) {
            isValid = false
            print("usuario isEmpty")
            presenter?.presentError(message: "Campo usuario vazio")
        }
        print("validou user")
        return isValid
    }
}
