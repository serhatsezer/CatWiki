//
//  HomeViewController.swift
//  Catass
//
//  Created by Serhat Sezer on 07/10/2019.
//  Copyright © 2019 Serhat Sezer. All rights reserved.
//

import UIKit
import SnapKit
import PKHUD
import RxSwift

class CatHomeViewController: UIViewController {
    
    /// States
    enum State {
        case loading
        case loaded([Cat])
        case error(String)
        case initial(String)
    }
    
    private var state: State = .initial("grumpy") {
        didSet {
            switch state {
            case .initial(let breedName):
                self.callSearch(with: breedName)
            case .loading:
                HUD.show(.progress)
            case .loaded(let cats):
                HUD.hide()
                parse(cats)
            case .error(let errorMessage):
                self.homeView.showError(with: errorMessage)
            }
        }
    }
    private var bag: DisposeBag = DisposeBag()
    
    /// Views
    private lazy var homeView: CatHomeView = {
        let view = CatHomeView(frame: .zero)
        return view
    }()
    
    /// Dependencies
    public var coordinator: HomeCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cat Wiki"
        
        // In order for to try error handling
        //self.state = .error("Something went wrong. Please try again!")
        
        // make a initial network request
        self.state = .initial("grumpy")
        
        // Observable bindings
        addObservables()
        
        // configuring UI configurations
        setupUI()
    }
}

/// UI Configuration
private extension CatHomeViewController {
    func setupUI() {
        view.addSubview(homeView)
        configureLayout()
    }
    
    func configureLayout() {
        homeView.translatesAutoresizingMaskIntoConstraints = false
        homeView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

/// Network calls etc.
private extension CatHomeViewController {
    
    func addObservables() {
        homeView
            .searchTerm
            .asObservable().subscribe(onNext: { [weak self] searchTerm in
//                self?.callSearch(with: searchTerm)
                print("searchTerm \(searchTerm)")
            })
        .disposed(by: bag)
    }
    
    func parse(_ cats: [Cat]) {
        let viewModels = cats.map(CatHomeViewModel.init)
        homeView.configureView(with: viewModels)
    }
    
    func callSearch(with breedName: String) {
        self.state = .loading
        CatAPI.search(breed: breedName).request.responseObject { [weak self] (result: Result<[Cat], Error>) in
            switch result {
            case .success(let cats):
                self?.state = .loaded(cats)
            case .failure(let error):
                self?.state = .error(error.localizedDescription)
            }
        }
    }
}
