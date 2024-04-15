//
//  Item.swift
//  IpInfoApi-Swift
//
//  Created by Jordan Carter on 4/15/24.
//

import Foundation

struct IP: Codable {
    let ip, city, region, country: String?
    let loc, org, postal, timezone: String?
}
