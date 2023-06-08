//
//  UserViewModel.swift
//  Contact
//
//  Created by Mohammed on 18/11/1444 AH.
//

import Foundation
import Firebase

class MyUsers : ObservableObject{
    @Published var userInfo : [UserInfo] = []
    let dataBase = Firestore.firestore()
    
    init(){
        fetchDataBase()
    }
    
    func removeItem(toDelet : UserInfo) {
        dataBase.collection("todos") .document (toDelet.id) .delete { error in
            if error == nil {
                DispatchQueue.main.async{
                    self.userInfo.removeAll { i in
                        return i.id == toDelet.id
                        
                    }
                }
            }
            
        }
    }
    func fetchDataBase(){
        
        dataBase.collection("Users").getDocuments(){  (querySnapshot, error) in
            if let error = error{
                print("the error is \(error.localizedDescription)")
            } else {
                if let querySnapshot = querySnapshot {
                    for i in querySnapshot.documents{
                        let data = i .data()
                        let id = data["id"] as? String ?? ""
                        let firstname = data["firstname"] as? String ?? ""
                        let lastname = data["lastname"] as? String ?? ""
                        let company = data["company"] as? String ?? ""
                        let email = data["email"] as? String ?? ""
                        let phone = data["phone"] as? String ?? ""
                        let url = data["url"] as? String ?? ""
                        let address = data["address"] as? String ?? ""
                        let birthday = data["birthday"] as? String ?? ""
                        let note = data["note"] as? String ?? ""
                        let users = UserInfo(id: id, firstname: firstname, lastname: lastname, company: company, email: email, phone: phone,url: url, address: address, birthday: birthday, note: note)
                        
                        self.userInfo.append(users)
                    }
                }
            }
        }
    }
}
