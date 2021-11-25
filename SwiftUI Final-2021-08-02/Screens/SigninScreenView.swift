//
//  SigninScreenView.swift
//  SwiftUI Final-2021-08-02
//
//  Created by user on 2021/8/8.
//

import SwiftUI

struct SigninScreenView: View {
    
    
    var body: some View {
        
        // For Smaller Size Iphones...
        
        VStack{
            
            if UIScreen.main.bounds.height < 750{
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    home()
                }
            }
            else{
                home()
            }
        }
        .padding(.vertical)
    }
}

struct SigninScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SigninScreenView()
    }
}

struct home: View {
    
    @State var index = 0
    @Namespace var name

    var body: some View {
        
        VStack {
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 180, height: 180)
                
            
            HStack(spacing: 0) {
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        index = 0
                    }
                    
                }) {
                    
                    VStack {
                        
                        Text("Login")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(index == 0 ? .black: .gray)
                        
                        ZStack {
                            
                            // slide animation...
                            
                            Capsule()
                                .fill(Color.black.opacity(0.04))
                                .frame(height: 4)
                            
                            if index == 0{
                                
                                Capsule()
                                    .fill(Color.green)
                                    .frame( height: 4)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                            
                        }
                    }
                }
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        index = 1
                    }
                    
                }) {
                    
                    VStack {
                        
                        Text("Sign Up")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(index == 1 ? .black: .gray)
                        
                        ZStack {
                            
                            // slide animation...
                            
                            Capsule()
                                .fill(Color.black.opacity(0.04))
                                .frame(height: 4)
                            
                            if index == 1{
                                
                                Capsule()
                                    .fill(Color.green)
                                    .frame( height: 4)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                            
                        }
                    }
                }
            }
            .padding(.top, 30)
                                  
            // Login View...
            
            // Changing Views Based On Index...
            
            if index == 0{
                
                Login()
            }
            else{
                
                SignUp()
            }
        }
        .padding()
    }
}
    
struct Login: View {
    
    @State var password = ""
    @State var hiddle = false
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("Hello Derek,")
                        .fontWeight(.bold)
                    
                    Text("Brock")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Button(action: {}) {
                        
                        Text("This isn't me")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                            .foregroundColor(Color.green)
                    }
                }
                
                Spacer(minLength: 0)
                
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 85, height: 85)
                    .clipShape(Circle())
            }
            .padding(.horizontal, 25)
            .padding(.top, 30)
            
            VStack(alignment: .leading, spacing: 15) {
                
                Text("Password")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                ZStack {
                    
                    HStack{
                        
                        if self.hiddle {
                            TextField("password", text: $password)
                                .frame(width: UIScreen.main.bounds.width - 1)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(5)
                            // shadow effect...
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                                .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                        }else {
                            
                            SecureField("password", text: $password)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(5)
                            // shadow effect...
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                                .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                                }
                        
                        Button(action: {
                                self.hiddle.toggle()
                        }) {
                            Image(systemName: self.hiddle ? "eye.fill": "eye.slash.fill")
                                .foregroundColor((self.hiddle == true) ? Color.green : Color.secondary)
                        }.offset(x: -35, y: 0)
                    }
                }
                
                
                
                Button(action: {}) {
                    
                    Text("Forget Password")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                }
                .padding(.top, 10)
            }
            .padding(.horizontal, 25)
            .padding(.top, 25)
            
            // Login Button...
            
            NavigationLink (
                destination: PrivateHome().navigationBarHidden(true),
                label: {
                Text("Login")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
                    .background(
                    
                        LinearGradient(gradient: .init(colors: [Color.green, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .cornerRadius(8)
            
            .padding(.horizontal, 25)
            .padding(.top, 25)
                })
            
            
            Text("or get a link emailed to you")
                .foregroundColor(Color.black.opacity(0.4))
                .padding(.bottom, -50)
                .padding(.top, 10)
            
            // Social Buttons...
            
            Spacer(minLength: 0)
            
            Button(action: {}) {
                
                HStack(spacing: 35) {
                    
                    Image(systemName: "faceid")
                        .font(.system(size: 26))
                        .foregroundColor(Color.green)
                    
                    Text("Logint With Face ID")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.leading, 50)
                        .foregroundColor(Color.green)
                
                    Spacer(minLength: 0)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.green, lineWidth: 1))
            }
            .padding(.top, 35)
            .padding(.horizontal, 25)
            
             Spacer(minLength: 0)
            
            Link(destination: URL(string: "https://myaccount.google.com")!) {
                SocalLoginButton(imgae: Image(uiImage: #imageLiteral(resourceName: "google")), text: Text("Sign in with Google"))}
                .foregroundColor(Color.green)
                .padding()
                .cornerRadius(8)
                //.background(RoundedRectangle(cornerRadius: 8).stroke(Color.green, lineWidth: 1))

        }
    }
}

//var social = ["twitter", "fb", "google"]


struct SignUp: View {
    
    @State var user = ""
    @State var password = ""
    @State var hiddle = false

    var body: some View{
        
        VStack{
            
            HStack {
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("Create Account")
                        .font(.title)
                        .fontWeight(.bold)
                    
                }
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 25)
            .padding(.top, 30)
            
            VStack(alignment: .leading, spacing: 15) {
                
                Text("Username")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                TextField("email", text: $user)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 34)
                    .background(Color.white)
                    .cornerRadius(5)
                // shadow effect...
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                    
                
                Text("Password")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                ZStack {
                    
                    HStack{
                        
                        if self.hiddle {
                            TextField("password", text: $password)
                                .padding()
                                .frame(width: UIScreen.main.bounds.width - 34)
                                .background(Color.white)
                                .cornerRadius(5)
                            // shadow effect...
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                                .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                        }else {
                            
                            SecureField("password", text: $password)
                                .padding()
                                .frame(width: UIScreen.main.bounds.width - 34)
                                .background(Color.white)
                                .cornerRadius(5)
                            // shadow effect...
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                                .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                        }
                        Button(action: {
                                self.hiddle.toggle()
                        }) {
                            Image(systemName: self.hiddle ? "eye.fill": "eye.slash.fill")
                                .foregroundColor((self.hiddle == true) ? Color.green : Color.secondary)
                        }.offset(x: -35, y: 0)
                    }
                }
                    }
            .padding(.horizontal, 25)
            .padding(.top, 25)
            
            // Login Button...
            
            NavigationLink (
                destination: PrivateHome().navigationBarHidden(true),
                label: {
                Text("Sign Up")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
                    .background(
                    
                        LinearGradient(gradient: .init(colors: [Color.green,Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .cornerRadius(8)
            
            .padding(.horizontal, 25)
            .padding(.top, 25)
                })
            Text("or get a link emailed to you")
                .foregroundColor(Color.black.opacity(0.4))
                .padding(.bottom, -50)
                .padding(.top, 10)
            
            // Social Buttons...
            
            Button(action: {}) {
                
                HStack(spacing: 35) {
                    
                    Image(systemName: "faceid")
                        .font(.system(size: 26))
                        .foregroundColor(Color.green)
                    
                    Text("Sign Up With Face ID")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.leading, 50)
                        .foregroundColor(Color.green)
                
                    Spacer(minLength: 0)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.green, lineWidth: 1))
            }
            .padding(.top, 35)
            .padding(.horizontal, 25)
            
            Spacer(minLength: 0)
           
           Link(destination: URL(string: "https://myaccount.google.com")!) {
               SocalLoginButton(imgae: Image(uiImage: #imageLiteral(resourceName: "google")), text: Text("Sign Up with Google"))}
               .foregroundColor(Color.green)
            //.padding(.trailing, 60)
               .cornerRadius(8)
               //.background(RoundedRectangle(cornerRadius: 8).stroke(Color.green, lineWidth: 1))

        }
        
        //.padding(.leading, 30)
        //.padding(.trailing, 10)
            }
        }

struct SocalLoginButton: View {
    
    var imgae: Image
    var text: Text
    
    var body: some View {
        HStack {
            imgae
                .padding(.horizontal)
            
            Spacer()
            text
                .font(.title2)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(50.0)
        .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
    }
}
