//
//  ContentView.swift
//  To_Do_app
//
//  Created by Dev Patel on 15/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showaddtask = false
    var body: some View {
        ZStack(alignment:.bottomTrailing) {
        Color(hue: 0.086, saturation: 0.141, brightness: 0.972)
            
            TaskView()
            
            AddButton()
                .padding(30)
                .onTapGesture {
                    showaddtask.toggle()
                }
                .sheet(isPresented:$showaddtask) {
                    AddtaskView()
                }
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    ContentView()
}
