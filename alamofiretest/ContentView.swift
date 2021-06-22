//
//  ContentView.swift
//  alamofiretest
//
//  Created by SIMON HUTCHINSON on 20/11/20.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct ContentView: View {
    
    
    @State var test5 = "Loading...."
    @State var weather:Int = 0
    @State var weather2 = ""
    @State var lists:Array = []
    @State var games2 = []
    
    @State var games = ["test"]
    
    func loadData() {
        AF.request("http://reg.bom.gov.au/fwo/IDN60901/IDN60901.94767.json").responseJSON { response in //debugPrint(response)
            switch response.result {
                    case .success(let value):
                        let test3 = JSON(value)
                        test5 = test3["observations"]["data"][0]["name"].stringValue
                        weather = test3["observations"]["data"][0]["apparent_t"].intValue
                        weather2 = String(weather)
                        lists = test3["observations"]["data"].arrayValue
                        print(lists)
                        //print(test3["observations"]["notice"][0].stringValue)
                        //let test4 = test3["observations"]["notice"][0].stringValue
                        games = []
                        games.append("arraytest")
                    case .failure(let error):
                        print(error)
                    }
            
            //let jsonSwift = try! JSON(response)
            //debugPrint(jsonSwift)
            
            
        }
    }
    
    
    
    var body: some View {
        VStack(alignment: .trailing){
            Text("Weather")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        TabView {
        VStack(alignment: .leading) {
            Text("SYDNEY WEATHER")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            VStack(alignment: .leading ) {
            Text(test5 )
                .font(.title2)
                .onAppear(perform: loadData)
                .padding(.bottom, 50)
            Text(weather2)
                
                    ForEach(games, id: \.self) {game in
                        Text("This is a \(game)")
                    }
                }
        }
        .tabItem { Image(systemName: "1.square.fill")
            Text("Sydney")
        }
        
        
            Text("Another Tab")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
            Text("The Last Tab")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                }
        }
        .font(.headline)

        
    }
        

}

