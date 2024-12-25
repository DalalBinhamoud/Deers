//
//  HomeView.swift
//  Deers
//
//  Created by Dalal Macbook on 01/05/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader{ geo in
        VStack {
            // custom header
            ZStack {
                Rectangle().fill(Constants.Colors.secondaryColor).frame(width: geo.size.width, height: geo.size.height * 0.12).ignoresSafeArea()

                HStack {
                    Image("background")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.12, height: geo.size.height * 0.12).ignoresSafeArea()
                    Spacer()
                }
            }
            TabView{
                SubmitReviewView().tabItem{
                    Label(NSLocalizedString("add_review", comment: ""), systemImage: "paperplane")
                }

                ReviewsView().tabItem{
                    Label(NSLocalizedString("reviews", comment: ""), systemImage: "list.dash")
                }
            }
        }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
