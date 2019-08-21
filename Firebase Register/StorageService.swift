//
//  StorageService.swift
//  Firebase Register
//
//  Created by MD RUBEL on 21/8/19.
//  Copyright © 2019 MD RUBEL. All rights reserved.
//

import Foundation
import FirebaseStorage
import FirebaseAuth
//import FirebaseDatabase
import ProgressHUD

class StorageService {
    
    static func savePhoto(name: String, uid: String, data: Data, metadata: StorageMetadata, storageProfileRef: StorageReference, dict: Dictionary<String, Any>, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        
        storageProfileRef.putData(data, metadata: metadata, completion: { (stogareMetaData, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            
            storageProfileRef.downloadURL(completion: { (url, error) in
                if let metaImageURL = url?.absoluteString {
                    
                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                        changeRequest.photoURL = url
                        changeRequest.displayName = name
                        changeRequest.commitChanges(completion: { (error) in
                            if let error = error {
                                ProgressHUD.showError(error.localizedDescription)
                            }
                        })
                    }
                    
                    var dictTemp = dict
                    dictTemp[PROFILE_IMAGE_URL] = metaImageURL
                    
                    
                    Ref().databaseSpecificUser(uid: uid).updateChildValues(dictTemp, withCompletionBlock: { (error, ref) in
                            if error == nil {
                                onSuccess()
                            } else {
                                onError(error!.localizedDescription)
                            }
                        })
                    
                }
            })
            
        })
    }
}
