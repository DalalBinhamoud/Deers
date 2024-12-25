//
//  LoginView.swift
//  Deers
//
//  Created by Dalal Macbook on 01/05/2023.
//

import SwiftUI

struct LoginView<ViewModel>: View  where ViewModel: LoginViewModelProtocol {

    // MARK: - Properties
    @EnvironmentObject var router: Router<Routes>
    @State private var showPassword = false
    @ObservedObject var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }

    // MARK: - Body
    var body: some View {
        NavigationStack{
            GeometryReader{ geo in
                ZStack{
                    VStack(alignment: .center) {
                        Spacer()
                        Image(Constant.Image.backgroung)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.3, height: geo.size.height * 0.3)

                        CustomEmailField(email: $viewModel.email)

                        CustomPasswordField(password: $viewModel.password, showPassword: $showPassword)

                        Button(
                            action: {
                                Task{
                                    await viewModel.performLogin()
                                }
                            }, label: {
                                Text(LocalizedStrings.login).btnLabelTextStyle()
                            })
                        .background(
                            .black.opacity(0.3))
                        .cornerRadius(40).padding()
                        .alert(LocalizedStrings.credentialError, isPresented: $viewModel.showError) {
                            Button(LocalizedStrings.ok, role: .cancel) { }
                        }
                        HStack{
                            Text(LocalizedStrings.dontHaveAccount).foregroundColor(DesignSystem.Colors.labelColor)

                            Button(LocalizedStrings.register) {
                                router.push(to: .register)
                            }

                        }

                        Spacer()
                    }.padding()
                }.background(DesignSystem.Colors.secondaryColor)

            }  .alert(LocalizedStrings.error, isPresented: $viewModel.showError){
                Button(LocalizedStrings.close){

                }
            } message:{
                Text(viewModel.errorMessage)
            }
        }

    }
}

private enum Constant {
    enum Image {
        static let backgroung = "backgroung"
    }

    enum Size {
        static let large = 0.3
    }
}

private enum LocalizedStrings {
    static let close = String(localized: "close")
    static let credentialError = String(localized: "credential_error")
    static let dontHaveAccount = String(localized: "dont_have_account")
    static let error = String(localized: "error")
    static let login = String(localized: "login")
    static let ok = String(localized: "ok")
    static let register = String(localized: "register")
}

// MARK: - Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(
            viewModel: ViewModelFixture()
        )
    }
}

extension LoginView_Previews {
    class ViewModelFixture: LoginViewModelProtocol {
        var email = ""
        var password = ""
        var errorMessage = ""
        var showError = false
        func performLogin() async { }
    }
}
