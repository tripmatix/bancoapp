//
//  LoginViewController.swift
//  BancoApp
//
//  Created by Romulo Oliveira Viganico on 19/02/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import Foundation
import UIKit

protocol LoginDisplayLogic: BaseView {
    func onLoginSuccess()
}

class LoginViewController: UIViewController, LoginDisplayLogic {
    
    var interactor: LoginBusinessLogic?
    var router: (LoginRouterLogic & AccountDataPassing)?
    
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var senha: UITextField!
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        let vc = self
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        let router = LoginRouter()
        vc.interactor = interactor
        vc.router = router
        router.view = vc
        interactor.presenter = presenter
        router.dataStore = interactor
        print("fim setup")
//        interactor.login(user: "test_user", password: "Test@1")
    }
    
    @IBAction func fazerLogin(){
        
        let login : String = self.login.text!
        let senha : String = self.senha.text!
        
        interactor!.login(user: login, password: senha)
        print("Apos interactor: \(self.login.text!)")
        print("Apos interactor: \(self.senha.text!)")
    }
    
//    func showMessageError2(message: String) {
//        print("baseView Message Error")
//        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: UIAlertController.Style.alert)
//
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//
//        self.present(alert, animated: true)
//    }
    
    func onLoginSuccess() {
        print("onLoginSuccess")
        router?.openEntriesScene()

    }
}
