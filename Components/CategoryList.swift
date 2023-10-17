//
//  CategoryList.swift
//  MozGrill
//
//  Created by Keven Goncalves on 15/10/23.
//

import SwiftUI

struct CategoryList: View {
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 200),spacing: 10)]) {
            
            CategoryCardComponent(category: "Pequeno Almoco", categoryDisc: "Bom para comecar o dia", img: "cup.and.saucer.fill")
            CategoryCardComponent(category: "Sobre Mesa", categoryDisc: "Ideal depois de uma refeicao", img: "birthday.cake.fill")
            CategoryCardComponent(category: "Bebida", categoryDisc: "Otimo para se refrescar ou Aquecer", img: "wineglass.fill")
            CategoryCardComponent(category: "Lanche", categoryDisc: "Para matar a fome", img: "carrot.fill")
            CategoryCardComponent(category: "Refeicao", categoryDisc: "Este e o ideal para o deixar completo", img: "takeoutbag.and.cup.and.straw.fill")
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
