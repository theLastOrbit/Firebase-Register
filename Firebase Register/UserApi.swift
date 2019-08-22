//
//  UserApi.swift
//  Firebase Register
//
//  Created by MD RUBEL on 21/8/19.
//  Copyright © 2019 MD RUBEL. All rights reserved.
//

import Foundation
import FirebaseAuth
//import FirebaseDatabase
import FirebaseStorage
import ProgressHUD

class UserApi {
    
    func signIn(email: String, password: String, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
            if error != nil {
                ProgressHUD.showError(error!.localizedDescription)
                return
            }
            onSuccess()
        }
    }
    
    func signUp(withName name:String, email: String, password: String, image: UIImage?, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            if error != nil {
                ProgressHUD.showError(error!.localizedDescription)
                return
            }
            
            if let authData = authDataResult {
                let dict: Dictionary<String, Any> = [
                    UID: authData.user.uid,
                    EMAIL: authData.user.email!,
                    NAME: name,
                    PROFILE_IMAGE_URL: "",
                    STATUS: "Welcome to Crisos!"
                ]
                guard let imageData = image!.jpegData(compressionQuality: 0.5) else {
                    return
                }
                
                let storageProfile = Ref().storageSpecificProfile(uid: authData.user.uid)
                
                let metadata = StorageMetadata()
                metadata.contentType = "image/jpg"
                
                StorageService.savePhoto(name: name, uid: authData.user.uid, data: imageData, metadata: metadata, storageProfileRef: storageProfile, dict: dict, onSuccess: {
                    onSuccess()
                }, onError: { (errorMessage) in
                    onError(errorMessage)
                })
                
            }
        }
    }
    
    func resetPassword(email: String, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error != nil {
                ProgressHUD.showError(error!.localizedDescription)
                return
            }
            onSuccess()
        }
    }
    
}
