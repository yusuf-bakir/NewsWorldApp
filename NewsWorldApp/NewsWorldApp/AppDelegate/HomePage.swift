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
    @State var show = false
    var body: some View {
        NavigationStack{
            
            ZStack{
                
                ScrollView(.vertical,showsIndicators: false) {
                    NewsAll()
                    
                }
                GeometryReader { _ in
                    HStack{
                        Menu().offset(x:self.show ? 0:-UIScreen.main.bounds.width).animation(.interactiveSpring(response: 0.6,dampingFraction: 0.6,blendDuration: 0.6))
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
       
    }}
    
struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
     HomePage()
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

struct NewsAll: View {
    @StateObject  private var  newsViewModel : NewsViewModel = NewsViewModel(service: NetworkManager())
    @ObservedObject var Dateformader = NewsViewModel(service: NetworkManager())
    @State var  dateString = ""
    var body: some View {
        
       
            VStack(alignment: .leading) {
                
                ForEach(0...5,id:\.self) {index in
                    
                    
                    
                    if newsViewModel.isCompleted ?? false {
                        
                        KFImage(URL(string: newsViewModel.dataNews?.articles[index].urlToImage ?? "")).resizable().scaledToFit().onTapGesture{
                            if let url = URL(string: newsViewModel.dataNews?.articles[index].url ?? "") {
                                
                                UIApplication.shared.open(url)
                                
                            }}
                        
                        VStack(alignment: .leading,spacing: 10) {
                            
                            Text(newsViewModel.dataNews?.articles[index].title ?? "").foregroundColor(.black).bold()
                            
                            Text((newsViewModel.dataNews?.articles[index].description) ?? "")
                            
                            HStack{
                       
                               Text(newsViewModel.dataNews?.articles[index].publishedAt ?? "")
                                Spacer()
                                Text(newsViewModel.dataNews?.articles[index].source?.name ?? "").padding().opacity(0.5)
                            }
                            
                            
                        }.padding(.horizontal)
                        
                    }else{
                        LodingView()
                    }
                    
                }
            }
        
    }
}

struct Menu: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("News Category").padding(.trailing,30).bold()
          Rectangle().fill(.red).frame(width: 150,height:5).padding(.trailing,30).shadow(color: .yellow, radius: 0.8,x:0,y: 5)
            Button {
                
            } label: {
                VStack{
                    Image("business").renderingMode(.original).resizable().frame(width: 55,height: 55)
                    Text("Business").foregroundColor(.black).font(.system(size: 15))
                }
               
            }.padding(.trailing,40)

            
            Button {
                
            } label: {
                VStack{
                    Image("tekno").renderingMode(.original).resizable().frame(width: 55,height: 55)
                    Text("Technology").foregroundColor(.black).font(.system(size: 15))
                }
               
            }.padding(.trailing,40)

            
            Button {
                
            } label: {
                VStack{
                    Image("entertainment").renderingMode(.original).resizable().frame(width: 55,height: 55)
                    Text("Entertainment").foregroundColor(.black).font(.system(size: 15))
                }
               
            }.padding(.trailing,40)

            Button {
                
            } label: {
                VStack{
                    Image("health").renderingMode(.original).resizable().frame(width: 55,height: 55)
                    Text("Health").foregroundColor(.black).font(.system(size: 15))
                }
               
            }.padding(.trailing,40)

            Button {
                
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
