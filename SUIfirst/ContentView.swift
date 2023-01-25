//
//  ContentView.swift
//  SUIfirst
//
//  Created by Jon Eikholm on 01/12/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color(red: 0.09, green: 0.63, blue: 0.52)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Hello, world! how are you??")
                    .font(.system(size: 33))
                    .fontWeight(.bold)
                    .underline()
                .foregroundColor(Color.brown)
                Text("Hello, world!")
                    .font(Font.custom("ZenDots-Regular", size: 33))
                    .fontWeight(.bold)
                    .underline()
                .foregroundColor(Color.white)
                Image("diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 200, alignment:.center)
                    .clipShape(Circle())
                    .overlay(
                        ZStack{
                            Circle().stroke(
                                Color.white,
                                style: StrokeStyle(lineWidth: 5)
                            )
                            Text("Go for it")
                        }
                    )
                Divider()
                InfoView(text: "+45 123 345 567", imagename: "phone.fill")
                InfoView(text: "jone@kea.dk", imagename: "envelope.fill")
                    
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


