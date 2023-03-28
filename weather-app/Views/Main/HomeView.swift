//
//  HomeView.swift
//  weather-app
//
//  Created by Tedjakusuma, Ferdinand on 28/03/23.
//

import SwiftUI

@available(iOS 14.0, *)
struct HomeView: View {
    var body: some View {
        ZStack {
            // MARK: Background Color
            Color.background.ignoresSafeArea()
            // MARK: Background Image
            Image("img_background")
                .resizable()
                .ignoresSafeArea()
            // MARK: Hous Image
            Image("img_house")
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 257)
            VStack {
                Text("Montreal")
                    .font(.largeTitle)
                VStack {
                    Text("19" + "\n" + "Mostly Clear")
                }
                Spacer()
            }
        }
    }
}

@available(iOS 14.0, *)
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
