//
//  ChatUser.swift
//  MessageKitProject
//
//  Created by 辻真緒 on 2019/08/05.
//  Copyright © 2019 辻真緒. All rights reserved.
//
import MessageKit

class ChatUser: SenderType {
    
    //ユーザーID
    var senderId: String
    // 表示名
    var displayName: String
    
    // コンストラクタ（クラスをインスタンス化する時に呼ばれるもの）
    // ChatUserを作る時は、必ずユーザーIDと表示名を設定するようにする
    init(senderId: String, displayName: String) {
        
        self.senderId = senderId
        self.displayName = displayName
        
        
    }
    
    
}


