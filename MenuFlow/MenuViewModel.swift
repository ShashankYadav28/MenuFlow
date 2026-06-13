//
//  MenuViewModel.swift
//  MenuFlow
//
//  Created by Shashank Yadav on 13/06/26.
//

import Foundation
import Combine

class MenuViewModel:ObservableObject {
    @Published var menuItems:[MenuItem] = []
    @Published var isLoading = false
    @Published var errorMessage = ""
    private let service = MenuNetworkDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init () {
//        service.getMenuItem()
    }
    
    func getMenuItem() {
        isLoading = true
        service.getMenuItem()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                
                }
            } receiveValue: { [weak self] menuItems in
                self?.menuItems = menuItems
            }
            .store(in: &cancellables)

        
    }
    
}
