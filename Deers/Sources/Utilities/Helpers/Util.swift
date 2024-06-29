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

class Util{

//    func getGenericDir<Result> () -> Result{
//            return Locale.autoupdatingCurrent.languageCode == "en" ? Alignment.leading as Result! : Alignment.trailing as Result!
//    }


    //get alignment based on selected language
    func getDir () -> Alignment{
        return Locale.autoupdatingCurrent.languageCode == "ar" ? Alignment.leading : Alignment.trailing
    }

    static func getHorizontalDir () -> HorizontalAlignment{
        return Locale.autoupdatingCurrent.languageCode == "ar" ? HorizontalAlignment.leading : HorizontalAlignment.trailing
    }

    func getReverseDir () -> Alignment{
        return Locale.autoupdatingCurrent.languageCode == "ar" ? Alignment.trailing : Alignment.leading
    }

    func getTextDir () -> TextAlignment{
        return Locale.autoupdatingCurrent.languageCode == "ar" ? TextAlignment.leading : TextAlignment.trailing
    }

    static func getDirSet () -> Edge.Set{
        return Locale.autoupdatingCurrent.languageCode == "ar" ? [Edge.Set.trailing] : [Edge.Set.leading]
    }

    static func isEmailValid(_ email:String) -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                    Constants.Regex.emailRegex)
        return emailTest.evaluate(with: email)
    }
}
