//
//  Home.swift
//  SwiftUI Final-2021-08-02
//
//  Created by user on 2021/8/7.
//

import SwiftUI

struct PrivateHome: View {
    
    @State private var isShowing = false
    
    var body: some View {
        
        
        
        NavigationView {
            ZStack {
                
                
                HomeView()
                    
                    
                
                TabView {
                    Home()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }
                    AllBooksView()
                        .tabItem {
                            Image(systemName: "book")
                            Text("Book")
                        }
                    Setting()
                        .tabItem {
                            Image(systemName: "gearshape")
                            Text("Setting")
                        }
                }
                //accentColor(.green)
                
            }
            
        }
        
    }
}

struct PrivateHome_Previews: PreviewProvider {
    static var previews: some View {
        PrivateHome()
    }
}


struct HomeView: View {
    var body: some View {
        ZStack {
            Color(.white)
            
        }
        .navigationBarTitleDisplayMode(.inline)

        .navigationBarItems(trailing:
                                NavigationLink(
                destination: LatestNews(),
                label: {
                    Image(uiImage: #imageLiteral(resourceName: "notifications"))
                        .foregroundColor(.blue)
                }
                    ))
       
        
    }
}


