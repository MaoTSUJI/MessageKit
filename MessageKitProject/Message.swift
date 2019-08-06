//
//  Message.swift
//  MessageKitProject
//
//  Created by 辻真緒 on 2019/08/05.
//  Copyright © 2019 辻真緒. All rights reserved.
//

import MessageKit

// 1件のメッセージのデータを持つクラス
class Message: MessageType {
    
    // 下記4件はデフォルトで必須にしたい
    // 送信者
    let user: ChatUser
    // メッセージの本文
    let text: String
    // メッセージID(1件のメッセージを特定するため)
    let messageId: String
    // 送信日付
    let sentDate: Date
    
    // コンストラクタ
    init(user: ChatUser, text: String, messageId: String, sentDate: Date) {
        
        self.user = user
        self.text = text
        self.messageId = messageId
        self.sentDate = sentDate
        
    }
    
    // メッセージの送信者を返す
    var sender: SenderType {
        return Sender(id: user.senderId, displayName: user.displayName)
    }
    // メッセージのタイプを返す
    var kind: MessageKind {
        return .text(text)
    }
    
}
