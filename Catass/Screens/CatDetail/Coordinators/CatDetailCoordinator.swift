//
//  CatDetailCoordinator.swift
//  Catass
//
//  Created by Serhat Sezer on 07/10/2019.
//  Copyright © 2019 Serhat Sezer. All rights reserved.
//

import Foundation
import UIKit

class CatDetailCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: CoordinatedNavigationCoordinator
    var flowCompleted: (() -> Void)?
    
    private lazy var catDetailViewController: CatDetailViewController = {
        let vc = CatDetailViewController()
        vc.coordinator = self
        return vc
    }()
    
    required init(navigationController: CoordinatedNavigationCoordinator = CoordinatedNavigationCoordinator()) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.pushViewController(self.catDetailViewController, animated: true)
    }
}
