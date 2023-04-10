//
//  HomeView.swift
//  weather-app
//
//  Created by Tedjakusuma, Ferdinand on 28/03/23.
//

import SwiftUI

enum BottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.83 /// 702/844
    case middle = 0.385 /// 325 / 844
}

struct HomeView: View {
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    @State var bottomSheetTranslation: CGFloat = BottomSheetPosition.middle.rawValue
    @State var hasDragged: Bool = false
    var bottomSheetTranslationProrated: CGFloat {
        (bottomSheetTranslation - BottomSheetPosition.middle.rawValue) /
        (BottomSheetPosition.top.rawValue - BottomSheetPosition.middle.rawValue)
    }

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                let screenHeight: CGFloat = geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom
                let imageOffset: CGFloat = screenHeight + 32
                ZStack {
                    // MARK: Background Color
                    Color.background.ignoresSafeArea()
                    // MARK: Background Image
                    Image("img_background")
                        .resizable()
                        .ignoresSafeArea()
                        .offset(y: bottomSheetTranslationProrated < 0 ? 0 * imageOffset : bottomSheetTranslationProrated > 1 ? -1 * imageOffset : -bottomSheetTranslationProrated * imageOffset)
                    // MARK: House Image
                    Image("img_house")
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.top, 256)
                        .offset(y: bottomSheetTranslationProrated < 0 ? 0 * imageOffset : bottomSheetTranslationProrated > 1 ? -1 * imageOffset : -bottomSheetTranslationProrated * imageOffset)
                    VStack(spacing: -8) {
                        Text("Montreal")
                            .font(.largeTitle)
                        VStack {
                            Text(attributedString)
                            Text("H:24°   L:18°").font(.title3.weight(.semibold))
                                .opacity(1 - bottomSheetTranslationProrated)
                        }
                        Spacer()
                    }.padding(.top, 48)
                        .offset(y: -bottomSheetTranslationProrated * 40)

                    // MARK: Bottom Sheet
                    BottomSheetView(position: $bottomSheetPosition) {
//                        Text(bottomSheetTranslationProrated.formatted())
                    } content: {
                        ForecastView()
                    }.onBottomSheetDrag { translation in bottomSheetTranslation = translation / screenHeight
                        withAnimation(.easeInOut) {
                            hasDragged = (bottomSheetPosition == BottomSheetPosition.top)
                        }
                    }

                    // MARK: Tab Bar
                    TabBar(action: {
                        bottomSheetPosition = .top
                    }).offset(y: bottomSheetTranslationProrated < 0 ? 0 * 115 : bottomSheetTranslationProrated > 1 ? 1 * 115 : bottomSheetTranslationProrated * 115)
                }.navigationBarHidden(true)
            }
        }
    }

    private var attributedString: AttributedString {
        var string = AttributedString("19°" + (hasDragged ? " | " : "\n ") + "Mostly Clear")

        if let temp = string.range(of: "19°") {
            string[temp].font = .system(size: (96 - (bottomSheetTranslationProrated * (96 - 24))), weight:
                hasDragged ? .semibold : .thin)
            string[temp].foregroundColor = hasDragged ? .secondary : .primary
        }

        if let pipe = string.range(of: " | ") {
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary.opacity(bottomSheetTranslationProrated)
        }

        if let weather = string.range(of: "Mostly Clear") {
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }

        return string
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
