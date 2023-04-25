//
//  ForecastCard.swift
//  weather-app
//
//  Created by Tedjakusuma, Ferdinand on 25/04/23.
//

import SwiftUI

struct ForecastCard: View {
    var forecast: Forecast
    var forecastPeriod: ForecastPeriod
    var isActive: Bool {
        let calenderComponet: Calendar.Component = (forecastPeriod == ForecastPeriod.hourly) ? .hour : .day
        let isHour = Calendar.current.isDate(.now, equalTo: forecast.date, toGranularity: calenderComponet)
        return isHour
    }
    var body: some View {
        ZStack {
            // MARK: Card
            RoundedRectangle(cornerRadius: 32).fill(Color.forecastCardBackground.opacity(isActive ? 1 : 0.3))
                .frame(width: 64, height: 144)
                .shadow(color: .black.opacity(0.25), radius: 8, x: 4, y: 4)
                .overlay {
                RoundedRectangle(cornerRadius: 32)
                    .strokeBorder(.white.opacity(isActive ? 0.4 : 0.2))
                    .blendMode(.overlay)
            }.innerShadow(shape: RoundedRectangle(cornerRadius: 32), color: .white.opacity(0.3), lineWidth: 1, offsetX: 1, offsetY: 1, blur: 0, blendMode: .overlay)


            // MARK: Content
            VStack(spacing: 16) {
                // MARK: Forecase Date
                Text(forecast.date, format: forecastPeriod == .hourly ? .dateTime.hour() : .dateTime.weekday())
                    .font(.subheadline.weight(.semibold))
                
                VStack(spacing: -4) {
                    // MARK: Forecast Small Icon
                    Image("\(forecast.icon) small")
                    
                    // MARK: Forecast Probability
                    Text(forecast.probability, format: .percent).font(.footnote.weight(.semibold))
                        .foregroundColor(Color.probabilityText)
                        .opacity(forecast.probability > 0 ? 1 : 0)
                }.frame(height: 40)
                
                Text("\(forecast.temperature)°").font(.title3)

            }.padding(.horizontal, 8)
                .padding(.vertical, 16)
                .frame(width: 64, height: 144)
        }
    }
}

struct ForecastCard_Previews: PreviewProvider {
    static var previews: some View {
        ForecastCard(forecast: .hourly[1], forecastPeriod: .hourly)
    }
}
