//
//  ViewController.swift
//  MessageKitProject
//
//  Created by 辻真緒 on 2019/08/05.
//  Copyright © 2019 辻真緒. All rights reserved.
//

import UIKit
import MessageKit
import InputBarAccessoryView

// UIViewControllerからMessagesViewControllerに変更することによって、チャット画面を作成するために使える便利な機能を使用できるようになります。
class ViewController: MessagesViewController {
    
    // 全メッセージを保持する配列
    var messageList: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        messageInputBar.delegate = self
    }

}

extension ViewController: MessagesDataSource {
    
    // 自分の情報
    func currentSender() -> SenderType {
        let id = "1234"
        let name = "SeedKun"
        return ChatUser(senderId: id, displayName: name)
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        
        return messageList[indexPath.section]
    }
    
    // メッセージの件数
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messageList.count
    }
    
}

extension ViewController: InputBarAccessoryViewDelegate {
    
    // 送信ボタンがクリックされた時の処理
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        
        // 送信者の作成(自分の情報を取得)
        let me = self.currentSender() as! ChatUser
        
        // メッセージの作成
        let message = Message(user: me, text: text, messageId: UUID().uuidString, sentDate: Date())
        messageList.append(message)
        
        // 作成したメッセージを画面に追加
        messagesCollectionView.insertSections([messageList.count - 1])
        
        // 入力バーのリセット
        inputBar.inputTextView.text = ""
        
        // 返信を作成
        let other = ChatUser(senderId: "99999", displayName: "UserName")
        
        var replyText: String = ""

        switch message.text {
        case "名前","なまえ":
            replyText = "辻　真緒です"
        case "年齢", "年", "いくつ":
            replyText = "教えません"
        case "誕生日", "いつ生まれ":
            replyText = "3月6日生まれです"
        case "血液型":
            replyText = "AB型です"
        case "出身地", "どこ生まれ","出身":
            replyText = "ほぼ大阪な兵庫県です。"
        default:
            replyText = "よくわかりません"
        }
        
        let replyMessage = Message(user: other, text:replyText , messageId: UUID().uuidString, sentDate: Date())
        
        messageList.append(replyMessage)
        
        messagesCollectionView.insertSections([messageList.count - 1])
        
    }
    
}

extension ViewController: MessagesLayoutDelegate {
    
}

extension ViewController: MessagesDisplayDelegate {

}
