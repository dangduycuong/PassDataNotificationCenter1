//
//  NotificationName.swift
//  PassDataNotificationCenter1
//
//  Created by Dang Duy Cuong on 1/20/21.
//  Copyright © 2021 Cuong. All rights reserved.
//

import Foundation

extension Notification.Name {
    
    static var key1: Notification.Name {
          return .init(rawValue: "key1")
    }
    
    static let key2 = Notification.Name("key2")
}
