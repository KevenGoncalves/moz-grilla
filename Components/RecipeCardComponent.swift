//
//  RecipeCardComponent.swift
//  MozGrill
//
//  Created by Keven Goncalves on 15/10/23.
//

import SwiftUI

struct RecipeCardComponent: View {
    var recipe: RecipeFood
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: recipe.imageUrl ?? "")) {
                image in image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40,height: 40,alignment: .center)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .background(Color.gray.opacity(0.1))
            .frame(width: 160, height: 170)
            .cornerRadius(15)
            .padding(.top)
            
            HStack{
                Label(recipe.category ?? "", systemImage: "fork.knife")
                    .frame(maxWidth: 90)
                    .font(.caption2)
                    .foregroundColor(.gray)
                Spacer()
            }
            
            HStack{
                Text(recipe.name ?? "").frame(maxWidth: 100).bold().font(.headline)
                Spacer()
            }
            
        }
        .frame(width: 165,height: 240,alignment: .top)
        .cornerRadius(20)
        
    }
}

//struct RecipeCardComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeCardComponent()
//    }
//}
