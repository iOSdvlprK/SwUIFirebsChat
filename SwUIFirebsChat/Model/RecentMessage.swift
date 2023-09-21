//
//  RecentMessage.swift
//  SwUIFirebsChat
//
//  Created by joe on 2023/09/20.
//

import Foundation
import Firebase
//import FirebaseFirestoreSwift

struct RecentMessage: Identifiable {
    var id: String { documentId }
//    @DocumentID var id: String?
    
    let documentId: String
    let text, fromId, toId: String
    let email, profileImageUrl: String
    let timestamp: Date
    
    init(documentId: String, data: [String: Any]) {
        self.documentId = documentId
        self.text = data["text"] as? String ?? ""
        self.fromId = data["fromId"] as? String ?? ""
        self.toId = data["toId"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.profileImageUrl = data["profileImageUrl"] as? String ?? ""
        self.timestamp = data["timestamp"] as? Date ?? Date()
    }
}
