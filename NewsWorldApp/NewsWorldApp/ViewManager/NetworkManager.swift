//
//  NetworkManager.swift
//  NewsWorldApp
//
//  Created by yusuf bakır on 14.10.2023.
//

import Foundation

import Alamofire
protocol INewsService {
    func fetchItem (urlstring:String, onSuccess :@escaping(News,Bool) -> Void)
}
class NetworkManager :INewsService{
    
    private let url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=bdda767774cd45aba4b13ffb8874e2d7"
    
    func fetchItem (urlstring:String, onSuccess :@escaping(News,Bool) -> Void) {
        guard URL(string: urlstring) != nil else {return}
        AF.request(urlstring).responseDecodable(of: News.self, completionHandler:  {response in
            guard let value = response.value else {return}
            onSuccess(value,true)
                
        })
            
    }}

//    func fetchData (urlString :String,onSucces:(News,Bool ) -> Void){
//        guard let url = URL(string: urlString)else {return}
//       URLSession.shared.dataTask(with:url) {data,response,error in
//            if let data = data {
//                do {
//
//                    let dataTask = try JSONDecoder().decode(News.self, from: data)
//                   print("işlem başarılı")
//                    onSucces(dataTask,true)
//                    if let utf8String = String(data: data, encoding: .utf8) {
//                                print(utf8String)
//                            }
//                }catch{
//                 debugPrint(error)
//                }
//
//            }else {
//                print(error?.localizedDescription ?? "error")
//            }
//       }.resume()
//
//    }