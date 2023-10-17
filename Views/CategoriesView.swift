//
//  CategoriesView.swift
//  MozGrill
//
//  Created by Keven Goncalves on 15/10/23.
//

import SwiftUI

struct CategoriesView: View {
    var user : User?
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading){
                TopBarComponent(title: "Categorias",user: user)
                
                Text("Escolha uma categoria")
                    .bold()
                    .padding(.horizontal)
                    .foregroundColor(.accentColor)
                
                ScrollView{
                    CategoryList()
                }
            }
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
