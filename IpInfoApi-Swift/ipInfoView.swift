//
//  ipInfoView.swift
//  IpInfoApi-Swift
//
//  Created by Jordan Carter on 4/15/24.
//

import SwiftUI
struct ipInfoView: View {
    @Binding var ip: IP
    
    let textColor = Color.green
    let font = Font.custom("Courier", size: 18)
    @State private var isShowingMap = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            //Get values from ip construct and display info
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("IP Address:")
                        .font(font)
                        .foregroundColor(textColor)
                    Text(ip.ip ?? "")
                        .font(font)
                        .foregroundColor(textColor)
                }
                
                HStack {
                    Text("City:")
                        .font(font)
                        .foregroundColor(textColor)
                    Text(ip.city ?? "")
                        .font(font)
                        .foregroundColor(textColor)
                }
                
                HStack {
                    Text("Region:")
                        .font(font)
                        .foregroundColor(textColor)
                    Text(ip.region ?? "")
                        .font(font)
                        .foregroundColor(textColor)
                }
                
                HStack {
                    Text("Country:")
                        .font(font)
                        .foregroundColor(textColor)
                    Text(ip.country ?? "")
                        .font(font)
                        .foregroundColor(textColor)
                }
                
                HStack {
                    Text("Location:")
                        .font(font)
                        .foregroundColor(textColor)
                    Text(ip.loc ?? "")
                        .font(font)
                        .foregroundColor(textColor)
                }
                
                HStack {
                    Text("Organization:")
                        .font(font)
                        .foregroundColor(textColor)
                    Text(ip.org ?? "")
                        .font(font)
                        .foregroundColor(textColor)
                }
                
                HStack {
                    Text("Postal Code:")
                        .font(font)
                        .foregroundColor(textColor)
                    Text(ip.postal ?? "")
                        .font(font)
                        .foregroundColor(textColor)
                }
                
                HStack {
                    Text("Timezone:")
                        .font(font)
                        .foregroundColor(textColor)
                    Text(ip.timezone ?? "")
                        .font(font)
                        .foregroundColor(textColor)
                }
                Button(action: {
                    isShowingMap.toggle()
                }, label: {
                    Text("Open in map view")
                        .font(font)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(5)
                        .padding()
                        .font(font)
                })
            }
            .padding()
          
        }
        //Split loc at "," to get long and lat if nill set to 0
        .sheet(isPresented: $isShowingMap, content: {
            MapView(lat: Double(ip.loc?.split(separator: ",")[0] ?? "0") ?? 0, long: Double(ip.loc?.split(separator: ",")[1] ?? "0") ?? 0, ip: ip.ip ?? "")
        })
    }
}
