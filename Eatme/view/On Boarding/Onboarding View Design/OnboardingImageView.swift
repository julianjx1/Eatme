//
//  OnboardingImageView.swift
//  Eatme
//
//  Created by MoonBoon on 21/6/22.
//

import SwiftUI

struct OnboardingImageView: View {
    var backgroundImage:String
    var backgroundImageHeight: CGFloat
    
    var boardingImage:String
    var boardingImageBottom:CGFloat
    var boardingImageHorizontal:CGFloat
    
    private let logo:String = "Logo 02"
    
    var body: some View {
        ZStack{
            Image(backgroundImage)
                .resizable()
            VStack(alignment: .center, spacing: 48) {
                Image(logo)
                    .frame(width: 190, height: 60, alignment: .center)
                Image(boardingImage)
                    .frame(width: 240, height: 305, alignment: .center)
            }
            .padding(EdgeInsets(top: 48, leading: boardingImageHorizontal, bottom: boardingImageBottom, trailing: boardingImageHorizontal))
            
            
               
                
        }.frame(minWidth: 0, idealWidth: 437, maxWidth: .infinity, minHeight: 0, idealHeight: backgroundImageHeight, maxHeight: backgroundImageHeight, alignment: .topLeading)
    }
}

struct OnboardingImageView_Previews: PreviewProvider {
    static var previews: some View {
       
        OnboardingImageView(backgroundImage: "Vector", backgroundImageHeight: 437, boardingImage: "Screen1Burger", boardingImageBottom: -22, boardingImageHorizontal: 67)
    }
}
