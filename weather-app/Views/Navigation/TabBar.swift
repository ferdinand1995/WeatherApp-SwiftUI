//
//  TabBar.swift
//  weather-app
//
//  Created by Tedjakusuma, Ferdinand on 03/04/23.
//

import SwiftUI

@available(iOS 15.0, *)
struct TabBar: View {
    var action: () -> Void
    var body: some View {
        ZStack {
            // MARK: Tab Items
            Arc()
                .fill(Color.tabBarBackground)
                .frame(height: 88)
                .overlay {
                    Arc()
                        .stroke(Color.tabBarBorder, lineWidth: 0.5)
                }
            HStack {
                // MARK: Expand Button
                Button {
                    action()
                } label: {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width: 44, height: 44)
                }
                Spacer()
                // MARK: Navigation Button
                NavigationLink {
                    
                } label: {
                    Image(systemName: "list.star")
                        .frame(width: 44, height: 44)
                }
            }
            .font(.title2)
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 20, leading: 32, bottom: 24, trailing: 32))
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
}

@available(iOS 15.0, *)
struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(action: { })
            .preferredColorScheme(.dark)
    }
}
