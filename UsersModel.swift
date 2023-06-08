//
//  UsersModel.swift
//  Contact
//
//  Created by Mohammed on 18/11/1444 AH.
//

import Foundation
import Firebase



struct UserInfo : Identifiable{
    var id: String
    var firstname: String
    var lastname: String
    var company: String
    var email: String
    var phone: String
    var url: String
    var address: String
    var birthday: String
    var note: String
}

