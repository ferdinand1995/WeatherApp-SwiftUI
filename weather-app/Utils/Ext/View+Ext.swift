//
//  View+Ext.swift
//  weather-app
//
//  Created by Tedjakusuma, Ferdinand on 04/04/23.
//

import SwiftUI

extension View {
    func backgroundBlur(radius: CGFloat = 3, opaque: Bool = false) -> some View {
        return self.background(Blur(radius: radius, opaque: opaque))
    }

    func innerShadow<S: Shape, SS: ShapeStyle>(shape: S,
                                               color: SS,
                                               lineWidth: CGFloat = 1,
                                               offSetX: CGFloat = 0,
                                               offSetY: CGFloat = 0,
                                               blur: CGFloat = 4,
                                               blendMode: BlendMode = .normal,
                                               opacity: Double = 1
    ) -> some View {
        return self
            .overlay(content: {
            shape
                .stroke(color, lineWidth: lineWidth)
                .blendMode(blendMode)
                .offset(x: offSetX, y: offSetY)
                .blur(radius: blur)
                .mask(shape)
                .opacity(opacity)
        })
    }

    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }

    func innerShadow<S: Shape, SS: ShapeStyle>(shape: S, color: SS, lineWidth: CGFloat = 1, offsetX: CGFloat = 0, offsetY: CGFloat = 0, blur: CGFloat = 4, blendMode: BlendMode = .normal, opacity: Double = 1) -> some View {
        return self
            .overlay {
            shape
                .stroke(color, lineWidth: lineWidth)
                .blendMode(blendMode)
                .offset(x: offsetX, y: offsetY)
                .blur(radius: blur)
                .mask(shape)
                .opacity(opacity)
        }
    }
}
