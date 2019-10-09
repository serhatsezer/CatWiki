//
//  HomeView.swift
//  Catass
//
//  Created by Serhat Sezer on 07/10/2019.
//  Copyright © 2019 Serhat Sezer. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CatHomeView: UIView {
    /// Reactive bindings
    private let bag = DisposeBag()
    public let searchTerm: BehaviorRelay<String> = .init(value: "")
    
    /// Views
    private lazy var errorView: ErrorView = {
        let errorView = ErrorView()
        return errorView
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(CatHomeTableViewCell.self, forCellReuseIdentifier: CatHomeTableViewCell.cellReuseID)
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        addSubview(searchBar)
        addSubview(tableView)
        addSubview(errorView)
        addObservables()
        configureLayout()
    }
}

private extension CatHomeView {
    func configureLayout() {
        searchBar.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        errorView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension CatHomeView {
    private func addObservables() {
        searchBar.rx.text
            .orEmpty
            .debounce(.microseconds(5), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .filter { !$0.isEmpty}
            .subscribe(onNext: { [weak self] query in
                print("call")
                self?.searchTerm.accept(query)
            })
            .disposed(by: bag)
    }
    
    func showError(with message: String) {
        tableView.isHidden = message.count > 0
        searchBar.isHidden = message.count > 0
        errorView.showError(with: message)
    }
    
    func configureView(with cats: [CatHomeViewModel]) {
        
        let catsObservable = Observable.just(cats).asObservable()
        catsObservable.bind(to: tableView.rx.items(cellIdentifier: CatHomeTableViewCell.cellReuseID,
                                                   cellType: CatHomeTableViewCell.self)) {  row, catVM, cell in
                                                    
            cell.textLabel?.text = catVM.name
            cell.detailTextLabel?.text = catVM.detailDescription
        }.disposed(by: bag)
      
    }
}
