//
//  OTPAuthenticationView.swift
//  Eatme
//
//  Created by Mahir Shahriar Lipeng on 22/11/22.
//

import SwiftUI

struct OTPAuthenticationView: View {
    
    @State var textField1:String = ""
    var body: some View {
        VStack{
            Image("Logo 02")
            Spacer(minLength: 64)
            
            // Title & Description
            VStack(spacing:16){
                // Title
                Text("OTP Authentication")
                    .foregroundColor(Color("BoldText"))
                    .font(.custom("", size: 24))
                    .fontWeight(.semibold)
                //Description
                Text("An authentication code has been sent to armannijm@gmail.com")
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(Color("DescriptionText"))
                    .font(.custom("", size: 14))
                    .multilineTextAlignment(.center)
                
            }
            
            Spacer(minLength: 48)
            
            HStack(alignment: .center, spacing: 22) {
                TextField("3", text: $textField1)
                    .padding(EdgeInsets(top: 23, leading: 30, bottom: 23, trailing: 30))
                    .background(Color("InputTextField"))
                    .border(Color("OTPText"))
                    .cornerRadius(10)
                
                TextField("3", text: $textField1)
                    .padding(EdgeInsets(top: 23, leading: 30, bottom: 23, trailing: 30))
                    .background(Color("InputTextField"))
                    .border(Color("OTPText"))
                    .cornerRadius(10)
                TextField("3", text: $textField1)
                    .padding(EdgeInsets(top: 23, leading: 30, bottom: 23, trailing: 30))
                    .background(Color("InputTextField"))
                    .border(Color("OTPText"))
                    .cornerRadius(10)
                TextField("3", text: $textField1)
                    .padding(EdgeInsets(top: 23, leading: 30, bottom: 23, trailing: 30))
                    .background(Color("InputTextField"))
                    .border(Color("OTPText"))
                    .cornerRadius(10)
            }
            .font(.custom("", size: 16))
            .foregroundColor(Color("BoldText"))
            
            Spacer(minLength: 24)
            
            HStack{
                Text( "Didn’t receive code.")
                    .foregroundColor(Color("DescriptionText"))
                Button("Resend Code") {
                   
                }
                .foregroundColor(Color("Deep Orange"))
            }
            .font(.custom("", size: 16))
            
            Spacer(minLength: 200)
            VStack(spacing: 16){
                Button(action: {
                   
                }, label: {
                    
                        Text("Continue")
                            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 56)
                    
                }).frame(minWidth: 0, maxWidth: .infinity, maxHeight: 56)
                    .background(Color("Deep Orange"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                
                VStack{
                        Text("By Signing up, you agree to our.")
                        Button("Term and Conditions") {
                        }
                        .foregroundColor(Color("Deep Orange"))
                    }
                .foregroundColor(Color("DescriptionText"))
                .font(.custom("", size: 16))
            }
            
            
            
           
        }
        .padding(EdgeInsets.init(top: 48, leading: 24, bottom: 32, trailing: 24))
    }
}

struct OTPAuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        OTPAuthenticationView()
    }
}
