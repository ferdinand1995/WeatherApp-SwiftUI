//
//  WeatherView.swift
//  weather-app
//
//  Created by Tedjakusuma, Ferdinand on 06/04/23.
//

import SwiftUI

struct WeatherView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var searchText = ""
    init() {
        /// tableview background
        UITableView.appearance().backgroundColor = .clear
    }

    var body: some View {
        ZStack {
            // MARK: Background Color
            Color.background.ignoresSafeArea()
            VStack {
                NavigationBar(backButtonTapped: {
                    self.presentationMode.wrappedValue.dismiss()
                }, navigationTitle: "Weather")
                SearchField(searchText: $searchText)
                List {
                    Text("Settings")
                }
                    .listStyle(.plain)
            }
        }.overlay(content: {
            
        }).navigationBarHidden(true)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

