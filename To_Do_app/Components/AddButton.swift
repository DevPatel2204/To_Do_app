//
//  AddButton.swift
//  To_Do_app
//
//  Created by Dev Patel on 15/06/24.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 50)
                .foregroundColor(.green)
            Image(systemName: "plus")
                .foregroundStyle(.white)
                .fontWeight(.bold)
        }.frame(width: 50,height: 50)
    }
}

#Preview {
    AddButton()
}
