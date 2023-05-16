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
        return Locale.current.language.languageCode?.identifier == "en" ? Alignment.leading : Alignment.trailing
    }

    func getHorizontalDir () -> HorizontalAlignment{
        return Locale.current.language.languageCode?.identifier == "en" ? HorizontalAlignment.leading : HorizontalAlignment.trailing
    }

    func getReverseDir () -> Alignment{
        return Locale.current.language.languageCode?.identifier == "en" ? Alignment.trailing : Alignment.leading
    }

    func getTextDir () -> TextAlignment{
        return Locale.current.language.languageCode?.identifier == "en" ? TextAlignment.leading : TextAlignment.trailing
    }

    static func getDirSet () -> Edge.Set{
        return Locale.current.language.languageCode?.identifier == "en" ? [Edge.Set.trailing] : [Edge.Set.leading]
    }

    static func isEmailValid(_ email:String) -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                    Constants.Regex.emailRegex)
        return emailTest.evaluate(with: email)
    }
}
