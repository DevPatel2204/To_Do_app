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
    @Published private(set) var tasks : [Task] = []
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
    
    func getTask() {
        if let localRealm = localRealm {
            let allTask = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTask .forEach{ task in
                tasks.append(task)
            }
        }
    }
    
    func updatetask(id:ObjectId,completed:Bool) {
        if let localRealm = localRealm {
            do{
               let tasktoupdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@",id))
                guard !tasktoupdate.isEmpty else{return}
                
                try localRealm.write{
                    tasktoupdate[0].completed = completed
                    getTask()
                    print("Updated task with id \(id)! completed status : \(completed)")
                }
            }catch{
                print("error updateing task \(id) to Realm")
            }
        }
    }
    
    func deltedtask(id:ObjectId){
        if let localRealm = localRealm{
            do {
                let tasktodelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@",id))
                 guard !tasktodelete.isEmpty else{return}
                
                try localRealm.write{
                    localRealm.delete(tasktodelete)
                    getTask()
                    print("Deleted task with id \(id)")
                }
            }catch{
                print("Error deleting \(id) from Realm \(error)")
            }
        }
    }
}
