//
//  HomeMapViewModel.swift
//  caught-a-vibe
//
//  Created by Matthew Fernandez on 3/20/23.
//

import Foundation
import Firebase

class HomeMapViewModel: ObservableObject {
    
    @Published var userList = [Users]()
    
    func getData() {
        
        //Get a reference to the database
        let db = Firestore.firestore()
        //Read the documents at a specific path
        db.collection("Users").getDocuments { snapshot, error in
            if error == nil {
                // no errors
                
                if let snapshot = snapshot {
                    
                    //Update the list property in the main thread
                    DispatchQueue.main.async {
                        self.userList = snapshot.documents.map { d in
                            return Users(id: d.documentID,
                                        email: d["email"] as? String ?? "",
                                        first_name: d["first_name"] as? String ?? "",
                                        last_name: d["last_name"] as? String ?? "",
                                        uid: d["uid"] as? String ?? "")
                        }
                    }
                    //Get all documents and create Users
                    
                }
            }
            else {
                // Handle errors
            }
        }
    }
}
