//
//  SubmitReviewView.swift
//  Deers
//
//  Created by Dalal Macbook on 26/04/2023.
//

import SwiftUI

struct SubmitReviewView: View {

    @State private var touchedBtnStatus = ""
    @State private var notes = ""
    @State private var phone = ""
    @State private var showError = false
    @State private var noteCounter = 0
    @ObservedObject var reviewsVM = ReviewViewModel()


    var body: some View {
        GeometryReader{ geo in

            VStack{
                ScrollView {
                    // status
                    Text(NSLocalizedString("experience_question", comment: "")).mainTextStyle()
                    HStack{
                        ForEach(Constants.fixedLists.reviewStatus, id:\.self){ status in
                            Button(action: {self.touchedBtnStatus = status.rawValue}){
                                Image(self.touchedBtnStatus == status.rawValue ? "\(status.rawValue)-1" : status.rawValue).resizable().scaledToFill().frame(width: geo.size.width * 0.33, height: 200)
                            }
                        }
                    }

                    VStack(alignment:Util.getHorizontalDir()){

                        // note
                        Text(NSLocalizedString("notes", comment: "")).labelTextStyle()
                        CustomTextEditor(value: $notes, valueCounter: $noteCounter).padding([.bottom])
                        
                        // phone
                        Text(NSLocalizedString("phone", comment: "")).labelTextStyle()
                        TextField("", text: $phone)
                            .onChange(of: phone, perform: {
                                phone = String($0.prefix(Constants.maxLength.phoneField))
                            })
                            .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color(.systemGray5),lineWidth: 1.0))
                            .keyboardType(.numberPad)

                    }.padding()

                    // submit button
                    Button(action: submitReview){
                        Text(NSLocalizedString("submit", comment: "")).foregroundColor(Constants.Colors.labelColor)
                            .font(.system(size: Constants.customFontSize.title))
                    }
                    .frame(width: geo.size.width * 0.33, height: geo.size.height * 0.05)
                    .background(Constants.Colors.secondaryColor)
                    .clipShape(Capsule())


                }
                .alert(NSLocalizedString("error", comment: ""), isPresented: $showError){
                    Button(NSLocalizedString("close", comment: "")){}
                } message:{
                    Text(NSLocalizedString("submit_error", comment: ""))
                }


                //footer
                Divider().foregroundColor(Constants.Colors.primaryColor)
                HStack{
                    Spacer()
                    ForEach(Constants.fixedLists.socialMediaContent, id: \.id){ content in
                        SocialMediaComponent(iconName: content.icon, name: content.name)
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
    }// end of body

    func submitReview(){
        if(touchedBtnStatus == ""){
            self.showError = true
        }else{
            reviewsVM.addReview(status: touchedBtnStatus, note: notes, contactNumber: phone)
            self.noteCounter = 0
            self.touchedBtnStatus = ""
            self.notes = ""
            self.phone = ""
        }

    }

}

struct SubmitReviewView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitReviewView()
    }
}
