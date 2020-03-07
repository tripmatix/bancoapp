//
//  LoginPresenter.swift
//  BancoApp
//
//  Created by Romulo Oliveira Viganico on 19/02/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import Foundation

protocol LoginPresentationLogic {
    func presentError(message: String)
    func loginSuccess()
}

class LoginPresenter: LoginPresentationLogic {
    
    var view: LoginDisplayLogic
    
    init() {
        view = LoginViewController()
    }
    
    func presentError(message: String) {
        print("presentError \(message)")
        view.showMessageError(message: message)
    }
    
    func loginSuccess() {
        print("UserAccount:")
        view.onLoginSuccess()
    }
}
