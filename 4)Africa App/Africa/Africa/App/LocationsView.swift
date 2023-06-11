//
//  LocationsView.swift
//  Africa
//
//  Created by Natalie Alvarez on 5/24/23.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)

        return mapRegion
    }()

    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")

    var body: some View {
        // 1) Basic map:
        // Map(coordinateRegion: $region)

        // 2) Advanced map (with pins):
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { location in
            // A) Pin: old style (always static)
            //MapPin(coordinate: location.location, tint: .accentColor)

            // B) Marker: new style (always static)
            //MapMarker(coordinate: location.location, tint: .accentColor)

            // C) Custom Basic Annotation (could be interactive)
            /*MapAnnotation(coordinate: location.location) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .center)
            } */

            // D) Custom Advanced Annotation (could be interactive)
            MapAnnotation(coordinate: location.location) {
                MapAnnotationView(location: location)
            }
        })
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)

                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .accentColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    Divider()
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .accentColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
            , alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}
