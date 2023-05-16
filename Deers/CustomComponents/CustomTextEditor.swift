//
//  CustomTextEditor.swift
//  Deers
//
//  Created by Dalal Macbook on 01/05/2023.
//

import SwiftUI

struct CustomTextEditor: View {
    @ObservedObject private var validatedTextEditor = ValidatedTextEditor()
    @Binding var value : String
    @Binding var valueCounter :Int

    var body: some View {
        VStack(alignment: Util.getHorizontalDir()){
            TextEditor(text: $validatedTextEditor.reviewerInput)
                .padding(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color(.systemGray5), lineWidth: 1.0)
                )
                .autocapitalization(.none)
                .lineLimit(Constants.maxLength.textLines)
                .multilineTextAlignment(.trailing)
                .onChange(of: validatedTextEditor.reviewerInput){ (value) in
                    self.valueCounter = self.validatedTextEditor.reviewerInput.count
                    self.value = validatedTextEditor.reviewerInput
                }

            Text(valueCounter <= 1 ? "\(self.valueCounter) /\(Constants.maxLength.textEditor)" : "\(valueCounter) /\(Constants.maxLength.textEditor)")
                .foregroundColor(Constants.Colors.secondaryColor)


        }

    }
}

struct CustomTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextEditor(value: .constant(""),valueCounter: .constant(0))
    }
}
