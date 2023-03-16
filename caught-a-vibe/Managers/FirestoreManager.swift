//
//  FirestoreManager.swift
//  caught-a-vibe
//
//  Created by Hunter Newton on 3/15/23.
//

import Foundation
import Firebase

class FirestoreManager: ObservableObject {
    
    func createUser(userFirstName: String, userLastName: String, userEmail: String, uid: String) {
        let db = Firestore.firestore()
        
        let docRef = db.collection("Users").document(userEmail)
        
        docRef.setData([
            "first_name" : userFirstName,
            "last_name" : userLastName,
            "email" : userEmail,
            "uid" : uid
        ]) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
}
