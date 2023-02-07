//
//  DetailViewDemo.swift
//  FirstIOSapp
//
//  Created by Jon Eikholm on 06/02/2023.
//

import SwiftUI

struct DetailViewDemo: View {
    
    let message:String
    var body: some View {
        Text(message)
    }
}

struct DetailViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewDemo(message: "hello")
    }
}
