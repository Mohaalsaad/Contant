//
//  AllPhonePage.swift
//  Contact
//
//  Created by Mohammed on 17/11/1444 AH.
//

import SwiftUI

struct AllPhonePage: View {
    @State private var searchText = ""
    @StateObject var vm = MyUsers()
    @State private var showingSheet = false
    @State private var showingSheet2 = false
    @State private var selectedRow: UserInfo?
    
    var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach(vm.userInfo){ user in
                        Text(user.company)
                            .onTapGesture {
                                selectedRow = user
                                print(user.firstname)
                                showingSheet2.toggle()
                              //  print(selectedRow?.company)
                            }
                    }
                        
                    }.sheet(item: $selectedRow ){ toShow in
                        InfoPage(user: toShow)}
                    
                }
                .scrollContentBackground(.hidden)
                .navigationTitle("Contact")
                .toolbar{
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Text("+")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                    }.sheet(isPresented: $showingSheet) {
                        NewPage()
                    }
                }
                .searchable(text: $searchText)
            }
        }
    }



struct AllPhonePage_Previews: PreviewProvider {
    static var previews: some View {
        AllPhonePage()
    }
}
