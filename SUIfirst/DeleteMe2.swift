//
//  DeleteMe2.swift
//  SUIfirst
//
//  Created by Jon Eikholm on 27/01/2023.
//

import SwiftUI

struct DeleteMe2: View {
    @State private var fruits = [
        "Apple",
        "Banana",
        "Papaya",
        "Mango"
    ]

    var body: some View {
        
        VStack{
            NavigationView {
                List {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit)
                    }
                    .onDelete { fruits.remove(atOffsets: $0) }
                    .onMove { fruits.move(fromOffsets: $0, toOffset: $1) }
                }
                .navigationTitle("Fruits")
                .toolbar {
                    EditButton()
                }
            }
            Button {
                print("hejasdf")
            } label: {
                Text("Pressff")
            }.frame(alignment: .top)

        }
    }
}

struct DeleteMe2_Previews: PreviewProvider {
    static var previews: some View {
        DeleteMe2()
    }
}
