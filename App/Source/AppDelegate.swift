//
//  AppDelegate.swift
//  App
//
//  Created by Corbin Montague on 5/18/21.
//

import Core
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // setup our root view controller
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = self.window {
            let displayName = Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
            let brand: Brand = displayName == "Lightside" ? .lightside : .darkside
            window.rootViewController = ViewController(brand: brand,
                                                       localize: ConcreteLocalize(brand: brand))
            window.makeKeyAndVisible()
        }
        
        return true
    }

}

