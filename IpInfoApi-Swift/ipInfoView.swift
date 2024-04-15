//
//  ipInfoView.swift
//  IpInfoApi-Swift
//
//  Created by Jordan Carter on 4/15/24.
//

import SwiftUI

struct ipInfoView: View {
    @Binding var ip: IP
    
    var body: some View {
        ZStack{
            Color.black
            VStack{
                Text(ip.ip ?? "")
                    .font(.title)
                    .foregroundColor(.green)
                Text(ip.city ?? "")
                    .font(.title)
                    .foregroundColor(.green)
                Text(ip.region ?? "")
                    .font(.title)
                    .foregroundColor(.white)
                Text(ip.country ?? "")
                    .font(.title)
                    .foregroundColor(.white)
                Text(ip.loc ?? "")
                    .font(.title)
                    .foregroundColor(.white)
                Text(ip.org ?? "")
                    .font(.title)
                    .foregroundColor(.white)
                Text(ip.postal ?? "")
                    .font(.title)
                    .foregroundColor(.white)
                Text(ip.timezone ?? "")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
        
    }
}
