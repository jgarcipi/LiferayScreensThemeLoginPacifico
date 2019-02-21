//
//  AddLoginPacificoScreenlet.swift
//  LiferayScreensThemeLoginPacifico
//
//  Created by Everis on 21/02/19.
//  Copyright © 2019 JJgarcia. All rights reserved.
//

import Foundation
import LiferayScreens

public class  AddLoginPacificoScreenlet : BaseScreenlet{
//MARK: Inspectables
@IBInspectable var folderId: Int64 = 0


//MARK: BaseScreenlet
    override public func createInteractor(name: String?, sender: Any?) -> Interactor? {
        
        let view = self.screenletView as! AddLoginPacifico_default
        
        let interactor = AddLoginInteractor(screenlet: self, folderId: folderId, userName: view.userName!, password: view.password!)
        
        //Called when interactor finish succesfully
        interactor.onSuccess = {
            let loginName = interactor.resultLoginInfo!["userName"] as! String
//            let bookmarkName = interactor.resultBookmarkInfo!["name"] as! String
            print("Bookmark \"\(loginName)\" saved!")
        }
        
        //Called when interactor finish with error
        interactor.onFailure = { _ in
            print("An error occurred saving the loginName")
        }
        
        return interactor
    }
}
