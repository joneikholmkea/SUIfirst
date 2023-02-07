//
//  ListDemo.swift
//  FirstIOSapp
//
//  Created by Jon Eikholm on 06/02/2023.
//

import SwiftUI

struct ListDemo: View {
    @State var items = [
        Item(title: "TutorialKart"),
        Item(title: "Swift Tutorial")
    ]
    @State private var newText: String = ""
    var body: some View {
        VStack{
            TextField("Enter your name", text: $newText)
            Button {
                items.append(Item(title: newText))
                newText=""
            } label: {
                Text("Add item")
            }

            NavigationView{
                List(items){ item in
                    NavigationLink(destination: DetailViewDemo(message: item.title)){
                        Text(item.title)
                    }
                }
            }
        }
    }
}

struct Item : Identifiable {
    let id = UUID()
    let title:String
}

struct ListDemo_Previews: PreviewProvider {
    static var previews: some View {
        ListDemo()
    }
}
