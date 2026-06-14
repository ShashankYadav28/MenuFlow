//
//  Menu.swift
//  MenuFlow
//
//  Created by Shashank Yadav on 13/06/26.
//

import Foundation
//import co

struct MenuItem:Identifiable, Codable {
    
    let id:Int
    let appetizerName:String
    let foodDescription:String
    let price:Double
    let calories:Int
    let protein:Int
    let carbs:Int
    let image:String
    
    enum CodingKeys:String,CodingKey {
        
        case id
        case price
        case calories
        case protein
        case carbs
        case appetizerName = "name"
        case foodDescription = "description"
        case image = "imageURL"
        
    }
    
}
