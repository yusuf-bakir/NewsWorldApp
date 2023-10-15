//
//  NewsViewModel.swift
//  NewsWorldApp
//
//  Created by yusuf bakır on 14.10.2023.
//

import Foundation

   
class NewsViewModel:ObservableObject {
    init(service:INewsService) {
        self.service = service
        fetchNews()
        
    }
    @Published var news : News?
    @Published var isCompleted :Bool?
   private let service : INewsService?
    func fetchNews () {
        service?.fetchItem(urlstring: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=bdda767774cd45aba4b13ffb8874e2d7", onSuccess: { data, isComplete in
                self.isCompleted = isComplete
            self.news = data
            
        })
    }
    
}
