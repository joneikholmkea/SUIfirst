//
//  ListDemo.swift
//  FirstIOSapp
//
//  Created by Jon Eikholm on 06/02/2023.
//

import SwiftUI

struct ListDemo: View {
    @ObservedObject var fileMan = MyFileManager()
    @State private var newText: String = ""
    
    var body: some View {
        VStack{
            TextField("Enter text", text: $newText)
            HStack{
                Button {
                    fileMan.addItem(text: newText)
                    newText=""
                } label: {
                    Text("Add item")
                }
                Spacer()
                Button {
                    fileMan.saveToUserDefaults()
                } label: {
                    Text("Save")
                }
            }.padding(10)
            

            NavigationView{
                List($fileMan.items){ item in
                    NavigationLink(destination: DetailViewDemo(message: item.title)){
                        Text(item.title.wrappedValue)
                    }
                }
            }
        }
    }
    
}

struct Item : Identifiable, Codable {
    var id = UUID()
    var title:String
    init(title: String) {
        self.title = title
    }
}

struct ListDemo_Previews: PreviewProvider {
    static var previews: some View {
        ListDemo()
    }
}
