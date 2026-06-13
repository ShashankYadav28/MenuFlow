//
//  MenuNetworkDataService.swift
//  MenuFlow
//
//  Created by Shashank Yadav on 13/06/26.
//

import Foundation
import Combine

class MenuNetworkDataService {
    
    func getMenuItem()->AnyPublisher<[MenuItem],Error> {
        guard let url = URL(string: "https://raw.githubusercontent.com/ShashankYadav28/AppetizerData/refs/heads/main/food_items.json") else {
            return Fail<[MenuItem],Error>(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
         return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { output in
                guard let reponse = output.response as? HTTPURLResponse,
                      reponse.statusCode>=200 && reponse.statusCode<300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: [MenuItem].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
//    func getDate
}

