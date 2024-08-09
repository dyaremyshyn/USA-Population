//
//  StateComposer.swift
//  Population
//
//  Created by Dmytro Yaremyshyn on 10/08/2024.
//

import Foundation

public final class StateComposer {
    
    private init() {}
    
    public static func stateComposedWith(stateLoader: StateDataLoader, nation: NationModel) -> StateViewController {
        let viewModel = StateViewModel(stateLoader: stateLoader, nation: nation)
        let viewController = StateViewController.makeWith(viewModel: viewModel)
        return viewController
    }
}

extension StateViewController {
    static func makeWith(viewModel: StateViewModel) -> StateViewController {
        let viewController = StateViewController()
        viewController.viewModel = viewModel
        return viewController
    }
}
