//
//  OnboardingScreen01.swift
//  Eatme
//
//  Created by MoonBoon on 20/6/22.
//

import SwiftUI

struct OnboardingPage: View {
    
    var backgroundImage:String = "Vector"
    var backgroundImageeHeight:CGFloat = 437
    var spacing:CGFloat
    var boardingImage:String
    var boardingImageBottom:CGFloat
    var boardingImageHorizontal:CGFloat

    var title:String
    var description:String
    
    var body: some View {
    
        ZStack{
            Color.white.ignoresSafeArea()
            
            VStack(spacing: spacing) {
                
                OnboardingImageView(backgroundImage: backgroundImage, backgroundImageHeight: backgroundImageeHeight, boardingImage: boardingImage, boardingImageBottom: boardingImageBottom, boardingImageHorizontal: boardingImageHorizontal)
                
                OnboardingDescripton(title: title, description: description)
                Spacer()
               
            }
            
            
        }
    }
}




struct OnboardingScreen01_Previews: PreviewProvider {
    static var previews: some View {
        
        OnboardingPage(backgroundImage: "Vector-1",
                       backgroundImageeHeight: 375,
                       spacing: 142,
                       boardingImage: "Screen2Delivery",
                       boardingImageBottom: -70,
                       boardingImageHorizontal: 42,
                       title: "Hot Delivery to Home",
                       description: "We make food ordering fasr, simple and free-no matter if you order online or cash")
        
        OnboardingPage(spacing: 78, boardingImage: "Screen1Burger", boardingImageBottom: -22, boardingImageHorizontal: 68, title: "Choose a Favourite Food", description: "When you oder Eat Steet, we’ll hook you up with exclusive coupon, specials and rewards")
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
                        .previewDisplayName("iPhone 13 Pro Max")
                        

    }
}
