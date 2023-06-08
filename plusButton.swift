//
//  plusButton.swift
//  Contact
//
//  Created by Mohammed on 17/11/1444 AH.
//

import SwiftUI

struct plusButton: View {
    @State private var isTabed = false
    var body: some View {
        Button(action: {
            print("Circular Button tapped")
        }) {
            Image(systemName: "plus.circle.fill")
                .foregroundColor(.green)
                .frame(width: 20 , height: 20)
        }
        
    }
}

struct plusButton_Previews: PreviewProvider {
    static var previews: some View {
        plusButton()
    }
}
