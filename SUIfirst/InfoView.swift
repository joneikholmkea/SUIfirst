//
//  InfoView.swift
//  SUIfirst
//
//  Created by Jon Eikholm on 06/12/2022.
//

import SwiftUI

struct InfoView: View {
    
    let text:String
    let imagename:String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundColor(Color.white)
                .frame(height: 50)
                .padding(.all)
            HStack {
                Image(systemName: imagename)
                    .foregroundColor(Color.green)
                Text(text)
                    .font(Font.custom("ZenDots-Regular", size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "hello", imagename: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
