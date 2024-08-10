//
//  NationViewCell.swift
//  Population
//
//  Created by Dmytro Yaremyshyn on 09/08/2024.
//

import Foundation
import UIKit

class NationViewCell: UITableViewCell {

    static let identifier = String(describing: NationViewCell.self)
    
    private lazy var nationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
        
    private lazy var populationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "arrow.forward.circle"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        contentView.addSubview(nationLabel)
        contentView.addSubview(populationLabel)
        contentView.addSubview(arrowImageView)
                
        nationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        nationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        nationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        populationLabel.topAnchor.constraint(equalTo: nationLabel.bottomAnchor, constant: 8).isActive = true
        populationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        populationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        populationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        
        arrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        arrowImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        arrowImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    public func updateCell(model: NationModel?) {
        guard let model = model else { return }
        nationLabel.text = "\(model.nation ?? "") population for year: \(model.year ?? "")"
        let population = NumberFormatterHelper.numberFormatter.string(from: NSNumber(value: model.population ?? 0))
        populationLabel.text = "\(population ?? "") residents"
    }
}
