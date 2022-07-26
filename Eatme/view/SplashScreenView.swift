//
//  SplashScreenView.swift
//  Eatme
//
//  Created by MoonBoon on 20/6/22.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            Image("SplashScreenImage")
                .frame(width: 167, height: 153, alignment: .center)
        }
        
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SplashScreenView()
            SplashScreenView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
                            .previewDisplayName("iPhone 13 Pro Max")
        }
    }
}
