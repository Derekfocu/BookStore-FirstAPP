//
//  Push-Notifications.swift
//  SwiftUI Final-2021-08-02
//
//  Created by user on 2021/8/23.
//

import SwiftUI

struct Push_Notifications: View {
    
    @State var isPush = true
    @State var isSound = true
    @State var isActivities = true
    @State var isSystem = true
    @State private var ringtoneIndex = 0
    
    var ringtones = ["default", "Chicken", "Whistle", "Bell", "Melody"]
    
    var body: some View {
        
        
            VStack (alignment: .center, spacing: 0){
                
                Form{
                    
                    Section{
                        Toggle(isOn: $isPush) {
                            Text("Push Notifications")
                        }
                    }
                    
                    Section{
                        if isPush == true {
                            Toggle(isOn: $isSound) {
                                Text("Notification Sound")
                            }
                        }else{
                            EmptyView()
                        }
                        
                        if isPush == true, isSound == true {
                            Picker(selection: $ringtoneIndex, label:
                                    Text("Ringtone")){
                                ForEach(0 ..< ringtones.count) {
                                    Text(self.ringtones[$0]).tag($0)
                                }
                            }
                        }else{
                            EmptyView()
                        }
                    }
                    
                    if isPush == true{Section(header: Text("My Notifications")){
                        if isPush == true{
                            Toggle(isOn: $isActivities) {
                                Text("Activities")
                            }
                        }else{
                            EmptyView()
                        }
                        if isPush == true{
                            Toggle(isOn: $isSystem){
                                Text("System Update")
                            }
                        }
                    }
                    }
                }
            }
            .navigationBarTitle("Push Notifications", displayMode: .inline)
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        
    }
}

struct Push_Notifications_Previews: PreviewProvider {
    static var previews: some View {
        Push_Notifications()
    }
}
