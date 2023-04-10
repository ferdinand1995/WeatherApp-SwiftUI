//
//  WeatherCell.swift
//  weather-app
//
//  Created by Tedjakusuma, Ferdinand on 10/04/23.
//

import SwiftUI

struct WeatherCell: View {
    let viewModel: WeatherCellViewModel

    var body: some View {
        ZStack(alignment: .bottom) {
            // MARK: Trapezoid
            Trapezoid().fill(Color.weatherWidgetBackground)
                .frame(width: 342, height: 174)
            
            // MARK: Content
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    // MARK: Forecast Temperature
                    Text("19°").font(.system(size: 64))
                    
                    //
                    VStack(alignment: .leading, spacing: 2) {
                        // MARK: Forecast Temperature Range
                        Text("H:24°  L:18°").font(.footnote)
                            .foregroundColor(.secondary)
                        
                        // MARK: Forecast Location
                        Text("Montreal, Canada").font(.body)
                            .lineLimit(1)
                    }
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 2) {
                    // MARK: Forecast Large Icon
                    Image("Tornado large").padding(.trailing, 4)
                    
                    // MARK: Weather
                    Text("Tornado").font(.footnote)
                        .padding(.trailing, 24)
                }
            }.padding(.bottom, 20)
                .padding(.leading, 20)
                .foregroundColor(.white)
        }.frame(width: 342, height: 184, alignment: .bottom)
            .foregroundColor(Color.clear)

    }
    
    /* common custom cell
    HStack(alignment: .center, spacing: 10.0) {
        AsyncImage(
            url: URL(string: viewModel.urlString),
            content: { image in
                image.resizable()
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 24)
                    .clipped()
                    .border(Color.black)
            },
            placeholder: {
                ProgressView()
            }
        )
        Text(viewModel.name)
        Spacer()
    }*/
}

struct WeatherCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeatherCell(viewModel: WeatherCellViewModel(Country()))
                .preferredColorScheme(.dark )
        }
    }
}
