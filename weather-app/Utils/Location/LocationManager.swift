//
//  LocationManager.swift
//  weather-app
//
//  Created by Tedjakusuma, Ferdinand on 25/04/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
    
    private let locationManager = CLLocationManager()

    // - API
    public var exposedLocation: CLLocation? {
        return self.locationManager.location
    }

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
    }
}

// MARK: - Core Location Delegate
extension LocationManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("notDetermined") // location permission not asked for yet
        case .authorizedWhenInUse:
            print("authorizedWhenInUse") // location authorized
        case .authorizedAlways:
            print("authorizedAlways") // location authorized
        case .restricted:
            print("restricted") // TODO: handle
        case .denied:
            print("denied") // TODO: handle
        default:
            fatalError()
        }
    }

    // MARK: - Get Placemark
    func getPlace(for location: CLLocation,
                  completion: @escaping (CLPlacemark?) -> Void) {

        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in

            guard error == nil else {
                print("*** Error in \(#function): \(error!.localizedDescription)")
                completion(nil)
                return
            }

            guard let placemark = placemarks?[0] else {
                print("*** Error in \(#function): placemark is nil")
                completion(nil)
                return
            }
            completion(placemark)
        }
    }
}
