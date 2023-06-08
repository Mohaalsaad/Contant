//
//  InfoPage.swift
//  Contact
//
//  Created by Mohammed on 18/11/1444 AH.
//

import SwiftUI
import InitialsUI
import Firebase

struct InfoPage: View {
    @State private var firstname = ""
    @StateObject var vm = MyUsers()
    @State var user : UserInfo
    var body: some View {
        ZStack{
            Color("Color1")
                .ignoresSafeArea()
                .opacity(0.3)
            VStack{
                InitialsUI(initials: user.firstname)
                    .frame(width: 150 , height: 150)
                    .cornerRadius(150)
                    .padding()
                Text(user.firstname)
                    .font(.largeTitle)
                Text(user.lastname)
                    .font(.title3)
               // ExtractedView()
                List(){
                    Section{
                        Text("phone\n\(user.phone)")
                    }
                    Section{
                        Text("work\n\(user.email)")
                    }
                    Section{
                        HStack{
                            Text("home\n\(user.address)")
                            Spacer()
                            Image("map")
                                .resizable()
                                .frame(width:100 , height: 100)
                        }
                    }
                    Section{
                        Text("brthday\n\(user.birthday)")
                    }
                    Section{
                        Text("note\n\(user.note)")
                    }
                    
                    Section{
                        Button{} label: {Text("Send Messge")}
                        Button{} label: {Text("Share Contact")}
                        Button{} label: {Text("Add to Faivorates")}
                    }
                    Section{
                        Button{} label: {Text("Add to Emergency Contact")}
                    }
                    Section{
                        Button{} label: {Text("Share my Location")}
                    }
                    Section{
                        Button{} label: {Text("Add to List")}
                    }
                  
                }
                
                
                
                
                
                
                
                
            }
                
                
            }
        }
    }

struct ExtractedView: View {
    var body: some View {
        HStack(spacing: 50){
            VStack(spacing: 10){
                Image(systemName: "message.fill")
                    .foregroundColor(.blue)
                
                Text("message")
                    .foregroundColor(.blue)
                
            }
            
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 16).stroke(.gray, lineWidth: 1))
            VStack(spacing: 10){
                Image(systemName: "phone.fill")
                    .foregroundColor(.blue)
                
                Text("phone")
                    .foregroundColor(.blue)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 16).stroke(.gray, lineWidth: 1))
            
            VStack(spacing: 10){
                Image(systemName: "envelope.fill")
                    .foregroundColor(.blue)
                
                Text("mail")
                    .foregroundColor(.blue)
            } .padding()
                .background(Color.white)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 16).stroke(.gray, lineWidth: 1))
            
                
            
        }.padding()
    }
}
