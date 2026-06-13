//
//  Menu.swift
//  MenuFlow
//
//  Created by Shashank Yadav on 13/06/26.
//

import Foundation

struct MenuItem:Identifiable, Codable {
    
    let id:Int
    let appetizerName:String
    let foodDescription:String
    let price:Double
    let calories:Int
    let protein:Int
    let carbs:Int
    let image:String
    
    enum Codingkeys:String,CodingKey {
        case appetizerName = "name"
        case foodDescription = "description"
        case image = "imageURL"
    }
    
}
