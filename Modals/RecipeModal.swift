//
//  RecipeModal.swift
//  MozGrill
//
//  Created by Keven Goncalves on 15/10/23.
//

import SwiftUI

struct RecipeModal: View {
    @State private var isMenuOpen = false
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var managedObjectContext
    var recipe: RecipeFood

    
    var body: some View {
        NavigationStack{
            ScrollView {
                AsyncImage(url: URL(string: recipe.imageUrl ?? "")) {
                    image in image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100,height: 100,alignment: .center)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .background(Color.gray.opacity(0.1))
                .frame(height:300)
                
                VStack(spacing:20){
                    
                    HStack{
                        
                        VStack(alignment: .leading){
                            
                            HStack() {
                                Text("Nome")
                                    .foregroundColor(.accentColor)
                                    .bold()
                                Spacer()
                            }.padding(.top)
                            
                            HStack() {
                                Text(recipe.name ?? "").font(.title2).bold()
                                Spacer()
                            }
                        }
                        
                        Image(systemName: recipe.favorite ? "star.fill" : "star").font(.title2)
                    }
                    
                    
                    HStack(spacing:100){
                        
                        VStack(alignment: .leading){
                            HStack() {
                                Image(systemName: "clock")
                                    .foregroundColor(.accentColor)
                                Text("Duração")
                                    .foregroundColor(.accentColor)
                                    .bold()
                                Spacer()
                            }.padding(.top)
                            
                            HStack() {
                                Text("\(recipe.duration) mins").font(.title2).bold()
                                Spacer()
                            }
                        }
                        
                        VStack(alignment: .leading){
                            HStack() {
                                Image(systemName: "basket")
                                    .foregroundColor(.accentColor)
                                Text("Tipo")
                                    .foregroundColor(.accentColor)
                                    .bold()
                                Spacer()
                            }.padding(.top)
                            
                            HStack() {
                                Text(recipe.category ?? "").font(.title2).bold()
                                Spacer()
                            }
                        }
                    }
                    
                    VStack(alignment: .leading){
                        HStack() {
                            Text(recipe.desc ?? "")
                                .foregroundColor(.gray)
                                .bold()
                                .font(.headline)
                            Spacer()
                        }.padding(.top)
                        
                    }
                    
                    VStack(alignment: .leading){
                        HStack() {
                            Text("Igredientes")
                                .foregroundColor(.accentColor)
                                .bold()
                            Spacer()
                        }.padding(.top)
                        
                        HStack() {
                            Text(recipe.igredients ?? "").font(.headline)
                            Spacer()
                        }
                    }
                    
                    VStack(alignment: .leading){
                        HStack() {
                            Text("Modo de Preparar")
                                .foregroundColor(.accentColor)
                                .bold()
                            Spacer()
                        }.padding(.top)
                        
                        HStack() {
                            Text(recipe.directions ?? "").font(.headline)
                            Spacer()
                        }
                    }
                    
                }
                .padding(.horizontal)
                .frame(maxWidth: 380)
            }
            .ignoresSafeArea(.container,edges: .top)
            .navigationTitle(recipe.name ?? "")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        dismiss()
                    }label: {
                        Label("Cancel", systemImage: "arrow.backward")
                            .labelStyle(.iconOnly)
                            .foregroundColor(.black)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button {
                            favoritar(recipe: recipe,
                                      category: recipe.category!,
                                      desc: recipe.desc!,
                                      directions: recipe.directions!,
                                      duration: recipe.duration,
                                      favorite: !recipe.favorite,
                                      igredients: recipe.igredients!,
                                      imageUrl: recipe.imageUrl!,
                                      name: recipe.name!)
                            print("work")
                        }label: {
                            Label("Favoritar", systemImage: "star")
                                .foregroundColor(.black)
                        }
                        
                        Button {
                            apagar(recipe: recipe)
                            print("deleted")
                        }label: {
                            Label("Apagar", systemImage: "trash")
                                .foregroundColor(.black)
                        }
                        
                    } label: {
                        Label("Menu", systemImage: "list.bullet")
                            .labelStyle(.iconOnly)
                            .foregroundColor(.black)
                    }
                    .onTapGesture {
                        isMenuOpen.toggle()
                    }
                }
            }
        }
        
    }
    
    func favoritar(recipe: RecipeFood, category: String, desc: String, directions: String, duration:Int32, favorite: Bool, igredients: String, imageUrl: String, name:String){
        DataController().editRecipe(recipe: recipe, name: name, desc: desc, duration: duration, category: category, ingredients: igredients, directions: directions, favorite: favorite, imageUrl: imageUrl, context:managedObjectContext )
        
    }
    
    func apagar(recipe: RecipeFood){
        DataController().deleteRecipe(recipe: recipe, context: managedObjectContext)
    }
}
//
//struct RecipeModal_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeModal()
//    }
//}
