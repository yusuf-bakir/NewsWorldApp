//
//  ModelAPI.swift
//  WeatherApp
//
//  Created by yusuf bakır on 2.10.2023.
//
// https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
import Foundation
struct Model:Decodable	{
    func apıRequest (url : String ) {
        if let url = URL(string: url) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Hata: \(error)")
                    return
                }
                
                if let data = data {
                    // Verileri işleyin (JSON ayrıştırma, vb.)
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)
                    } catch {
                        print("JSON ayrıştırma hatası: \(error)")
                    }
                }
            }
            
            task.resume()
        }

    }
   
}
