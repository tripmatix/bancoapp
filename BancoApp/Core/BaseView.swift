//
//  BaseView.swift
//  BancoApp
//
//  Created by Romulo Oliveira Viganico on 19/02/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import Foundation
import UIKit

protocol BaseView{
    func showMessageError(message: String)
}

extension UIViewController: BaseView {
    func showMessageError(message: String) {
        print("baseView Message Error")
        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true)
    }
}
