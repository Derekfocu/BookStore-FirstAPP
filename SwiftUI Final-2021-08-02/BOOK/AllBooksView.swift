//
//  FavorateView.swift
//  SwiftUI Final-2021-08-02
//
//  Created by user on 2021/8/7.
//

import SwiftUI

struct AllBooksView: View {
    
    @State var isFav = false
    var books: [Book] = BookList.topTen
    
    
    var body: some View {
        NavigationView {
           
                
            List(books, id:\.id) { book in
                
                NavigationLink(
                    destination: BooksDetailView(book: book),
                    label: {
                        Image(book.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 70)
                            .cornerRadius(4.0)
                            .padding(.vertical, 4)
                        
                        VStack (alignment: .leading, spacing: 5) {
                            Text(book.title)
                                .fontWeight(.semibold)
                                .lineLimit(2)
                                .minimumScaleFactor(0.5)
                            
                            Text(book.uploadDate)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    })
            }
            .navigationBarTitle("All Books",displayMode: .inline)
            
          
        
        }
    }
}

struct AllBooksView_Previews: PreviewProvider {
    static var previews: some View {
        AllBooksView()
    }
}

