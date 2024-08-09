//
//  NationComposer.swift
//  Population
//
//  Created by Dmytro Yaremyshyn on 09/08/2024.
//

import Foundation

public final class NationComposer {
    
    private init() {}
    
    public static func nationComposedWith(nationLoader: NationDataLoader, selection: @escaping (NationModel) -> Void = { _ in }) -> NationViewController {
        let viewModel = NationViewModel(nationLoader: nationLoader, selection: selection)
        let viewController = NationViewController.makeWith(viewModel: viewModel)
        return viewController
    }
}

extension NationViewController {
    static func makeWith(viewModel: NationViewModel) -> NationViewController {
        let viewController = NationViewController()
        viewController.viewModel = viewModel
        return viewController
    }
}
