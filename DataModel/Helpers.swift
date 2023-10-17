//
//  Helpers.swift
//  MozGrill
//
//  Created by Keven Goncalves on 17/10/23.
//

import Foundation

enum RecipeCategory: String, CaseIterable, Identifiable{
    var id: String {self.rawValue}
    
    case breakfast = "Pequeno Almoco"
    case dessert = "Sobre Mesa"
    case drink = "Bebida"
    case lunch = "Lanche"
    case main = "Refeicao"
    
}
