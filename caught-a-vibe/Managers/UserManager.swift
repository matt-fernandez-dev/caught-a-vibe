//
//  UserManager.swift
//  caught-a-vibe
//
//  Created by Matthew Fernandez on 3/27/23.
//

import Foundation

class UserManager: ObservableObject {
    
    @Published var errorMessage = ""
    @Published var currentUser: UserModel?
    @Published var isUserCurrentlyLoggedOut = false
    
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
            
            let email = data["email"] as? String ?? ""
            let first_name = data["first_name"] as? String ?? ""
            let last_name = data["last_name"] as? String ?? ""
            
            self.currentUser = UserModel(id: uid, email: email, first_name: first_name, last_name: last_name)
            
            print(self.currentUser?.id as Any)
        }
    }
    
    func handleSignOut() {
        isUserCurrentlyLoggedOut.toggle()
        try? FirebaseManager.shared.auth.signOut()
    }
    
    func createUser(first_name: String, last_name: String, email: String, uid: String){

        do{
            let newUser = UserModel(id: uid, email: email, first_name: first_name, last_name: last_name)

            try FirebaseManager.shared.firestore.collection("users").document(uid).setData(from: newUser)
        } catch {
            print("Error adding user to Firestore: \(error)")
        }
    }
    
    func signup(email: String, password: String, firstName: String, lastName: String, userEmail: String) {
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                self.createUser(first_name: firstName, last_name: lastName, email: email, uid: authResult!.user.uid)
                print("success")
            }
        }
    }
    
    func loginUser(email: String, password: String) {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) {
            result, error in
            if let err = error {
//                self.loginStatusMessage = "Failed to sign in: \(err.localizedDescription)"
                print(err)
                return
            }
            
//            self.loginStatusMessage = "Successfully signed in user: \(result?.user.uid ?? "")"
        }
    }
    
    func logout() {
        do {
            try FirebaseManager.shared.auth.signOut()
        } catch(let error) {
            debugPrint(error.localizedDescription)
        }
    }
}
