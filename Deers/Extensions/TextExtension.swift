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
            .font(.custom("riesling",size: Constants.customFontSize.largeTxt))
    }

    func labelTextStyle() -> some View {
        self.foregroundColor(Constants.Colors.secondaryColor)
            .font(.custom("riesling",size: Constants.customFontSize.subtitle))
    }

    func btnLabelTextStyle() -> some View {
        self.font(.system(size: Constants.customFontSize.largeTxt)).foregroundColor(Constants.Colors.labelColor).padding(25)
    }

}

extension TextField {
    func TextFieldStyle() -> some View {
        self.padding(25).background(RoundedRectangle(cornerRadius: 40).fill(Constants.Colors.labelColor)).multilineTextAlignment(Util().getTextDir())
    }
}

extension SecureField {
    func TextFieldStyle() -> some View {
        self.padding(25).background(RoundedRectangle(cornerRadius: 40).fill(Constants.Colors.labelColor)).multilineTextAlignment(Util().getTextDir())
    }
}
