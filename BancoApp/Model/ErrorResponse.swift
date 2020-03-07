//
//  ErrorResponse.swift
//  BancoApp
//
//  Created by Romulo Oliveira Viganico on 19/02/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import Foundation

struct ErrorResponse: Decodable{
    let code: Int?
    let message: String?
}
