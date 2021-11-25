//
//  About.swift
//  SwiftUI Final-2021-08-02
//
//  Created by user on 2021/8/23.
//

import SwiftUI

struct About: View {
    var body: some View {
        NavigationView{
            VStack{
        Form {
            FormRowStaticView(icon: "gear", firstText: "Application",
                              secondText: "BookStore")
            FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone, iPad")
            FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Derek/Chou")
            FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Robert Petras")
            FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.1")
                }
            }
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
