//
//  StateViewController.swift
//  Population
//
//  Created by Dmytro Yaremyshyn on 09/08/2024.
//

import UIKit
import Combine

public class StateViewController: UITableViewController {
    
    private var cancellables = Set<AnyCancellable>()
    var viewModel: StateViewModel? {
        didSet { bind() }
    }
    
    lazy var errorView: ErrorView = {
        let view = ErrorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel?.loadData()
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.sizeTableHeaderToFit()
    }

    private func bind() {
        viewModel?.$fetchedData
            .receive(on: DispatchQueue.main)
            .sink { [weak self] nations in
                guard let self else { return }
                self.tableView.reloadData()
            }
            .store(in: &cancellables)
        
        viewModel?.$errorMessage
            .receive(on: DispatchQueue.main)
            .sink { [weak self] errorMessage in
                guard let self, let message = errorMessage else { return }
                self.display(errorMessage: message)
            }
            .store(in: &cancellables)
    }

    private func setupView() {
        title = viewModel?.title
        view.backgroundColor = .systemBackground
        
        tableView.register(StateViewCell.self, forCellReuseIdentifier: StateViewCell.identifier)
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableHeaderView = errorView.makeContainer()
        
        errorView.onHide = { [weak self] in
            self?.tableView.beginUpdates()
            self?.tableView.sizeTableHeaderToFit()
            self?.tableView.endUpdates()
        }
    }
}

//MARK: TableView DataSource
extension StateViewController {
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.fetchedData?.data?.count ?? 0
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StateViewCell.identifier, for: indexPath) as? StateViewCell else {
            return UITableViewCell()
        }
        cell.updateCell(model: viewModel?.fetchedData?.data?[indexPath.row])
        return cell
    }
}

//MARK: Display Weather Error protocol
extension StateViewController: ErrorViewDelegate {
    // Displaying error message in the header table view
    public func display(errorMessage: String?) {
        errorView.message = errorMessage
        if errorMessage != nil {
            tableView.reloadData()
        }
    }
}
