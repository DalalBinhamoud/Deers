//
//  ValidatedTextEditor.swift
//  Deers
//
//  Created by Dalal Macbook on 01/05/2023.
//

import Foundation
import AudioToolbox

class ValidatedTextEditor : ObservableObject {
    @Published var reviewerInput = "" {
        didSet{
            if reviewerInput.count > Constants.maxLength.textEditor{
                reviewerInput = String(reviewerInput.prefix(Constants.maxLength.textEditor))
                AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) { return }
            }
        }
    }


}
