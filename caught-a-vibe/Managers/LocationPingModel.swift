//
//  LocationPingModel.swift
//  caught-a-vibe
//
//  Created by Matthew Fernandez on 3/28/23.
//

import Foundation
import FirebaseFirestore


struct LocationPingModel: Identifiable, Codable {
    
    var id: String
    var geopoint: GeoPoint
    var timestamp: Timestamp
    
    
    
}

