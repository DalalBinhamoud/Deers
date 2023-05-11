//
//  Review.swift
//  Deers
//
//  Created by Dalal Macbook on 26/04/2023.
//

import Foundation

struct Review : Identifiable{
    var id: String
    var status: String
    var date : Date
    var time : String
    var note: String
    var contactNumber: String
}


enum Status: String {
    case good = "good"
    case ok = "ok"
    case bad = "bad"
}
