//
//  MapView.swift
//  rv2
//
//  Created by Nishant Mehta on 03/10/24.
//

import SwiftUI
import MapKit


extension CLLocationCoordinate2D {
    static var ridevilla: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 23.120278685959114, longitude: 72.54366332457828)
        
    }
}




struct MapView: View {
    var body: some View {
        Map{
//            Annotation("Ridevilla" , coordinate: .ridevilla)
            Marker("Ridevilla/pickuppoint", coordinate: .ridevilla)
        }
    }
}

#Preview {
    MapView()
}
