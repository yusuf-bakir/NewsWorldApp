//
//  ContentView.swift
//  NewsWorldApp
//
//  Created by yusuf bakır on 14.10.2023.
//

import SwiftUI
import Kingfisher
import ActivityIndicatorView
struct ContentView: View {
    @StateObject private var newsViewModel : NewsViewModel = NewsViewModel(service: NetworkManager() )
    var body: some View {
        ScrollView {
            VStack{
                
                
                
                
                if newsViewModel.isCompleted ?? false {
                    
                    KFImage(URL(string: newsViewModel.news?.articles[1].urlToImage ?? "")).resizable().scaledToFit()
                    Text(newsViewModel.news?.articles[1].title ?? "").lineLimit(.max)
                        .padding().foregroundColor(.accentColor)
                    Text((newsViewModel.news?.articles[1].description) ?? "")
                    Text(newsViewModel.news?.articles[1].content ?? "")
                    
                }else{
                    LodingView()
                }
            }
            
            
        }
        }
            
           
    
        
    }
   

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct LodingView: View {
    var body: some View {
        VStack{
            Spacer()
            ActivityIndicatorView(isVisible: .constant(true), type: .growingCircle).frame(width:50 ,height:50 ,alignment: .center)
            Spacer()
        }
    }
}
