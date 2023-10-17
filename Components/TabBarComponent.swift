//
//  TabBarComponent.swift
//  MozGrill
//
//  Created by Keven Goncalves on 15/10/23.
//

import SwiftUI

struct TabBarComponent: View {
    var user : User?
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            TabView{
                HomeView().tabItem {
                    Label("Início", systemImage: "house")
                }
                DiscoveryView().tabItem {
                    Label("Descubra", systemImage: "magnifyingglass")
                }
                CategoriesView().tabItem{
                    Label("Categorias", systemImage:"square.fill.text.grid.1x2")
                }
                FavoritiesView().tabItem {
                    Label("Favoritos", systemImage: "star")
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TabBarComponent_Previews: PreviewProvider {
    static var previews: some View {
        TabBarComponent()
    }
}
