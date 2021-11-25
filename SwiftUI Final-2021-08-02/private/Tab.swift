//
//  TabView.swift
//  SwiftUI Final-2021-08-02
//
//  Created by user on 2021/8/18.
//

import SwiftUI

struct Tab: View {
    var body: some View {
        
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
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
        }
        accentColor(.green)
    }
}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        Tab()
    }
}
