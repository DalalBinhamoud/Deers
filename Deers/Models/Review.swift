//
//  Review.swift
//  Deers
//
//  Created by Dalal Macbook on 26/04/2023.
//

import Foundation

struct Review : Identifiable{
    let id:UUID
    var status: Status
    var comment: String
    var phone : String
}


enum Status: String {
    case good = "good"
    case ok = "ok"
    case bad = "bad"
}
