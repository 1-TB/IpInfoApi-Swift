//
//  Item.swift
//  IpInfoApi-Swift
//
//  Created by Jordan Carter on 4/15/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
