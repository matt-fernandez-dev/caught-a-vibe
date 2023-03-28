//
//  User.swift
//  caught-a-vibe
//
//  Created by Matthew Fernandez on 3/27/23.
//

import Foundation
import FirebaseFirestoreSwift

struct UserModel: Identifiable, Codable {
    
    @DocumentID var id: String?
    var email: String
    var first_name: String
    var last_name: String
    
    
    
}
