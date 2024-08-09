//
//  StateViewCell.swift
//  Population
//
//  Created by Dmytro Yaremyshyn on 10/08/2024.
//

import Foundation
import UIKit

class StateViewCell: UITableViewCell {

    static let identifier = String(describing: StateViewCell.self)
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        selectionStyle = .none
        contentView.addSubview(descriptionLabel)
                
        descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
    
    public func updateCell(model: StateModel?) {
        guard let model = model else { return }
        let population = NumberFormatterHelper.numberFormatter.string(from: NSNumber(value: model.population ?? 0))
        descriptionLabel.text = "\(model.state ?? ""): \(population?.description ?? "")"
    }
}
