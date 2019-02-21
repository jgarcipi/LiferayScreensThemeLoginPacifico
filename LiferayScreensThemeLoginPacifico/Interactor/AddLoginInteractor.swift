//
//  AddBookmarkInteractor.swift
//  LiferayScreensThemeLoginPacifico
//
//  Created by Everis on 19/02/19.
//  Copyright © 2019 JJgarcia. All rights reserved.
//

import Foundation
import LiferayScreens

public class AddLoginInteractor: Interactor, LRCallback {
    
    
    
    
    public let userName: String?
    public let password : String?
    
//    public let folderId: Int64
//    public let title: String
//    public let url: String
    
    ///Resulted bookmark info from the service
    public var resultLoginInfo: [String:AnyObject]?
    
    //MARK: Initializer
    public init(screenlet: BaseScreenlet, userName: String, password: String) {
        self.userName = userName
        self.password = password
        super.init(screenlet: screenlet)
    }
    
    //MARK: Initializer
//    public init(screenlet: BaseScreenlet, folderId: String, title: String) {
//        self.folderId = folderId
//        self.title = title
//        super.init(screenlet: screenlet)
//    }
    
    
    
    //MARK: Interactor
    override public func start() -> Bool {
        let session = SessionContext.createSessionFromCurrentSession()
        session?.callback = self
        
        let service = LRBookmarksEntryService_v7(session: session!)
        
        do {
            try service.addEntry(withGroupId: LiferayServerContext.groupId,
                                            userName: userName,
                                            password: password,
                                            description: "Added from Liferay Screens Login",
                                            serviceContext: nil)
            
            return true
        }
        catch {
            return false
        }
    }
    
    //MARK: LRCallback
    public func onFailure(_ error: Error) {
        self.callOnFailure(error as NSError)
    }
    
    public func onSuccess(_ result: Any) {
        resultLoginInfo = (result as! [String:AnyObject])
        
        self.callOnSuccess()
    }
    
}
