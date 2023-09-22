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
    
    var username: String {
        email.components(separatedBy: "@").first ?? email
    }
    
    var timeAgo: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(for: timestamp, relativeTo: Date())
    }
    
    init(documentId: String, data: [String: Any]) {
        self.documentId = documentId
        self.text = data[FirebaseConstants.text] as? String ?? ""
        self.fromId = data[FirebaseConstants.fromId] as? String ?? ""
        self.toId = data[FirebaseConstants.toId] as? String ?? ""
        self.email = data[FirebaseConstants.email] as? String ?? ""
        self.profileImageUrl = data[FirebaseConstants.profileImageUrl] as? String ?? ""
        self.timestamp = (data[FirebaseConstants.timestamp] as? Timestamp)?.dateValue() ?? Date()
    }
}
