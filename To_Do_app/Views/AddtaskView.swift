//
//  Addtask.swift
//  To_Do_app
//
//  Created by Dev Patel on 15/06/24.
//

import SwiftUI

struct AddtaskView: View {
    @State private var newtask : String = ""
    @Environment (\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color(hue: 0.086, saturation: 0.141, brightness: 0.972)
                .ignoresSafeArea()
            VStack(alignment: .leading){
                Text("Add Task")
                    .font(.title)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .padding(.horizontal)
                
                TextField("Enter new Task", text: $newtask)
                    .padding()
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .background(.white)
                    .padding()
                
                Button(action: {
                    print("Task Successfully added")
                    dismiss()
                }, label: {
                    Text("Add Task")
                        .padding()
                        .foregroundStyle(.white)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 100))
                        .padding(.horizontal)
                    
                })
                Spacer()
            }
        }
    }
}

#Preview {
    AddtaskView()
}
