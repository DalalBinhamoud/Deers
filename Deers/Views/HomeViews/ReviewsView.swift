//
//  ReviewsView.swift
//  Deers
//
//  Created by Dalal Macbook on 26/04/2023.
//

import SwiftUI



struct ReviewsView: View {

    @Environment(\.calendar) var calendar
    @ObservedObject private var viewModel = ReviewViewModel()

    @State private var startDate = Date()
    @State private var endDate = Date()

    // we have 4 columns
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]


    var body: some View {

        VStack{
            Spacer()
            HStack{
                Image("")
                Image("calendar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                DatePicker(NSLocalizedString("from", comment: ""), selection: $startDate,in: ...endDate, displayedComponents: .date).fixedSize()
                DatePicker(NSLocalizedString("to", comment: ""), selection: $endDate,in: startDate...Date(), displayedComponents: .date).fixedSize()
            }.padding([.bottom],30)

            LazyVGrid(columns: columns) {
                Text(NSLocalizedString("review_status", comment: "")).mainTextStyle()
                Text(NSLocalizedString("review_contact", comment: "")).mainTextStyle()
                Text(NSLocalizedString("notes", comment: "")).mainTextStyle()
                Text(NSLocalizedString("review_date", comment: "")).mainTextStyle()
            }
            Divider()
            ScrollView{

                ForEach(viewModel.reviews) { review in
                    if((startDate...endDate).contains(review.date) || Calendar.current.isDate(startDate, equalTo: review.date, toGranularity: .day))
                    {
                        LazyVGrid(columns: columns, spacing: 4) {
                            Text(review.status).font(.title)
                            Text(review.contactNumber).font(.title)
                            Text(review.note).font(.title).lineLimit(3).multilineTextAlignment(.trailing)
                            Text(review.formattedDate).font(.title)
                        }.padding(.horizontal)
                        Divider()
                    }

                }
            }
        }.onAppear(){
            self.viewModel.fetchData()
        }
    }
}

struct ReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsView()
    }
}
