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
    
    // Combine Method
//    init () {
////        service.getMenuItem()
//        getMenuItems()
//    }
//    
//    func getMenuItems() {
//        
//        isLoading = true
//        service.getMenuItem()
//            .receive(on: DispatchQueue.main)
//            .sink { completion in
//                switch completion {
//                case .finished:
//                    print("successFully fteched the Data")
//                    self.isLoading = false
//                case .failure(let error):
//                    print(error.localizedDescription)
//                    self.isLoading = false
//                    self.errorMessage = error.localizedDescription
//                
//                }
//            } receiveValue: { [weak self] menuItems in
//                print("Recived Value: \(menuItems.count)")
//                print(menuItems.first?.appetizerName ?? "No data ")
//                self?.menuItems = menuItems
//            }
//            .store(in: &cancellables)
//    }
    
    func currencyFormatter(number:Double)->String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = .current
        return numberFormatter.string(from: NSNumber(value: number)) ?? "₹0.00"
        
    }
    
}
