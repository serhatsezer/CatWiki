//
//  MainCoordinator.swift
//  Catass
//
//  Created by Serhat Sezer on 07/10/2019.
//  Copyright © 2019 Serhat Sezer. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var navigationController: CoordinatedNavigationCoordinator
    var childCoordinators: [Coordinator] = []
    
    required init(navigationController: CoordinatedNavigationCoordinator = CoordinatedNavigationCoordinator()) {
        self.navigationController = navigationController
    }
    
    convenience init(_ window: UIWindow) {
        self.init()
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
    }
    
    func start() {
        let homeCoordinator = HomeCoordinator(navigationController: self.navigationController)
        homeCoordinator.start()
       
    }
}
