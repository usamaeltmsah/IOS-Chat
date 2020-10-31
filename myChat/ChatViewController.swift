//
//  ChatViewController.swift
//  myChat
//
//  Created by Usama Eltmsah on 10/31/20.
//

import UIKit
import MessageKit

struct Sender: SenderType {
    var displayName: String
    var senderId: String
}

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

class ChatViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    
    let currentUser = Sender(displayName: "self", senderId: "IOS")
    
    let user2 = Sender(displayName: "User 2", senderId: "Android")
    
    var messages = [MessageType]()
    
    
    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        messages.append(Message(sender: currentUser, messageId: "1", sentDate: Date().addingTimeInterval(-86400), kind: .text("Hello")))
        
        messages.append(Message(sender: user2, messageId: "2", sentDate: Date().addingTimeInterval(-70400), kind: .text("I love Mandela")))
        
        messages.append(Message(sender: currentUser, messageId: "3", sentDate: Date().addingTimeInterval(-46400), kind: .text("This is Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Messages")))
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
}
