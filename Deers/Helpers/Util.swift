//
//  Util.swift
//  Deers
//
//  Created by Dalal Macbook on 01/05/2023.
//

import Foundation
import SwiftUI

struct Util{
    func getDir () -> Alignment{
        return Locale.autoupdatingCurrent.languageCode == "en" ? Alignment.leading : Alignment.trailing
    }

    func getDirSet () -> Edge.Set{
        return Locale.autoupdatingCurrent.languageCode == "en" ? [Edge.Set.trailing] : [Edge.Set.leading]
    }
}
