//
//  LoginRouter.swift
//  BancoApp
//
//  Created by Romulo Oliveira Viganico on 19/02/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import Foundation
import UIKit

protocol LoginRouterLogic: AccountDataPassing {
    func openEntriesScene()
}

protocol AccountDataPassing {
    var dataStore: LoginDataStore? {get}
}

class LoginRouter: NSObject, LoginRouterLogic, AccountDataPassing {
    
    var dataStore: LoginDataStore?
    weak var view: UIViewController?
    
    func openEntriesScene() {
        print("teste1")
    }
}
