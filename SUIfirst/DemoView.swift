//
//  DemoView.swift
//  SUIfirst
//
//  Created by Jon Eikholm on 25/01/2023.
//

import SwiftUI

struct DemoView: View {
    var body: some View {
        VStack{
            Text("Hello, World! sdf")
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            HStack{
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            Image(systemName: "phone")
        }
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
