//
//  ContentView.swift
//  WeatherApp
//
//  Created by yusuf bakır on 24.09.2023.
//

import SwiftUI
 import Alamofire
//https://api.openweathermap.org/data/2.5/weather?q=Paris&appid=84913e4ddefd10e3892367c306fd4f4f
struct ContentView: View {
    let apı = Model()
    var body: some View {
        
        VStack {
           Text("hello world")
        }.onAppear{
            apı.apıRequest(url: "https://api.openweathermap.org/data/2.5/weather?lat=37.92&lon=40.17&appid=84913e4ddefd10e3892367c306fd4f4f")
            
        } 
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
