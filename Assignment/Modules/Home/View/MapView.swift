//
//  MapView.swift
//  Assignment
//
//  Created by Shaikh Rakib on 27/01/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject var viewModel = MapViewModel()
    let mapData: ContentMap
    var body: some View {
        VStack {
            Map(initialPosition: .userLocation(followsHeading: true, fallback: .automatic), interactionModes: .all) {
                UserAnnotation {
                    Image(systemName: "mappin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.red)
                }
            }
        }
        .onAppear {
            viewModel.checkIfLocationIsEnabled()
        }
    }
}

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.785834, longitude: -122.406417), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))

    var locationManager: CLLocationManager?
    
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // Handle changes in location authorization
        let previousAuthorizationStatus = manager.authorizationStatus
        manager.requestWhenInUseAuthorization()
        if manager.authorizationStatus != previousAuthorizationStatus {
            checkLocationAuthorization()
        }
      }
    
    
    func checkIfLocationIsEnabled() {
        Task {
            if CLLocationManager.locationServicesEnabled() {
                locationManager = CLLocationManager()
                locationManager?.desiredAccuracy = kCLLocationAccuracyBest
                locationManager!.delegate = self
            } else {
                print("Show an alert letting them know this is off")
            }
            }
        }
    
    private func checkLocationAuthorization() {
        // Check location authorization status
        guard let location = locationManager else {
            return
        }
        switch location.authorizationStatus {
        case .notDetermined:
            print("Location authorization is not determined.")
        case .restricted:
            print("Location is restricted.")
        case .denied:
            print("Location permission denied.")
        case .authorizedAlways, .authorizedWhenInUse:
            // Update map region with user's location
            if let location = location.location {
                mapRegion = MKCoordinateRegion(
                    center: location.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
                )
            }
        default:
            break
        }
    }
}

#Preview {
    MapView(mapData: ContentMap(title: "Map", pin: URL(string: "Hello.com")!, lat: 1.098, lng: 5.976))
}
