//
//  NavigationBar.swift
//  weather-app
//
//  Created by Tedjakusuma, Ferdinand on 09/04/23.
//

import SwiftUI

struct NavigationBar: View {
    let backButtonTapped: (() -> Void)
    let navigationTitle: String
    var body: some View {
        VStack {
            Button {
                self.backButtonTapped()
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color(hex: "#EBEBF599").opacity(0.6))
                        .font(.system(size: 24).weight(.medium))
                    Text(navigationTitle)
                        .foregroundColor(.white)
                        .font(.title)
                }
                Spacer()
            }
            Spacer()
        }.frame(height: 48, alignment: .top)
            .padding(.horizontal, 16)
            .padding(.top, 8)
            .background(Color.navBarBackground)
            .backgroundBlur(radius: 24, opaque: true)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(backButtonTapped: {
            print("A")
        }, navigationTitle: "Weather").preferredColorScheme(.dark)
    }
}
