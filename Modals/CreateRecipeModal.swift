//
//  CreateRecipeModal.swift
//  MozGrill
//
//  Created by Keven Goncalves on 15/10/23.
//

import SwiftUI

struct CreateRecipeModal: View {
    
    
    @State private var category = ""
    @State private var desc: String = ""
    @State private var directions: String = ""
    @State private var duration: String = ""
    @State private var favorite: Bool = false
    @State private var igredients: String = ""
    @State private var imageUrl: String = ""
    @State private var name: String = ""
    
    
    @State private var navigateToRecipe = false
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var managedObjectContext

    
    var body: some View {
        NavigationStack{
            VStack{
                
                Image(systemName: "photo")
                    .foregroundColor(.accentColor)
                    .font(.system(size: 60))
                    .padding([.top,.bottom],40)
                    .frame(maxWidth: .infinity)
                
                Form{
                    
                    Section(header: Text("Nome")
                        .foregroundColor(.accentColor)
                        .bold()
                    ){
                        TextField("Nome", text: $name)
                    }
                    
                    Section(header: Text("Categoria")
                        .foregroundColor(.accentColor)
                        .bold()
                    ){
                        Picker("Categoria", selection: $category) {
                            Text("Pequeno Almoco").tag("Pequeno Almoco")
                            Text("Sobre Mesa").tag("Sobre Mesa")
                            Text("Bebida").tag("Bebida")
                            Text("Lanche").tag("Lanche")
                            Text("Refeicao").tag("Refeicao")
                        }
                    }
                    
                    Section(header: Text("Duração")
                        .foregroundColor(.accentColor)
                        .bold()
                    ){
                        TextEditor(text: $duration)
                    }
                    
                    Section(header: Text("Descrição")
                        .foregroundColor(.accentColor)
                        .bold()
                    ){
                        TextEditor(text: $desc)
                    }
                    
                    Section(header: Text("Igredientes")
                        .foregroundColor(.accentColor)
                        .bold()
                    ){
                        TextEditor(text: $igredients)
                        
                    }
                    
                    Section(header: Text("Passos a seguir")
                        .foregroundColor(.accentColor)
                        .bold()
                    ){
                        TextEditor(text: $directions)
                    }
                }.scrollContentBackground(.hidden)
                                
            }.navigationTitle("Criar Receita")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button{
                            dismiss()
                        }
                    label: {
                        Label("Cancel", systemImage: "arrow.backward")
                            .labelStyle(.iconOnly)
                            .foregroundColor(.black)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            create(category: category, desc: desc, directions: directions, duration: Int32(duration) ?? 0, favorite: false, igredients: igredients, imageUrl: "", name: name)
                            dismiss()
                        }
                        label: {
                            Label("Create", systemImage: "checkmark")
                                .labelStyle(.iconOnly)
                                .foregroundColor(.accentColor)
                        }
                }
            }
        }
    }
    
    func create(category: String, desc: String, directions: String, duration:Int32, favorite: Bool, igredients: String, imageUrl: String, name:String){
        DataController().createRecipe(name: name, desc: desc, duration: duration, category: category, ingredients: igredients, directions: directions, favorite: favorite, imageUrl: imageUrl, context:managedObjectContext )
        
    }
    
}

struct CreateRecipeModal_Previews: PreviewProvider {
    static var previews: some View {
        CreateRecipeModal()
    }
}
