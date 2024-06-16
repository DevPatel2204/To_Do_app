//
//  TaskView.swift
//  To_Do_app
//
//  Created by Dev Patel on 15/06/24.
//

import SwiftUI

struct TaskView: View {
    var body: some View {
        @EnvironmentObject var realmManager: RealmManager
        ZStack {
            Color(hue: 0.086, saturation: 0.141, brightness: 0.972)
                .ignoresSafeArea()
            VStack{
                Text("My To-Do List")
                    .font(.title)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                
                List{
                    ForEach(realmManager.task,id: \.id){
                        task in
                        TaskRow(task:task.newtask,completed: task.completed)
                    }
                }
                .onAppear(perform: {
                    UITableView.appearance().backgroundColor=UIColor.clear
                    UITableViewCell.appearance().backgroundColor = UIColor.clear
                })
            }
            
        }
    }
}

#Preview {
    TaskView()
        .environmentObject(RealmManager())
}
