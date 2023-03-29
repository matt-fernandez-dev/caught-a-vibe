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
    
    @Published var errorMessage = ""
    @Published var currentUser: UserModel?
    @Published var isUserCurrentlyLoggedOut = false
    
//    static let sharedUsersManager = UsersManager()
    
    init() {
        
        DispatchQueue.main.async {
            self.isUserCurrentlyLoggedOut = FirebaseManager.shared.auth.currentUser == nil
        }
        
        fetchCurrentUser()
    }
    
    private func fetchCurrentUser() {
        
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "Could not find firebase uid"
            return
        }
        
        FirebaseManager.shared.firestore.collection("users").document(uid).getDocument { snapshot, error in
            if let error = error {
                self.errorMessage = "failed to fetch current user \(error)"
                return
            }
            
            guard let data = snapshot?.data() else {
                self.errorMessage = "No data found"
                return
            }
            
//            let uid = data["uid"] as? String ?? ""
            let email = data["email"] as? String ?? ""
            let first_name = data["first_name"] as? String ?? ""
            let last_name = data["last_name"] as? String ?? ""
            
            self.currentUser = UserModel(id: uid, email: email, first_name: first_name, last_name: last_name)
            
            print(self.currentUser?.id as Any)
        }
    }
    
//    func handleSignOut() {
//        isUserCurrentlyLoggedOut.toggle()
//        try? FirebaseManager.shared.auth.signOut()
//    }
    
    func createUser(first_name: String, last_name: String, email: String, uid: String){

        do{
            let newUser = UserModel(id: uid, email: email, first_name: first_name, last_name: last_name)

            try FirebaseManager.shared.firestore.collection("users").document(uid).setData(from: newUser)
        } catch {
            print("Error adding user to Firestore: \(error)")
        }
    }
}
