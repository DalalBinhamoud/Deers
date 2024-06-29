//
//  Routes.swift
//  Deers
//
//  Created by Dalal Macbook on 29/06/2024.
//

import Foundation

public enum Routes: Hashable {
    case login
    case register
    case home
}

// MARK: - home
public enum HomeRoutes: Hashable {
    case reviews
    case submitReview
}
