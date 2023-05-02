//
//  Util.swift
//  Deers
//
//  Created by Dalal Macbook on 01/05/2023.
//

import Foundation
import SwiftUI

enum Result {
    case Alignment
    case HorizontalAlignment
    case TextAlignment
    case Edge
}

struct Util{


//    func getGenericDir<Result> () -> Result{
//            return Locale.autoupdatingCurrent.languageCode == "en" ? Alignment.leading as Result! : Alignment.trailing as Result!
//    }


    //get alignment based on selected language
    func getDir () -> Alignment{
        return Locale.autoupdatingCurrent.languageCode == "en" ? Alignment.leading : Alignment.trailing
    }

    func getHorizontalDir () -> HorizontalAlignment{
        return Locale.autoupdatingCurrent.languageCode == "en" ? HorizontalAlignment.leading : HorizontalAlignment.trailing
    }

    func getReverseDir () -> Alignment{
        return Locale.autoupdatingCurrent.languageCode == "en" ? Alignment.trailing : Alignment.leading
    }

    func getTextDir () -> TextAlignment{
        return Locale.autoupdatingCurrent.languageCode == "en" ? TextAlignment.leading : TextAlignment.trailing
    }

    func getDirSet () -> Edge.Set{
        return Locale.autoupdatingCurrent.languageCode == "en" ? [Edge.Set.trailing] : [Edge.Set.leading]
    }

}
