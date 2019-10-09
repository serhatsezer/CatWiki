//
//  Protocols.swift
//  Catass
//
//  Created by Serhat Sezer on 07/10/2019.
//  Copyright © 2019 Serhat Sezer. All rights reserved.
//

import Foundation

protocol Coordinator: AnyObject {
    var navigationController: CoordinatedNavigationCoordinator { get set }
    var childCoordinators: [Coordinator] { get set }
    init(navigationController: CoordinatedNavigationCoordinator)
    func start()
}

extension Coordinator {
    func addChildCoordinator(_ childCoordinator: Coordinator) {
        guard !self.childCoordinators.contains(where: { $0 !== childCoordinator}) else { return }
        self.childCoordinators.append(childCoordinator)
    }
    
    func removeChildCoordinator(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === childCoordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}
