//
//  ProfileView.swift
//  SwiftUI Final-2021-08-02
//
//  Created by user on 2021/8/8.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthdate = Date()
    @State private var shuldSendNewsletter = false
    @State private var numberOfLikes = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("personal Information")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    DatePicker("Birthdate", selection: $birthdate, displayedComponents: .date)
                }
                
                Section(header: Text("Actions")) {
                    Toggle("Send Newsletter", isOn: $shuldSendNewsletter)
                    Stepper("Number of Likes", value: $numberOfLikes, in: 1...100)
                    Text("This book has \(numberOfLikes) likes")
                }
            }
            .navigationTitle("Account")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        hidekeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    Button("Save", action: saveUser)
                    }
                }
            
            }
        .accentColor(.red)
        }
        func saveUser() {
            print("User Saved")
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

#if canImport(UIKit)
extension View {
    func hidekeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
