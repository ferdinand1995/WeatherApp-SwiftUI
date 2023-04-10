//
//  WeatherViewModel.swift
//  weather-app
//
//  Created by Tedjakusuma, Ferdinand on 10/04/23.
//

import Foundation
import SwiftUI

@MainActor class WeatherViewModel: ObservableObject {

    @Published private(set) var countries: [Country] = []
    @Published var isLoading: Bool = true
    @Published var onError: Bool = false

    init() {
        countries = []
    }

    func loadCountriesTest() {

        if let path = Bundle.main.path(forResource: "CountyTest", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let countryTest = try JSONDecoder().decode(CountriesResponseElement.self, from: data)

                for _ in 1...8 {
                    self.countries.append(Country.init(countryTest))
                }

            } catch {
                self.onError = true
                print("Failed to load Test Data")
            }
        }
    }
}

class WeatherCellViewModel {

    let urlString: String
    let name: String

    init(_ country: Country) {
        self.urlString = (country.flags?.png ?? country.flags?.svg) ?? ""
        self.name = country.name?.common ?? ""
    }
}

//
//  CountryModel.swift
//  Country List
//
//  Created by Mattia La Spina on 8/7/22.
//
import Foundation

struct Country: Identifiable {
    let id = UUID()

    let name: Name?
    let tld: [String]?
    let cca2, ccn3, cca3, cioc: String?
    let independent: Bool?
    let status: Status?
    let unMember: Bool?
    let currencies: Currencies?
    let idd: Idd?
    let capital, altSpellings: [String]?
    let region: Region?
    let subregion: String?
    let languages: [String: String]?
    let translations: [String: Translation]?
    let latlng: [Double]?
    let landlocked: Bool?
    let area: Double?
    let demonyms: Demonyms?
    let flag: String?
    let maps: Maps?
    let population: Int?
    let fifa: String?
    let car: Car?
    let timezones: [String]?
    let continents: [Continent]?
    let flags, coatOfArms: ImageType?
    let startOfWeek: StartOfWeek?
    let capitalInfo: CapitalInfo?
    let postalCode: PostalCode?
    let borders: [String]?
    let gini: [String: Double]?

    init(_ countriesResponseElement: CountriesResponseElement) {
        self.name = countriesResponseElement.name
        self.tld = countriesResponseElement.tld
        self.cca2 = countriesResponseElement.cca2
        self.ccn3 = countriesResponseElement.ccn3
        self.cca3 = countriesResponseElement.cca3
        self.cioc = countriesResponseElement.cioc
        self.independent = countriesResponseElement.independent
        self.status = countriesResponseElement.status
        self.unMember = countriesResponseElement.unMember
        self.currencies = countriesResponseElement.currencies
        self.idd = countriesResponseElement.idd
        self.capital = countriesResponseElement.capital
        self.altSpellings = countriesResponseElement.altSpellings
        self.region = countriesResponseElement.region
        self.subregion = countriesResponseElement.subregion
        self.languages = countriesResponseElement.languages
        self.translations = countriesResponseElement.translations
        self.latlng = countriesResponseElement.latlng
        self.landlocked = countriesResponseElement.landlocked
        self.area = countriesResponseElement.area
        self.demonyms = countriesResponseElement.demonyms
        self.flag = countriesResponseElement.flag
        self.maps = countriesResponseElement.maps
        self.population = countriesResponseElement.population
        self.fifa = countriesResponseElement.fifa
        self.car = countriesResponseElement.car
        self.timezones = countriesResponseElement.timezones
        self.continents = countriesResponseElement.continents
        self.flags = countriesResponseElement.flags
        self.coatOfArms = countriesResponseElement.coatOfArms
        self.startOfWeek = countriesResponseElement.startOfWeek
        self.capitalInfo = countriesResponseElement.capitalInfo
        self.postalCode = countriesResponseElement.postalCode
        self.borders = countriesResponseElement.borders
        self.gini = countriesResponseElement.gini
    }


    init() {
        self.name = nil
        self.tld = nil
        self.cca2 = ""
        self.ccn3 = ""
        self.cca3 = ""
        self.cioc = ""
        self.independent = nil
        self.status = nil
        self.unMember = nil
        self.currencies = nil
        self.idd = nil
        self.capital = nil
        self.altSpellings = nil
        self.region = nil
        self.subregion = ""
        self.languages = nil
        self.translations = nil
        self.latlng = nil
        self.landlocked = nil
        self.area = nil
        self.demonyms = nil
        self.flag = ""
        self.maps = nil
        self.population = nil
        self.fifa = ""
        self.car = nil
        self.timezones = nil
        self.continents = nil
        self.flags = nil
        self.coatOfArms = nil
        self.startOfWeek = nil
        self.capitalInfo = nil
        self.postalCode = nil
        self.borders = nil
        self.gini = nil
    }
}

//
//  CountriesResponse.swift
//  Country List
//
//  Created by Mattia La Spina on 8/7/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let countriesResponse = try? newJSONDecoder().decode(CountriesResponse.self, from: jsonData)

import Foundation

typealias CountriesResponse = [CountriesResponseElement]

// MARK: - CountriesResponseElement
struct CountriesResponseElement: Codable {
    let name: Name?
    let tld: [String]?
    let cca2, ccn3, cca3, cioc: String?
    let independent: Bool?
    let status: Status?
    let unMember: Bool?
    let currencies: Currencies?
    let idd: Idd?
    let capital, altSpellings: [String]?
    let region: Region?
    let subregion: String?
    let languages: [String: String]?
    let translations: [String: Translation]?
    let latlng: [Double]?
    let landlocked: Bool?
    let area: Double?
    let demonyms: Demonyms?
    let flag: String?
    let maps: Maps?
    let population: Int?
    let fifa: String?
    let car: Car?
    let timezones: [String]?
    let continents: [Continent]?
    let flags, coatOfArms: ImageType?
    let startOfWeek: StartOfWeek?
    let capitalInfo: CapitalInfo?
    let postalCode: PostalCode?
    let borders: [String]?
    let gini: [String: Double]?
}

// MARK: - CapitalInfo
struct CapitalInfo: Codable {
    let latlng: [Double]?
}

// MARK: - Car
struct Car: Codable {
    let signs: [String]?
    let side: Side?
}

enum Side: String, Codable {
    case sideLeft = "left"
    case sideRight = "right"
}

// MARK: - CoatOfArms
struct ImageType: Codable {
    let png: String?
    let svg: String?
}

enum Continent: String, Codable {
    case africa = "Africa"
    case antarctica = "Antarctica"
    case asia = "Asia"
    case europe = "Europe"
    case northAmerica = "North America"
    case oceania = "Oceania"
    case southAmerica = "South America"
}

// MARK: - Aed
struct Currencies: Codable {
    let name, symbol: String?
}

// MARK: - Demonyms
struct Demonyms: Codable {
    let eng, fra: Eng?
}

// MARK: - Eng
struct Eng: Codable {
    let f, m: String?
}

// MARK: - Idd
struct Idd: Codable {
    let root: String?
    let suffixes: [String]?
}

// MARK: - Maps
struct Maps: Codable {
    let googleMaps, openStreetMaps: String?
}

// MARK: - Name
struct Name: Codable {
    let common, official: String?
    let nativeName: [String: Translation]?
}

// MARK: - Translation
struct Translation: Codable {
    let official, common: String?
}

// MARK: - PostalCode
struct PostalCode: Codable {
    let format, regex: String?
}

enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}

enum StartOfWeek: String, Codable {
    case monday = "monday"
    case sunday = "sunday"
    case turday = "turday"
}

enum Status: String, Codable {
    case officiallyAssigned = "officially-assigned"
    case userAssigned = "user-assigned"
}
