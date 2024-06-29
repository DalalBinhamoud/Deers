//
//  CustomEmailField.swift
//  Deers
//
//  Created by Dalal Macbook on 16/05/2023.
//

import SwiftUI

struct CustomEmailField: View {
    @Binding var email : String

    var body: some View {
        VStack(alignment: Util.getHorizontalDir()){
            TextField("email", text: $email , prompt: Text(NSLocalizedString("email", comment: ""))).TextFieldStyle()
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            Text(Util.isEmailValid(email) ? "" : "\(NSLocalizedString("email_validation", comment: ""))").foregroundColor(Constants.Colors.labelColor).padding(5)
            
        }

    }
}

struct CustomEmailField_Previews: PreviewProvider {
    static var previews: some View {
        CustomEmailField(email: .constant(""))
    }
}
