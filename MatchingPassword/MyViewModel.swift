//
//  MyViewModel.swift
//  MatchingPassword
//
//  Created by PNT001 on 2022/10/16.
//

import Foundation
import Combine

class MyViewModel {
    @Published var passwordInput: String = ""
    
    @Published var passwordConfirmInput: String = ""
    
    lazy var isMatchPasswordInput: AnyPublisher<Bool, Never> = Publishers.CombineLatest($passwordInput, $passwordConfirmInput)
        .map({ (password: String, passwordConfirm: String) in
            if password == "" || passwordConfirm == "" {
                return false
            }
            if password == passwordConfirm {
                return true
            } else {
                return false
            }
        })
        .print()
        .eraseToAnyPublisher()
}
