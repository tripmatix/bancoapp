//
//  LoginResponse.swift
//  BancoApp
//
//  Created by Romulo Oliveira Viganico on 19/02/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import Foundation

struct LoginResponse: Decodable {
    let userAccount: UserAccount
    let error: ErrorResponse
}

struct UserAccount: Decodable {
    let userId: Int?
    let name: String?
    let bankAccount: String?
    let agency: String?
    let balance: Double?
}

//{
//    "userAccount": {
//        "userId": 1,
//        "name": "Jose da Silva Teste",
//        "bankAccount": "2050",
//        "agency": "012314564",
//        "balance": 3.3445
//    },
//    "error": {}
//}
