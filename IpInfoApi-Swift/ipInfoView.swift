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
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
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
            }
            .padding()
        }
    }
}
