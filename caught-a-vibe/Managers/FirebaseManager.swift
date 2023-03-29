//
//  FirebaseManager.swift
//  caught-a-vibe
//
//  Created by Hunter Newton on 3/29/23.
//

import Foundation

import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class FirebaseManager: NSObject, ObservableObject {
    
    @Published var loggedUser: User?
    
    let auth: Auth
    let storage: Storage
    let firestore: Firestore
    
    static let shared = FirebaseManager()
    
    var handle : AuthStateDidChangeListenerHandle?
    
    private func authStateChanged(with auth: Auth, user: User?) {
        guard user != self.loggedUser else { return }
        self.loggedUser = user
    }
    
    override init() {
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()
        loggedUser = auth.currentUser
        super.init()
        handle = auth.addStateDidChangeListener(authStateChanged)
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch(let error) {
            debugPrint(error.localizedDescription)
        }
    }
    
}
