//
//  String+Utility.swift
//  WeatherApp
//
//  Created by Tedjakusuma, Ferdinand on 28/02/23.
//

import Foundation

extension String {
    var urlEscaped: String {
        addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data { Data(self.utf8) }
}
