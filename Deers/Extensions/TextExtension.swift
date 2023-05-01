//
//  TextExtension.swift
//  Deers
//
//  Created by Dalal Macbook on 01/05/2023.
//

import SwiftUI

extension Text {

    func mainTextStyle() -> some View {
        self.foregroundColor(Constants.Colors.secondaryColor)
            .font(.system(size: Constants.customFontSize.largeTxt))
    }

    func labelTextStyle() -> some View {
        self.foregroundColor(Constants.Colors.secondaryColor)
            .font(.system(size: Constants.customFontSize.subtitle))
    }


}

extension TextField {
    func TextFieldStyle() -> some View {
        self.padding(25).background(RoundedRectangle(cornerRadius: 40).fill(Constants.Colors.labelColor)).multilineTextAlignment(Locale.autoupdatingCurrent.languageCode == "en" ? .leading : .trailing)
    }
}

extension SecureField {
    func TextFieldStyle() -> some View {
        self.padding(25).background(RoundedRectangle(cornerRadius: 40).fill(Constants.Colors.labelColor)).multilineTextAlignment(Locale.autoupdatingCurrent.languageCode == "en" ? .leading : .trailing)
    }
}
