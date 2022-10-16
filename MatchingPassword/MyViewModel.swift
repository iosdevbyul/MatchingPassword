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
}
