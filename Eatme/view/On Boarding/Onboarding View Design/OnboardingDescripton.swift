//
//  OnboardingDescripton.swift
//  Eatme
//
//  Created by MoonBoon on 21/6/22.
//

import SwiftUI

struct OnboardingDescripton: View {
    var title:String
    var description:String
    
    var body: some View {
        VStack(spacing: 16){
            Text(title)
                .foregroundColor(Color("BoldText"))
                .font(Font.custom("Gilroy", size: 24).weight(.semibold))
                
            Text(description)
                .foregroundColor(Color("DescriptionText"))
                .font(Font.custom("Gilroy", size: 14).weight(.regular))
                .multilineTextAlignment(.center)
              
        }.padding(EdgeInsets(top: 0, leading: 34, bottom: 0, trailing: 34))
    }
}


struct OnboardingDescripton_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingDescripton(title: "Choose a Favourite Food", description: "When you oder Eat Steet, we’ll hook you up with exclusive coupon, specials and rewards")
    }
}
