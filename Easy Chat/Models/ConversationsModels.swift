//
//  ConversationsModels.swift
//  Easy Chat
//
//  Created by ZipEnter on 17/02/2021.
//

import Foundation

struct Conversation {
    let id: String
    let name: String
    let otherUserEmail: String
    let latestMessage: LatestMessage
}

struct LatestMessage {
    let date: String
    let text: String
    let isRead: Bool
}
