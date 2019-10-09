//
//  HomeCoordinator.swift
//  Catass
//
//  Created by Serhat Sezer on 07/10/2019.
//  Copyright © 2019 Serhat Sezer. All rights reserved.
//

import Foundation

class HomeCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: CoordinatedNavigationCoordinator
    
    private lazy var homeViewController: CatHomeViewController = {
        let vc = CatHomeViewController()
        vc.coordinator = self
        return vc
    }()
    
    required init(navigationController: CoordinatedNavigationCoordinator = CoordinatedNavigationCoordinator()) {
        self.navigationController = navigationController
        navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func start() {
        navigationController.pushViewController(self.homeViewController, animated: false)
    }
    
    func didTapCatRow(with cat: Cat) {
        let catDetailCoordinator = CatDetailCoordinator(navigationController: navigationController)
        catDetailCoordinator.start()
        addChildCoordinator(catDetailCoordinator)
        catDetailCoordinator.flowCompleted = { [weak self] in
            self?.removeChildCoordinator(catDetailCoordinator)
        }
    }
}
