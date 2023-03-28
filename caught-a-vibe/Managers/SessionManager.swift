//
//  SessionManager.swift
//  caught-a-vibe
//
//  Created by Hunter Newton on 3/14/23.
//

import Foundation
import SwiftUI
import Firebase

class SessionManager: NSObject, ObservableObject {
    
    @Published var loggedUser: User?
    static let shared = SessionManager()
    private let auth = Auth.auth()
    
    let firestoreManager = FirestoreManager()
    let usersManager = UsersManager()
    
    var handle : AuthStateDidChangeListenerHandle?
    
    override private init() {
        loggedUser = auth.currentUser
        super.init()
        handle = auth.addStateDidChangeListener(authStateChanged)
    }
    
    private func authStateChanged(with auth: Auth, user: User?) {
        guard user != self.loggedUser else { return }
        self.loggedUser = user
    }
        
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch(let error) {
            debugPrint(error.localizedDescription)
        }
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                print("success")
            }
        }
    }
    
    func signup(email: String, password: String, firstName: String, lastName: String, userEmail: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                self.usersManager.createUser(first_name: firstName, last_name: lastName, email: email, uid: authResult!.user.uid)
                print("success")
            }
        }
    }
    
    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    deinit {
        unbind()
    }
    
}
