//
//  ContentView.swift
//  IpInfoApi-Swift
//
//  Created by Jordan Carter on 4/15/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    //access token is needed
    private var accessToken = "fb4375727f7575"
    @State var ipInput = ""
    @State var isShowingIpInfo = false
    @State var ip: IP = IP()
    
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                Text("IP Info")
                    .font(.title)
                    .foregroundColor(.green)
                    .font(.custom("Courier", size: 24))
                
                TextField("Enter IP address", text: $ipInput)
                             .padding()
                             .foregroundColor(.green)
                             .accentColor(.green)
                             .multilineTextAlignment(.center)
                             .cornerRadius(5)
                             .border(.green, width: 1)
                             .font(.custom("Courier", size: 24))
                Button(action: {
                    //Wait on getIP function
                   Task {
                        do {
                            ip = try await getIP()
                            isShowingIpInfo.toggle()
                            //If nill set value to base
                            
                            ipInput = ip.ip ?? "127.0.0.1"
                            print(ip)
                        } catch {
                            print(error)
                        }
                    }
                }, label: {
                    Label.init("Search", systemImage: "magnifyingglass")
                        .padding()
                        .foregroundColor(.green)
                        .background(Color.black)
                        .cornerRadius(5)
                        .padding()
                        .font(.custom("Courier", size: 16))
                })
            
            }.sheet(isPresented: $isShowingIpInfo, content: {
                ipInfoView(ip: $ip)
            })
            //Sets ip to users Ip
        }.onAppear(perform: {
            Task {
                do {
                    ip = try await getIP()
                    ipInput = ip.ip ?? ""
                }
            }
        })
        
    }
    func getIP() async throws -> IP {
      
        //API url with accessToken
        guard let apiURL = URL(string: "https://ipinfo.io/\(ipInput)?token=\(accessToken)") else {
            throw IPError.invalidURL
        }
        
        var request = URLRequest(url: apiURL)
        request.httpMethod = "GET"
        
        //Sets data and discards everything else
        let (data, _) = try await URLSession.shared.data(for: request)
        
        do {
            //parse Json data to ip
            let ip = try JSONDecoder().decode(IP.self, from: data)
            return ip
        } catch {
            throw IPError.decodingFailed
        }
        
    }
    //Error handling
    enum IPError: Error {
        case emptyInput
        case invalidURL
        case decodingFailed
    }
}
#Preview {
    ContentView()
}
