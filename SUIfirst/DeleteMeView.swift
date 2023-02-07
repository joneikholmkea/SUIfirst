//
//  DeleteMeView.swift
//  SUIfirst
//
//  Created by Jon Eikholm on 25/01/2023.
//

import SwiftUI

struct DeleteMeView: View {
    @State private var date = Date.now
    @State private var color = Color.gray
    @State private var text1 = ""
    private var myLogic = MyLogic()
    var body: some View {
        VStack{
            Text("Hello, World! is a wonderful start today.")
                .foregroundColor(Color.green)
                .bold()
                .font(Font.custom("Georgia", size:34))
            DatePicker(selection: $date, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
            Text("date is \(date.formatted(date: .long, time: .omitted))")
            ColorPicker("Color", selection: $color)
            Form {
                TextField("Name:", text: $text1)
            }
            .frame(maxHeight: 100)
            Text("your name is: \(myLogic.calculate(input: text1))")
                .border(.green)
                .frame(maxWidth: .infinity, alignment: .leading)
                .border(.blue)
                .padding(5)
            
            
        }
        .frame(maxHeight: .infinity)
//        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
        .background(color)
    }
}

struct DeleteMeView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteMeView()
    }
}
