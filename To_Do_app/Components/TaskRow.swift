//
//  TaskRow.swift
//  To_Do_app
//
//  Created by Dev Patel on 15/06/24.
//

import SwiftUI

struct TaskRow: View {
    var task : String
    var completed : Bool
    var body: some View {
        HStack{
            Image(systemName: completed ? "checkmark.circle" : "circle" )
            
            Text(task)
        }
    }
}

#Preview {
    TaskRow(task: "Enter a Task", completed: false)
}
