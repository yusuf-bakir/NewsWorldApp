//
//  ContentView.swift
//  NewsWorldApp
//
//  Created by yusuf bakır on 14.10.2023.
//

import SwiftUI
import Kingfisher
import ActivityIndicatorView
struct HomePage: View {
//    @StateObject  private var  newsViewModel : NewsViewModel = NewsViewModel(service: NetworkManager())
   @ObservedObject var newsViewModel: NewsViewModel = NewsViewModel(service: NetworkManager())
    @State var show = false
    var body: some View {

        NavigationStack{
            ZStack{
                NewsView(newsViewModel: newsViewModel)
                GeometryReader { _ in
                    HStack{
                        Menu(newsViewModel: newsViewModel, show: $show).offset(x:self.show ? 0:-UIScreen.main.bounds.width).animation(.interactiveSpring(response: 0.6,dampingFraction: 0.6,blendDuration: 0.6))
                        Spacer()
                    }
                    .background(Color.black.opacity(self.show ? 0.5 :0))
                }
            }.navigationBarTitle("News",displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.show.toggle()
                }) {
                if self.show {
                        Image(systemName: "arrow.left").font(.body).foregroundColor(Color.black)
                        }else{
                        Image(systemName: "list.triangle")
                    }
            })
        }
    }
    

    
}
    

struct NewsView: View {

    @StateObject var newsViewModel: NewsViewModel = NewsViewModel(service: NetworkManager())
    var body: some View {
        //Buarada bir StateObject daha vardı.
        ScrollView {
            VStack(alignment: .leading) {
                
                ForEach(newsViewModel.article ,id: \.self) { index in
                    
                    if newsViewModel.isCompleted ?? false {
                        
                        if let imageUrl = URL(string: index.urlToImage ?? "") {
                            KFImage(imageUrl).resizable().scaledToFit().onTapGesture{
                                if let url = URL(string: index.url ?? "") {
                                
                                        UIApplication.shared.open(url)
                                
                                  }
                                
                            }

                           
                        }
                        
                        VStack(alignment: .leading,spacing: 10) {
                            
                            Text(index.title ?? "").foregroundColor(.black).bold()
                            
                            Text((index.description) ?? "")
                            
                            HStack{
                       
                                Text(index.publishedAt ?? "")
                                Spacer()
                                Text(index.source?.name ?? "").padding().opacity(0.5)
                            }
                            
                            
                        }.padding(.horizontal)
                        
                    }else{
                        LodingView()
                    }
                    
                }
            }
        }
     
        
    }
        
    }


struct Menu: View {
    
     var codinKeys = CodinKeys.self
    @ObservedObject var newsViewModel: NewsViewModel = NewsViewModel(service: NetworkManager())
//    @StateObject  private var  newsViewModel : NewsViewModel = NewsViewModel(service: NetworkManager())
    @Binding var show:Bool
    var body: some View {
        VStack(spacing: 25) {
            Text("News Category").padding(.trailing,30).bold()
          Rectangle().fill(.red).frame(width: 150,height:5).padding(.trailing,30).shadow(color: .yellow, radius: 0.8,x:0,y: 5)
            Button {
                show.toggle()
              
                newsViewModel.fetchNewsCategory(category: codinKeys.business.rawValue)
                
                
            } label: {
                VStack{
                    Image("business").renderingMode(.original).resizable().frame(width: 55,height: 55)
                    Text("Business").foregroundColor(.black).font(.system(size: 15))
                    
                }
            }.padding(.trailing,40)

            
            Button {
                show.toggle()
                newsViewModel.fetchNewsCategory(category: codinKeys.science.rawValue)
            } label: {
                VStack{
                    Image("science").renderingMode(.original).resizable().frame(width: 55,height: 55)
                    Text("Technology").foregroundColor(.black).font(.system(size: 15))
                   
                }
               
            }.padding(.trailing,40)
     
            Button {
                show.toggle()
                newsViewModel.fetchNewsCategory(category: codinKeys.entertainment.rawValue)
                
                
            } label: {
                VStack{
                    Image("entertainment").renderingMode(.original).resizable().frame(width: 55,height: 55)
                    Text("Entertainment").foregroundColor(.black).font(.system(size: 15))
                }
               
            }.padding(.trailing,40)

            Button {
                show.toggle()
                newsViewModel.fetchNewsCategory(category: codinKeys.health.rawValue)
            } label: {
                VStack{
                    Image("health").renderingMode(.original).resizable().frame(width: 55,height: 55)
                    Text("health").foregroundColor(.black).font(.system(size: 15))
                
                }
               
            }.padding(.trailing,40)

            Button {
                show.toggle()
                newsViewModel.fetchNewsCategory(category: codinKeys.sports.rawValue)
                    
               
            } label: {
                VStack{
                    Image("sports").renderingMode(.original).resizable().frame(width: 55,height: 55)
                    Text("Sports").foregroundColor(.black).font(.system(size: 15))
                }
               
            }.padding(.trailing,40)

            
            
         Spacer(minLength:5)

            
        }.padding(18).background(Color("Color")).edgesIgnoringSafeArea(.bottom)
        
    }
}
struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(newsViewModel: NewsViewModel(service: NetworkManager()))
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
