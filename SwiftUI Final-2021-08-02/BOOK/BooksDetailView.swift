//
//  FollowersDeatilView.swift
//  SwiftUI Final-2021-08-02
//
//  Created by user on 2021/8/7.
//

import SwiftUI

struct BooksDetailView: View {
    
    var book: Book
    
    var body: some View {
        VStack (spacing: 20){
            
            
            Spacer()
            
            Image(book.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 350)
                .cornerRadius(12.0)
            
            Text(book.title)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            HStack (spacing: 40){
                Label("\(book.viewCount)", systemImage: "eye.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(book.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
             
            Text(book.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Link(destination: book.url, label: {
                Text("Browse Now")
                    .bold()
                    .font(.title2)
                    .frame(width: 280, height: 50)
                    .background(Color(.systemRed))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
        }
    }
}

struct BooksDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BooksDetailView(book: BookList.topTen.first!)
    }
}
