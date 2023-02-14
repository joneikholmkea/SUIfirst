//
//  FirebaseService.swift
//  FirebaseDemo
//
//  Created by Jon Eikholm on 01/03/2021.
//

import Foundation
import Firebase
//import FirebaseStorage
class FirebaseService {
    private var db = Firestore.firestore()
//    var storage = Storage.storage()
//    var storageRef:StorageReference?
    var notes = [Note]() // empty array
    private var notesCol = "notes"
   // var parent:Updatable?
    
//    func uploadImage(image:UIImage){
//        if let data = image.jpegData(compressionQuality: 1.0){
//            if let imageRef = storageRef?.child("nature.jpg"){
//            print("uploadImage called")
//            imageRef.putData(data, metadata: nil){ (metadata, error) in
//                if let e = error {
//                    print("error uploading image \(e)")
//                }else {
//                    print("OK uploading image")
//                }
//            }
//            }
//        }
//    }
    
    func addNote(text:String) {
        print("addNote called with \(text)")
            if text.count > 0 {
                let doc = db.collection(notesCol).document() // will create a new document
                var data = [String:String]()  // creates a new, empty dictionary (map)
                data["text"] = text // later, text comes from textField
                doc.setData(data)  // will save to Firebase
            }
    }
    
    func updateNote(index:Int, text:String) {
            if text.count > 0 {
                let doc = db.collection(notesCol).document(notes[index].id) // will create a new document
                var data = [String:String]()  // creates a new, empty dictionary (map)
                data["text"] = text // later, text comes from textField
                doc.setData(data)  // will save to Firebase
            }
    }
    
    func deleteNote(index:Int) {
        if index < notes.count {
            let docID = notes[index].id
            db.collection(notesCol).document(docID).delete(){ err in
                if let e = err {
                    print("error deleting \(docID) \(e)")
                }else {
                    print("ok deleting \(docID)")
                }
            }
            notes.remove(at: index) // will remove the item to be deleted
        }
    }
    
    func startListener(){ // will keep listening
        db.collection(notesCol).addSnapshotListener { (snap, error) in
            if let e = error {
                print("error fetching data \(e)")
            }else {
                if let s = snap {
                    self.notes.removeAll()
                    for doc in s.documents {
                        if let txt = doc.data()["text"] as? String {
                            print(txt)
                            //print(doc.documentID)
                            let note = Note(id:doc.documentID, text: txt)
                            self.notes.append(note)
                        }
                    }
                    //self.parent?.update(obj: nil)
                }
            }
        }
    }
    
    
    
}

