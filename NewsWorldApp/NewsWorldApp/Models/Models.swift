//
//  Models.swift
//  NewsWorldApp
//
//  Created by yusuf bakır on 14.10.2023.
//

import Foundation
struct  News :Codable {
    let status : String?
    let totalResults : Double
    let articles : [Article]
}

struct  Article: Codable,Hashable {
    
    static func == (lhs: Article, rhs: Article) -> Bool {
        return lhs.title == rhs.title && lhs.publishedAt == rhs.publishedAt // Örnek olarak, title ve publishedAt özelliklerine göre eşitlik kontrolü
       }
    func hash(into hasher: inout Hasher) {
           hasher.combine(title)
           hasher.combine(publishedAt)
           // Diğer özellikleri de hash'e dahil edebilirsiniz, böylece her özellik birbirinden farklıysa nesneler farklı olarak kabul edilir
       }
    
    let source :source?
    let author :String?
    let title : String?
    let description:String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content :String?
    
    
   
    
}
struct source : Codable {
    let id : String?
    let name :String?
    
}
enum CodinKeys:String,CodingKey {
    case  business = "business"
    case entertainment = "entertainment"
    case health = "health"
    case science = "science"
    case sports = "sports"
     case technology = "technology"

                        
}
