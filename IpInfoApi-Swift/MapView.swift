//
//  MapView.swift
//  IpInfoApi-Swift
//
//  Created by Jordan Carter on 4/17/24.
//

import SwiftUI
import MapKit
struct MapView: View {
    var lat: Double
    var long: Double
    var ip: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                let ipLocation = CLLocationCoordinate2D(latitude: lat, longitude: long)
                Map {
                    Marker(ip, coordinate: ipLocation)
                        .tint(.orange)
                }
                Button(action: {
                   dismiss()
                }, label: {
                    Label.init("Close", systemImage: "xmark")
                        .font(.custom("Courier", size: 25))
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(5)
                        .padding()
                })
            }
        }
    }
}

#Preview {
    MapView(lat: 37.7749, long: -122.4194, ip: "127.0.0.1")
}
