//
//  DetailViewDemo.swift
//  FirstIOSapp
//
//  Created by Jon Eikholm on 06/02/2023.
//

import SwiftUI

struct DetailViewDemo: View {
    
    @Binding var message:String
    var body: some View {
        TextField("Enter your name", text: $message)
    }
}

struct DetailViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewDemo(message: .constant("hej"))
    }
}
