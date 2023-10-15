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

struct  Article: Codable {
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
