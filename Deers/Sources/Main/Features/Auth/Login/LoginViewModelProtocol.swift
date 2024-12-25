//
//  LoginViewModelProtocol.swift
//  Deers
//
//  Created by Dalal Macbook on 25/12/2024.
//

import Foundation

protocol LoginViewModelProtocol: ObservableObject {
    var email: String { get set }
    var password: String { get set }
    var errorMessage: String { get }
    var showError: Bool { get set }

    func performLogin() async
}
