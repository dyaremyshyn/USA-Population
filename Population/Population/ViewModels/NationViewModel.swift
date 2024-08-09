//
//  NationViewModel.swift
//  Population
//
//  Created by Dmytro Yaremyshyn on 09/08/2024.
//

import Foundation
import Combine

class NationViewModel: ObservableObject {
    @Published var fetchedNation: NationResponse?
    @Published var errorMessage: String? = nil
    private var cancellables = Set<AnyCancellable>()
    
    private let nationLoader: NationDataLoader
    private let selection: (NationModel) -> Void

    init(nationLoader: NationDataLoader, selection: @escaping (NationModel) -> Void) {
        self.nationLoader = nationLoader
        self.selection = selection
    }
    
    public var title: String {
        "Population Per Year"
    }

    public func loadData() {
        guard let url = URL(string: APIHelper.nationUrl) else { return }
        nationLoader.loadData(from: url)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished: ()
                }
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.errorMessage = nil
                self.fetchedNation = response
            }
            .store(in: &cancellables)
    }
    
    public func selected(nation: NationModel) {
        selection(nation)
    }
}

