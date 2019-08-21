//
//  Ref.swift
//  Firebase Register
//
//  Created by MD RUBEL on 22/8/19.
//  Copyright © 2019 MD RUBEL. All rights reserved.
//

import Foundation
import FirebaseStorage
import FirebaseDatabase

let REF_USER = "users"
let STORAGE_ROOT_URL = "gs://registerdemo-mdr.appspot.com"
let STORAGE_PROFILE = "profilePic"
let UID = "uid"
let EMAIL = "email"
let NAME = "name"
let PROFILE_IMAGE_URL = "profileImageURL"
let STATUS = "status"
let ERROR_EMPTY_PHOTO = "Please choose your profile image"
let ERROR_EMPTY_NAME = "Please enter your name"
let SUCCESS_SIGN_UP = "Account created, now you can Sign In"

class Ref {
    
//    Database Ref
    let databaseRoot: DatabaseReference = Database.database().reference()
    var databaseUsers: DatabaseReference {
        return databaseRoot.child(REF_USER)
    }
    
    func databaseSpecificUser(uid: String) -> DatabaseReference {
        return databaseUsers.child(uid)
    }
    
//    Storage Ref
    let storageRoot: StorageReference = Storage.storage().reference(forURL: STORAGE_ROOT_URL)
    var storageProfile: StorageReference {
        return storageRoot.child(STORAGE_PROFILE)
    }
    
    func storageSpecificProfile(uid: String) -> StorageReference {
        return storageProfile.child(uid)
    }
    
}
