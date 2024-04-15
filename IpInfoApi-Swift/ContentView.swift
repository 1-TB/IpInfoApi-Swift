//
//  ContentView.swift
//  IpInfoApi-Swift
//
//  Created by Jordan Carter on 4/15/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    private var accessToken = ""
    @State var ipInput = ""
    @State var isShowingIpInfo = false
    @State var ip: IP = IP()
    
    
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
                   try? Task {
                        do {
                            ip = try await getIP()
                            isShowingIpInfo.toggle()
                            print(ip)
                        } catch {
                            print(error)
                        }
                    }
                }, label: {
                    Label.init("Search", systemImage: "magnifyingglass")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(5)
                        .padding()
                })
                
            }.sheet(isPresented: $isShowingIpInfo, content: {
                ipInfoView(ip: ip)
            })
        }
    }
    
    func getIP() async throws -> IP {
      
        
        guard let apiURL = URL(string: "https://ipinfo.io/\(ipInput)?token=\(accessToken)") else {
            throw IPError.invalidURL
        }
        
        var request = URLRequest(url: apiURL)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        do {
            let ip = try JSONDecoder().decode(IP.self, from: data)
            return ip
        } catch {
            throw IPError.decodingFailed
        }
    }
    
    enum IPError: Error {
        case emptyInput
        case invalidURL
        case decodingFailed
    }
}
#Preview {
    ContentView()
}
