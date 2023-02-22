//
//  FileManager.swift
//  SUIfirst
//
//  Created by Jon Eikholm on 07/02/2023.
//

import Foundation
class MyFileManager: ObservableObject{
    
    let userDefaults = UserDefaults.standard
    let fService = FirebaseService()
    var myArray: [String] = ["A", "B"]
    
    @Published var items = [Item]()
    let arrayKey = "items"
    
    init() {
        //saveToFile()
        fService.startListener()
        readFromUserDefaults()
    }
    
    func addItem(text:String) {
        items.append(Item(title: text))
        saveToUserDefaults()
        fService.addNote(text: text)
    }
    
    func saveToUserDefaults(){
        do {
            let encodedData = try JSONEncoder().encode(items)
            userDefaults.set(encodedData, forKey: arrayKey)
            print("saved to userdefaults \(items)")
        } catch {
        }
    }
    
    func readFromUserDefaults(){
        if let savedData = userDefaults.object(forKey: arrayKey) as? Data {
            do{
                // 2
                let results = try JSONDecoder().decode([Item].self, from: savedData)
                self.items = results
                
                for i in items{
                    print(i)
                }
                print("size: \(items.count)")
            } catch {
            }
        }
    }
    
    
    let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as URL // Save in Documents
    fileprivate func saveToFile() {
        let myURL = url.appendingPathComponent("fileName")       // define the URL of the file ; take care of sandboxing constraints
        let data = NSMutableData()
        
//        let coder = NSKeyedArchiver(requiringSecureCoding: true)
//        record.encodeSystemFields(with: coder)
//        let data = coder.encodedData
        
//        let archiver = NSKeyedArchiver(forWritingWith: data)
        let archiver = NSKeyedArchiver(requiringSecureCoding: true)
        archiver.encode(myArray, forKey: arrayKey)
        archiver.finishEncoding()
        data.write(to: url, atomically: true)
        if let data = NSMutableData(contentsOf: myURL) {
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data as Data)
            if let anArray = unarchiver.decodeObject(forKey: arrayKey) as? [String]  {
                unarchiver.finishDecoding()
                myArray = anArray
            } else {
                // handle error appripriately
            }
        }
    }
    
    
}

