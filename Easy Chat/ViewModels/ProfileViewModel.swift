//
//  ProfileViewModel.swift
//  Easy Chat
//
//  Created by ZipEnter on 17/02/2021.
//

import Foundation

enum ProfileViewModelType {
    case info, logout
}

struct ProfileViewModel {
    let viewModelType: ProfileViewModelType
    let title: String
    let handler: (() -> Void)?
}
