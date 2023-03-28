//
//  UserManager.swift
//  caught-a-vibe
//
//  Created by Matthew Fernandez on 3/27/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class UsersManager: ObservableObject {
    
    static let sharedUsersManager = UsersManager()
    let db = Firestore.firestore()
    
    //func getUser()
    
    //func getAllUsers
    
    func createUser(first_name: String, last_name: String, email: String, uid: String){
        
        do{
            let newUser = UserModel(id: uid, email: email, first_name: first_name, last_name: last_name)
            
            try db.collection("users").document(uid).setData(from: newUser)
        } catch {
            print("Error adding user to Firestore: \(error)")
        }
    }
}
