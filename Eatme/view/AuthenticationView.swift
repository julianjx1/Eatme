//
//  AuthenticationView.swift
//  Eatme
//
//  Created by Mahir Shahriar Lipeng on 6/11/22.
//

import SwiftUI

struct AuthenticationView: View {
    
    fileprivate let isLogin:Bool
    
    @ObservedObject private var viewmodel: AuthenticationViewModel
    
    @State var isPasswordShow:Bool = false
    @State var switchPosition:CGFloat = 8.0
    
    init(isLogin:Bool){
        self.isLogin = isLogin
        viewmodel = AuthenticationViewModel(isLogin: isLogin )
    }
    
    var body: some View {
        
        VStack{
            Image("Logo 02")
            VStack{
                Spacer(minLength: 40)
                
                // Title & Description
                VStack(spacing:8){
                    // Title
                    Text( isLogin ? "Let's Sign You In" : "Getting Started")
                        .foregroundColor(Color("BoldText"))
                        .font(.custom("", size: 24))
                        .fontWeight(.semibold)
                    //Description
                    Text( isLogin ? "Welcome back, you've been missed" : "Create an account to continue!")
                        .foregroundColor(Color("DescriptionText"))
                        .font(.custom("", size: 14))
                        .fontWeight(.medium)
                }
                Spacer(minLength: 41)
                
                // Form
                VStack( spacing:17){
                    
                    // Email
                    VStack(alignment:.leading,spacing:8){
                        HStack{
                            Text("Email")
                            Spacer()
                            if viewmodel.emailVerificationStatus == .incorrect {
                                Text("Incorrect email, try again")
                                    .foregroundColor(Color("Error"))
                            }
                            if viewmodel.emailVerificationStatus == .exist {
                                Text("This email is already teken")
                                    .foregroundColor(Color("Error"))
                            }
                        }
                        HStack{
                            TextField("", text: $viewmodel.user.email)
                                .foregroundColor(Color("BoldText"))
                                .onChange(of: viewmodel.user.email) { newValue in
                                    viewmodel.isEmailVerified()
                                }
                                
                            if viewmodel.emailVerificationStatus == .notDefiend{
                                Image("Uncheck Right Mark Icon")
                            }
                            else if viewmodel.emailVerificationStatus == .incorrect || viewmodel.emailVerificationStatus == .exist{
                                Image("Cancel Icon")
                            }
                            else if viewmodel.emailVerificationStatus == .correct{
                                Image("Check Right Mark Icon")
                            }
                            else {
                                ProgressView()
                            }
                        }
                        .frame(
                        maxHeight: 56)
                        .padding(EdgeInsets(top: 20, leading: 24, bottom: 20, trailing: 22))
                        .background(Color("InputTextField"))
                        .cornerRadius(8)
                    }.frame(minWidth: 0,
                            maxWidth: .infinity)
                    
                    
                    // Username
                    if !isLogin {
                        VStack(alignment:.leading,spacing:8){
                            HStack{
                                Text("Username")
                                Spacer()
                                if viewmodel.usernameVerificationStatus == .incorrect {
                                    Text("Incorrect email, try again")
                                        .foregroundColor(Color("Error"))
                                }
                            }
                            HStack{
                                TextField("", text: $viewmodel.user.userName)
                                    .foregroundColor(Color("BoldText"))
                                    .onChange(of: viewmodel.user.userName) { newValue in
                                        viewmodel.isUserNameVerified()
                                    }
                                
                                if viewmodel.usernameVerificationStatus == .notDefiend{
                                    Image("Uncheck Right Mark Icon")
                                }
                                else if viewmodel.usernameVerificationStatus == .incorrect{
                                    Image("Cancel Icon")
                                }
                                else if viewmodel.usernameVerificationStatus == .correct{
                                    Image("Check Right Mark Icon")
                                }
                                else {
                                    ProgressView()
                                }
                            }
                            .frame(maxHeight: 56)
                            .padding(EdgeInsets(top: 20, leading: 24, bottom: 20, trailing: 22))
                            .background(Color("InputTextField"))
                            .cornerRadius(8)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    
                    // Password
                    VStack(alignment:.leading, spacing:8){
                        Text("Password")
                        HStack{
                            if isPasswordShow{
                                TextField("", text: $viewmodel.user.password)
                                    .foregroundColor(Color("BoldText"))
                            }else{
                                SecureField("", text: $viewmodel.user.password)
                                    .foregroundColor(Color("BoldText"))
                            }
                            Button {
                                isPasswordShow.toggle()
                            } label: {
                                withAnimation {
                                    Image(isPasswordShow ? "Eye_Close" : "Eye")
                                }
                            }
                        }
                        .frame(maxHeight: 56)
                        .padding(EdgeInsets(top: 20, leading: 24, bottom: 20, trailing: 22))
                        .background(Color("InputTextField"))
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    
                    // Save Me and Forget Password
                    if isLogin {
                        HStack{
                            
                            // Switch Icon
                            ZStack{
                                if viewmodel.isSaveMe{
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color("Deep Orange"))
                                }else{
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color("InputText"))
                                }
                                Circle()
                                    .fill( viewmodel.isSaveMe ? .white : Color("InputText"))
                                    .frame(width: 8, height: 8)
                                    .position(x:switchPosition, y: 8)
                            }.onTapGesture {
                                withAnimation {
                                    viewmodel.isSaveMe.toggle()
                                    switchPosition = viewmodel.isSaveMe ? 24.0 : 8.0
                                }
                            }
                            .frame(width: 32, height: 16)
                            
                            Text("Save Me")
                            Spacer()
                            Button("Forgot Password?") {
                                
                            }
                        }
                    }
                }
                .foregroundColor(Color("InputText"))
                .font(.custom("", size: 14))
                Spacer(minLength: 32)
                
                
                // Sign In
                Button(action: {
                    viewmodel.submitForLogin()
                }, label: {
                    if viewmodel.buttonStatus == .notSubmit {
                        Text( isLogin ? "Sign In" : "Sign Up")
                            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 56)
                    }
                    else if viewmodel.buttonStatus == .loading{
                        ProgressView().progressViewStyle(CircularProgressViewStyle.init(tint: .white))
                    }
                    else{
                        Text( isLogin ? "Sign In" : "Sign Up")
                            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 56)
                    }
                        
                }).frame(minWidth: 0, maxWidth: .infinity, maxHeight: 56)
                    .background(Color("Deep Orange"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .disabled(viewmodel.buttonStatus == .loading)
                    
                Spacer(minLength: 24)
                
                // New Account
                HStack{
                    Text( isLogin ? "Don't have an account?" : "Already have an account?")
                        .foregroundColor(Color("DescriptionText"))
                    Button( isLogin ? "Sign Up" : "Sign In") {
                       
                    }
                    .foregroundColor(Color("Deep Orange"))
                }
                .font(.custom("", size: 16))
                
                Spacer(minLength: isLogin ? 71 : 30)
                
            }
            Spacer()
            
            // Continue with Facebook or Google
            VStack(spacing: 16) {
                Button {
                    print("Continue With Facebook")
                } label: {
                    HStack(spacing: 10) {
                        Image("Facebook Logo")
                            .frame(width: 16, height: 16)
                        Text("Continue With Facebook")
                    }.frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
                    .foregroundColor(.white)
                }
                .background(Color("Facebook Color"))
                .cornerRadius(8)
                
                Button {
                    print("Continue With Google")
                } label: {
                    HStack(spacing: 10) {
                        Image("Google Logo")
                            .frame(width: 16, height: 16)
                        Text("Continue With Google")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
                    .foregroundColor(.black)
                }
                .background(Color("Google Color"))
                .cornerRadius(8)
            }
        }.padding(EdgeInsets.init(top: 48, leading: 24, bottom: 32, trailing: 24))
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView (isLogin: true)
    }
}
