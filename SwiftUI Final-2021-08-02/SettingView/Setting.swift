//
//  Setting.swift
//  SwiftUI Final-2021-08-02
//
//  Created by user on 2021/8/7.
//

import SwiftUI

struct Setting: View {
    
    // Mark: - Properties
    
    @Environment(\.presentationMode) var
        presentationMode
    @State var isDark = false
    @State var isSystem = true
    @State var showAlert = false
    
    var alert: Alert{
        Alert(
        title: Text("Alerts's title"),
            message: Text("Are you sure you want to logout?"),
            primaryButton: .default(Text("Logout")),
            secondaryButton: .cancel())
    }
    // Mark: - Body
    
    
    var body: some View {
        
        NavigationView {
            VStack (alignment: .center, spacing: 0) {
                
                // Mark: - Form
                
                Form {
                    
                    Section(header: Text("My Account")) {
                        NavigationLink(
                            destination: ProfileView(),
                            label: {
                                Text("My Profile")
                            })
                    }
                                                        
                    Section(header: Text("Display")) {

                        Toggle(isOn: $isDark) {
                            Text("Dark mode")
                        }
                        Toggle(isOn: $isSystem) {
                            Text("Use system settings")
                        }
                        NavigationLink(
                            destination: Push_Notifications(),
                            label: {
                                Text("Notification Setting")
                            })
                        .padding(.vertical,1)

                    }
                    
                    // Mark: Section 3
                    
                    Section(header: Text("Follow us on social media")) {
                        FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://www.books.com.tw")
                        FormRowLinkView(icon: "link", color: Color.blue, text: "Twitter", link: "https://twitter.com/")
                        FormRowLinkView(icon: "play.rectangle", color: Color.green, text: "Courses", link: "https://www.udemy.com/user/robert-petras")
                    } //: Section 3
                    .padding(.vertical, 3)
                    
                   // Mark: Section 4
                    
                    Section(header: Text("About the application")) {
                        NavigationLink(
                            destination: About(),
                            label: {
                                Text("About")
                            })
                    } //: Section 4
                    .padding(.vertical, 3)
                    
                    Button("LOGOUT") {
                        self.showAlert.toggle()
                    }
                    
                    

                .alert(isPresented: $showAlert, content: {
                    self.alert})
                    
                } //: Form
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                
                // Mark: - Footer
                
                Text("Copyright @ All rights reserved.\nBetter Apps ♡ Less Code")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(Color.secondary)
            } //: Vstack
            
            
            .navigationBarTitle("Settings", displayMode: .inline)
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        }// Navigation
    }
}

struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        Setting()
    }
}
