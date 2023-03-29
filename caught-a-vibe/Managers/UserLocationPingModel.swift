//
//  LocationPingModel.swift
//  caught-a-vibe
//
//  Created by Matthew Fernandez on 3/28/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct LocationPingModel: Identifiable, Codable {
    
    @DocumentID var id: String?
    var coordinate: GeoPoint
    var timestamp: Timestamp
    var user_id: String
    
    
    
}

