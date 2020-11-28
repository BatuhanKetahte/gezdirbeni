//
//  CreateNavigationController.swift
//  Discover City's
//
//  Created by Ferhan Akkan on 2.03.2020.
//  Copyright © 2020 Ferhan Akkan. All rights reserved.
//

import UIKit

class CreateNavigationController {
    
    class func createNavigatonController(owner: Any) -> UINavigationController{
        let navigationController = UINavigationController()
         navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = .systemPink
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController.navigationBar.barStyle = .black
        navigationController.navigationBar.tintColor = .white
        
        
        
        let appStartPoint = Bundle.main.loadNibNamed("WelcomeController", owner: owner, options: nil)?.first as! WelcomeController
        navigationController.setViewControllers([appStartPoint], animated: true)
        return navigationController
    }
}

