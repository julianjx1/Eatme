//
//  Onboarding.swift
//  Eatme
//
//  Created by MoonBoon on 21/6/22.
//

import SwiftUI

struct Onboarding<Page: View>: View {
    var pages: [Page]
    var body: some View {
            VStack{
                PageViewController(pages: pages)
                Spacer(minLength: 40)
                HStack(spacing: 10) {
                    Rectangle()
                        .fill(Color("Deep Orange"))
                        .frame(width: 30)
                        .cornerRadius(4)
                    Rectangle()
                        .fill(Color("Deep Orange"))
                        .frame(width: 10)
                        .cornerRadius(4)
                        .opacity(0.40)
                    Rectangle()
                        .fill(Color("Deep Orange"))
                        .frame(width: 10)
                        .cornerRadius(4)
                        .opacity(0.40)
                    
                }.frame(height: 8)
                
                Spacer(minLength: 65)
                HStack(spacing: 128, content:{
                    Button("Skip") {
                        print("Skip")
                    }.foregroundColor(Color("Light Ash"))
                    Button("Next") {
                        print("Next")
                    }.frame(width: 168, height: 56, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color("Deep Orange"))
                        .cornerRadius(8)
                })
            }
        
        
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var pages = [
        
        
        OnboardingPage(spacing: 78,
                       boardingImage: "Screen1Burger",
                       boardingImageBottom: -22,
                       boardingImageHorizontal: 68,
                       title: "Choose a Favourite Food",
                       description: "When you oder Eat Steet, we’ll hook you up with exclusive coupon, specials and rewards"),
        OnboardingPage(backgroundImage: "Vector-1",
                       backgroundImageeHeight: 375,
                       spacing: 142,
                       boardingImage: "Screen2Delivery",
                       boardingImageBottom: -70,
                       boardingImageHorizontal: 42,
                       title: "Hot Delivery to Home",
                       description: "We make food ordering fasr, simple and free-no matter if you order online or cash"),
        OnboardingPage(spacing: 80,
                       boardingImage: "Screen3Deliverd",
                       boardingImageBottom: -24,
                       boardingImageHorizontal: 55,
                       title: "Receive the Great Food",
                       description: "You’ll receive the great food within a hour. And get free delivery credits for every order.")
        
        ]
    static var previews: some View {
        Onboarding(pages: pages)
        Onboarding(pages: pages).previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            .previewDisplayName("iPhone 13 Pro Max")
    }
}



