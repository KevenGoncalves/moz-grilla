//
//  TopBarComponent.swift
//  MozGrill
//
//  Created by Keven Goncalves on 15/10/23.
//

import SwiftUI

struct TopBarComponent: View {
    var title: String
    
    var user : User?
    @State private var showingUser = false
    @State private var showingCreate = false
    
    var body: some View {
        HStack{
            
            Text(title).font(.largeTitle).bold()
            
            Spacer()
            
            HStack(spacing:15){
                
                Button{
                    showingCreate.toggle()
                }label: {
                    Image(systemName: "plus")
                }
                .foregroundColor(.accentColor)
                .frame(width: 45, height: 45)
                .background(.gray.opacity(0.1))
                .cornerRadius(10)
                .sheet(isPresented: $showingCreate) {
                    CreateRecipeModal()
                }
                
                Button{
                    showingUser.toggle()
                }label: {
                    Image(systemName: "person.fill")
                }
                .foregroundColor(.accentColor)
                .frame(width: 45, height: 45)
                .background(.gray.opacity(0.1))
                .cornerRadius(10)
                .sheet(isPresented: $showingUser) {
                    ProfileModal(user:user)
                }
                
                
            }
        }.padding()
    }
}

struct TopBarComponent_Previews: PreviewProvider {
    static var previews: some View {
        TopBarComponent(title: "Bem Vindo")
    }
}
