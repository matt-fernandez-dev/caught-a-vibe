//
//  MessageModel.swift
//  caught-a-vibe
//
//  Created by Matthew Fernandez on 3/28/23.
//

import Foundation
import FirebaseFirestoreSwift
struct ChatMessageModel: Codable, Identifiable {
    @DocumentID var id: String?
    let fromId, toId, text: String
    let timestamp: Date
}
