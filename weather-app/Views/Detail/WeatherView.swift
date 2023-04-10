//
//  WeatherView.swift
//  weather-app
//
//  Created by Tedjakusuma, Ferdinand on 06/04/23.
//

import SwiftUI

struct WeatherView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: WeatherViewModel

    @State private var searchText = ""
    init() {
        /// tableview background
        UITableView.appearance().backgroundColor = .black
        UITableView.appearance().separatorStyle = .none
        viewModel = WeatherViewModel()
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
                ListView()
            }
        }.navigationBarHidden(true)
    }

    func ListView() -> some View {
        return List(viewModel.countries) { country in
            WeatherCell(viewModel: WeatherCellViewModel(country)).listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
        }.task {
            viewModel.loadCountriesTest()
        }.listStyle(.plain)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

