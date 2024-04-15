//
//  ContentView.swift
//  IpInfoApi-Swift
//
//  Created by Jordan Carter on 4/15/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    private var ips: [IP] = []
    private var accessToken = ""
    @State var ipInput = ""
    
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                Text("IP Info")
                    .font(.title)
                    .foregroundColor(.white)
                TextField("Enter IP address", text: $ipInput)
                    .padding()
                    .foregroundColor(.green)
                    .background(Color.white)
                    .cornerRadius(5)
                    .padding()
                Button(action: {
                    
                }, label: {
                    Label.init("Search", systemImage: "magnifyingglass")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(5)
                        .padding()
                })
                
            }
        }
    }
}
#Preview {
    ContentView()
}
