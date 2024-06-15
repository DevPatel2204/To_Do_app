//
//  Task.swift
//  To_Do_app
//
//  Created by Dev Patel on 16/06/24.
//

import Foundation
import RealmSwift

class Task : Object , ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
