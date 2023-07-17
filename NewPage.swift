//
//  NewPage.swift
//  Contact
//
//  Created by Mohammed on 17/11/1444 AH.
//

import SwiftUI
import InitialsUI
import Firebase

struct NewPage: View {
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var company = ""
    @State private var phone = ""
    @State private var email = ""
    @State private var url = ""
    @State private var address = ""
    @State private var birthday = ""
    @State private var note = ""
    init() {
        UITextField.appearance().clearButtonMode = .whileEditing
    }
    
    var body: some View {
        ZStack {
            Color("Color1")
                .opacity(0.8)
                .ignoresSafeArea()
            VStack{
                HStack(spacing:70) {
                    Button {
                        
                    } label: {
                        Text("Cancel")
                    }
                    Text("New Contact")
                        .bold()
                        .padding()
                    Button {
                        addToDataBase(firstnameDB: self.firstname, lastnameDB: self.lastname, companyDB: self.company, phoneDB: self.phone, emailDB: self.email, urlDB: self.url, addressDB: self.address, birthdayDB: self.birthday, noteDB: self.note)
                    } label: {
                        Text("Done")
                    }
                    
                    
                }
                VStack {
                    if firstname.isEmpty{
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 150 , height: 150)
                            .foregroundColor(.gray)
                            .padding()
                    } else{
                        InitialsUI(text: $firstname)
                            .frame(width: 150 , height: 150)
                            .cornerRadius(150)
                            .padding()
                    }
                    
                    List{
                        Section{
                            TextField("first name", text: $firstname)
                            
                            TextField("last name", text: $lastname)
                            TextField("company", text: $company)
                            
                        }
                        Section{
                            HStack {
                                plusButton()
                                TextField(" add phone", text: $phone)
                            }
                        }
                        Section{
                            HStack {
                                plusButton()
                                TextField(" add email", text: $email)
                            }
                        }
                        Section{
                            HStack {
                                plusButton()
                                TextField(" add url", text: $url)
                            }
                        }
                        Section{
                            HStack {
                                plusButton()
                                TextField(" add address", text: $address)
                            }
                        }
                        Section{
                            HStack {
                                plusButton()
                                TextField(" add birthday", text: $birthday)
                            }
                        }
                        Section{
                            TextField("Note\n\n\n", text: $note)
                                .lineLimit(...2)
                            
                        }
                        
                    }.scrollContentBackground(.hidden)
                }
                
            }
            
        }
    }
    
    
    
    func addToDataBase(firstnameDB: String , lastnameDB: String , companyDB: String , phoneDB:String , emailDB: String , urlDB: String , addressDB: String , birthdayDB: String , noteDB: String  ){
        let dataBase = Firestore.firestore()
        dataBase.collection("Users").document().setData(
            [
                "First name"   : firstnameDB ,
                "Last name"    : lastnameDB ,
                "company"      : companyDB ,
                "Phone Number" : phoneDB ,
                "email "        : emailDB ,
                "url "          : urlDB ,
                "address "      : addressDB ,
                "birthday "     : birthdayDB ,
                "note "         : noteDB ,
            ])
    }
    
}
struct NewPage_Previews: PreviewProvider {
    static var previews: some View {
        NewPage()
    }
}

