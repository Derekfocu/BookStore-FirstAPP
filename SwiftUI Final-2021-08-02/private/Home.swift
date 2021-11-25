//
//  Home.swift
//  SwiftUI Final-2021-08-02
//
//  Created by user on 2021/8/9.
//

import SwiftUI

struct Home: View {
    
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1

    private let categories = ["All", "Historical fiction", "Romance", "Thriller", "Science fliction", "Fantasy novel"]

    var body: some View {
        ScrollView {

            VStack (alignment: .leading, spacing: 16) {
                //HomeNavBarView()
                
                Text("Hello, Derek")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(Color("GrayColor"))
                
                Text("Which books would you like to read today?")
                    .font(.title)
                    .fontWeight(.bold)
                
                SearchAndScanView(search: $search)

                ScrollView (.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0 ..< categories.count) { i in
                            Button(action: {selectedIndex = i}) {
                                CategoryView(isActive: selectedIndex == i, text: categories[i])
                            }
                        }
                    }
                    .padding()
                }

                SectionTabTitleView(title: "Today's recommend books")
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 16){
                        BigRecipeCardView(image: #imageLiteral(resourceName: "Harry Potter and the Half-Blood Prince"))
                        BigRecipeCardView(image: #imageLiteral(resourceName: "Harry Potter and the Deathly Hallows"))
                    }
                }
                
                SectionTabTitleView(title: "Recommended")
                
                SmallRecipeCardView(image: #imageLiteral(resourceName: "Deathly_Hallows_New_Cover"), title: "Herry Porter")
                SmallRecipeCardView(image: #imageLiteral(resourceName: "The Lightning Thief"), title: "Herry Porter")
                SmallRecipeCardView(image: #imageLiteral(resourceName: "The Sea of Monsters"), title: "Herry Porter")

                
                
            }
            .padding()
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct HomeNavBarView: View {
    var body: some View {
        HStack{
            
            Spacer()
            
            Image(uiImage: #imageLiteral(resourceName: "notifications"))
                .onTapGesture {
                    
                }
            
        }
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)) : Color.black.opacity(0.5))
            if (isActive) { Color("Primary")
                .frame(width: 15, height: 2)
                .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct SearchAndScanView: View {
    @Binding var search: String
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Furniture", text: $search)
            }
            .padding(.all, 20)
            .background(Color(#colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)).opacity(0.1))
            .cornerRadius(10.0)
            .padding(.trailing, 8)
            
            Button(action: {}) {
                Image("Scan")
                    .padding()
                    .background(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct SectionTabTitleView: View {
    let title: String
    var body: some View {
        //NavigationView{
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                NavigationLink(
                    destination: AllBooksView(),
                    label: {
                        Text("See All")
                            .foregroundColor(Color("PrimaryColor"))
                            .onTapGesture {
                            }
                    })
                
            }
        }
    //}
}

struct BigRecipeCardView: View {
    let image: UIImage
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading, spacing: 8){
                Image(uiImage: #imageLiteral(resourceName: "like"))
                    .padding(.bottom, 70)
                
                Text("New Book")
                    .font(.caption)
                    .foregroundColor(Color(#colorLiteral(red: 0.07058823529, green: 0.5607843137, blue: 0.6823529412, alpha: 1)))
                Text("Herry Porter")
                    .fontWeight(.medium)
                
                HStack (spacing: 2){
                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                        Image(uiImage: #imageLiteral(resourceName: "star"))
                            .renderingMode(.template)
                            .foregroundColor(Color("PrimaryColor"))
                    }
                }
                Text("120 Calories")
                    .font(.caption)
                    .foregroundColor(Color("PrimaryColor"))
                
                HStack {
                    Image(uiImage: #imageLiteral(resourceName: "time"))
                    Text("10 month ago")
                        .font(.caption2)
                        .foregroundColor(Color("GrayColor"))
                    
                    Image(uiImage: #imageLiteral(resourceName: "serving"))
                    Text("Borrowing")
                        .font(.caption2)
                        .foregroundColor(Color("GrayColor"))
                    
                    
                }
            }
            
            .frame(width: 147)
            .padding()
            .background(Color("LightGrayColor"))
            .cornerRadius(20.0)
            
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: 144, height: 113.0)
                .offset(x: 45, y: -60)
        }
        .padding(.trailing, 25)
    }
}

struct SmallRecipeCardView: View {
    
    let image: UIImage
    let title: String
    
    var body: some View {
        HStack {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: 144, height: 113.0)
                .aspectRatio(1,contentMode: .fill)
            
            VStack (alignment: .leading, spacing: 4){
                Text("")
                    .font(.caption)
                    .foregroundColor(Color(#colorLiteral(red: 0.07058823529, green: 0.5607843137, blue: 0.6823529412, alpha: 1)))
                Text(title)
                    .fontWeight(.medium)
                
                HStack (spacing: 2){
                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                        Image(uiImage: #imageLiteral(resourceName: "star"))
                            .renderingMode(.template)
                            .foregroundColor(Color("PrimaryColor"))
                    }
                    Text("120 Calories")
                        .font(.caption)
                        .foregroundColor(Color("PrimaryColor"))
                        .padding(.leading)
                }
                
                HStack {
                    Image(uiImage: #imageLiteral(resourceName: "time"))
                    Text("10 month ago")
                        .font(.caption2)
                        .foregroundColor(Color("GrayColor"))
                    
                    Image(uiImage: #imageLiteral(resourceName: "serving"))
                    Text("Borrowing")
                        .font(.caption2)
                        .foregroundColor(Color("GrayColor"))
                    Spacer()
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("LightGrayColor"))
        .cornerRadius(10.0)
    }
}

