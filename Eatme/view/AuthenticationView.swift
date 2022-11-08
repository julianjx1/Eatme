//
//  AuthenticationView.swift
//  Eatme
//
//  Created by Mahir Shahriar Lipeng on 6/11/22.
//

import SwiftUI

struct AuthenticationView: View {
    
    var body: some View {
        VStack{
            VStack{
                Image("Logo 02")
                Spacer(minLength: 40)
                Text("Let’s Sign You In")
                    .foregroundColor(Color("BoldText"))
                    .font(.custom("", size: 24))
                    .fontWeight(.semibold)
                Spacer(minLength: 8)
                Text("Welcome back, you’ve been missed!")
                    .foregroundColor(Color("DescriptionText"))
                    .font(.custom("", size: 14))
                    .fontWeight(.medium)
            }
            
            VStack(spacing: 16) {
                Button {
                    print("Continue With Facebook")
                } label: {
                    HStack(spacing: 10) {
                        Image("Facebook Logo")
                            .frame(width: 16, height: 16)
                        Text("Continue With Facebook")
                    }
                    .foregroundColor(.white)
                }
                .frame(height: 50)
                .background(Color("Facebook Color"))
                .cornerRadius(8)
                        
                
                Button {
                    print("Continue With Google")
                } label: {
                    HStack(spacing: 10) {
                        Image("Google Logo")
                            .frame(width: 16, height: 16)
                        Text("Continue With Facebook")
                    }
                    .foregroundColor(.black)
                }
                .frame(height: 50)
                .background(Color("Google Color"))
                .cornerRadius(8)
               
            }
        }
       
       
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
