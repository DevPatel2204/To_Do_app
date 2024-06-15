//
//  TaskView.swift
//  To_Do_app
//
//  Created by Dev Patel on 15/06/24.
//

import SwiftUI

struct TaskView: View {
    var body: some View {
        
        ZStack {
            Color(hue: 0.086, saturation: 0.141, brightness: 0.972)
                .ignoresSafeArea()
            VStack{
                Text("My To-Do List")
                    .font(.title)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
            }
        }
    }
}

#Preview {
    TaskView()
}
