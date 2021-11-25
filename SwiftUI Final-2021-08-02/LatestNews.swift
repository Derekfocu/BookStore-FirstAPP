//
//  LatestNews.swift
//  SwiftUI Final-2021-08-02
//
//  Created by user on 2021/8/22.
//

import SwiftUI

struct LatestNews: View {
    
    @State var messages: [String] = [ "message1", "message2", "message3", "message4", "message5"]

    var body: some View{
        
        NavigationView{
            List{
                Section {
                    ForEach(messages, id: \.self) { message in Text(message.capitalized)
                    }
                    .onDelete(perform: delete)
                }
            }
            .navigationBarTitle("Notification", displayMode: .inline)
        }
    }
    
    func delete(indexSet: IndexSet) {messages.remove(atOffsets: indexSet)
    }
    
}
struct LatestNews_Previews: PreviewProvider {
    static var previews: some View {
        LatestNews()
    }
}
