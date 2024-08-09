//
//  NationViewController.swift
//  Population
//
//  Created by Dmytro Yaremyshyn on 09/08/2024.
//

import UIKit
import Combine

public class NationViewController: UITableViewController {

    private var cancellables = Set<AnyCancellable>()
    var viewModel: NationViewModel? {
        didSet { bind() }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel?.loadData()
    }

    private func bind() {
        viewModel?.$fetchedNation
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
                print(message)
            }
            .store(in: &cancellables)
    }

    private func setupView() {
        title = viewModel?.title
        view.backgroundColor = .systemBackground
        
        tableView.register(NationViewCell.self, forCellReuseIdentifier: NationViewCell.identifier)
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
    }
}

//MARK: TableView DataSource
extension NationViewController {
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.fetchedNation?.data?.count ?? 0
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NationViewCell.identifier, for: indexPath) as? NationViewCell else {
            return UITableViewCell()
        }
        cell.updateCell(model: viewModel?.fetchedNation?.data?[indexPath.row])
        return cell
    }

    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedNation = viewModel?.fetchedNation?.data?[indexPath.row] else { return }
        viewModel?.selected(nation: selectedNation)
    }
}
