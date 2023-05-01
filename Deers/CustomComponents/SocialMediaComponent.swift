//
//  SocialMediaComponent.swift
//  Deers
//
//  Created by Dalal Macbook on 01/05/2023.
//

import SwiftUI

struct SocialMediaComponent: View {
    var iconName: String
    var name: String

    var body: some View {

        HStack{
            Image(iconName).resizable().frame(width: 32.0, height: 32.0)
            Text(name).font(.system(size: Constants.customFontSize.largeTxt)).foregroundColor(Constants.Colors.secondaryColor).lineLimit(1).minimumScaleFactor(0.1)

        }
    }
}

struct SocialMediaComponent_Previews: PreviewProvider {
    static var previews: some View {
        SocialMediaComponent(iconName: "twitter", name: "twitter")
    }
}
