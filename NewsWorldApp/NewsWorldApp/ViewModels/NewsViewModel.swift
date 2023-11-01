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
   
  
    @Published var isCompleted :Bool = false
    @Published var article : [Article] = []
    
    
    
    
    let apiKey = "bdda767774cd45aba4b13ffb8874e2d7"
    private var service : INewsService
    func fetchNews () {
        service.fetchItem(urlstring: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=\(apiKey)", onSuccess: { data, isComplete in
                DispatchQueue.main.async {
                    self.isCompleted = isComplete
                    self.article = data.articles
                    print(data)
                }
            })
        }
    func fetchNewsCategory (category : String) {
        let urlBase = "https://newsapi.org/v2/top-headlines?country=us&category=\(category)&apiKey=\(apiKey)"
        service.fetchItem(urlstring: urlBase) { data, isComplete in
            self.article =  data.articles
            self.isCompleted = isComplete
            print(data)



        }

    }

   }

