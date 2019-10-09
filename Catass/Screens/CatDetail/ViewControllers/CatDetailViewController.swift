//
//  CatDetailViewController.swift
//  Catass
//
//  Created by Serhat Sezer on 07/10/2019.
//  Copyright © 2019 Serhat Sezer. All rights reserved.
//

import UIKit

class CatDetailViewController: UIViewController {
    
    /// Views
    private lazy var catDetailView: CatDetailView = {
        let view = CatDetailView(frame: .zero)
        return view
    }()
    
    /// Dependencies
    var coordinator: CatDetailCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

private extension CatDetailViewController {
    func setupUI() {
        view.addSubview(catDetailView)
        configureLayout()
    }
    
    func configureLayout() {
        catDetailView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            catDetailView.topAnchor.constraint(equalTo: view.topAnchor),
            catDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            catDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            catDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}
