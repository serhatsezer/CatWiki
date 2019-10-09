//
//  AppDelegate.swift
//  Catass
//
//  Created by Serhat Sezer on 07/10/2019.
//  Copyright © 2019 Serhat Sezer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    fileprivate var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureHomeCoordinator(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
}

private extension AppDelegate {
    func configureHomeCoordinator(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.backgroundColor = .white
        appCoordinator = AppCoordinator(window!)
        appCoordinator!.start()
    }
}
