//
//  RealmManager.swift
//  To_Do_app
//
//  Created by Dev Patel on 16/06/24.
//

import Foundation
import RealmSwift

class RealmManager : ObservableObject{
    private(set) var localRealm : Realm?
    
    init(){
        openRealm()
    }
    
    func openRealm(){
        do{
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
        }catch{
            print("Error opening Realm \(error)")
        }
    }
    
    func addtask(taskTitle : String){
        if let localRealm = localRealm {
            do{
                try localRealm.write{
                    let newTask = Task(value: ["title":taskTitle , "completed":false])
                    localRealm.add(newTask)
                    print("Added new Task to Realm: \(newTask)")
                }
            } catch{
               print("error adding new task to Realm:\(error)")
            }
        }
    }
}
