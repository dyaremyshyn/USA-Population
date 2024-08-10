//
//  StateViewModel.swift
//  Population
//
//  Created by Dmytro Yaremyshyn on 09/08/2024.
//

import Foundation
import Combine

class StateViewModel: ObservableObject {
    @Published var nation: NationModel?
    @Published var fetchedData: StateResponse?
    @Published var errorMessage: String? = nil
    private var cancellables = Set<AnyCancellable>()
    
    private let stateLoader: StateDataLoader

    init(stateLoader: StateDataLoader, nation: NationModel) {
        self.nation = nation
        self.stateLoader = stateLoader
    }
    
    public var title: String {
        "Population in \(nation?.year ?? "")"
    }

    public func loadData() {
        guard let url = URL(string: APIHelper.stateUrl + (nation?.year ?? "latest")) else { return }
        stateLoader.loadData(from: url)
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
                self.fetchedData = response
            }
            .store(in: &cancellables)
    }
}
