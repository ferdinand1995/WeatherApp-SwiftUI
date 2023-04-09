//
//  SearchField.swift
//  weather-app
//
//  Created by Tedjakusuma, Ferdinand on 09/04/23.
//

import SwiftUI

struct SearchField: View {

    @Binding var searchText: String

    var body: some View {
        VStack {
            // MARK: Search Bar
            HStack(spacing: 8) {
                Image(systemName: "magnifyingglass").foregroundColor(Color(hex: "#EBEBF599").opacity(0.6))
                TextField("", text: $searchText).placeholder(when: searchText.isEmpty) {
                    Text(" Search for a city or airport")
                        .foregroundColor(Color(hex: "#EBEBF599").opacity(0.6))
                }
            }.foregroundColor(.secondary)
                .padding(.horizontal, 8)
                .padding(.vertical, 8)
                .frame(height: 40, alignment: .leading)
                .background(Color.bottomSheetBackground, in: RoundedRectangle(cornerRadius: 8))
                .innerShadow(shape: RoundedRectangle(cornerRadius: 8), color: .black.opacity(0.3), lineWidth: 2, offsetX: 0, offsetY: 2, blur: 2)
        }.padding(.horizontal, 16)
            .padding(.top, 16)
            .padding(.bottom, 16)
            .backgroundBlur(radius: 24, opaque: true)
            .background(Color.navBarBackground)
    }
}


struct SearchField_Previews: PreviewProvider {
    static var previews: some View {
        SearchField(searchText: .constant(""))
    }
}
