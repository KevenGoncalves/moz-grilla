//
//  ProfileModal.swift
//  MozGrill
//
//  Created by Keven Goncalves on 15/10/23.
//

import SwiftUI

struct ProfileModal: View {
    @Environment(\.dismiss) var dismiss
    var user : User?
    
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading){
                Image(systemName: "person.fill")
                    .foregroundColor(.accentColor)
                    .font(.system(size: 100))
                    .padding(.top,100)
                    .frame(maxWidth: .infinity)
                
                VStack{
                    VStack(alignment:.leading){
                        Text("Nome")
                            .foregroundColor(.accentColor)
                            .font(.title3)
                        Text(user?.name ?? "Keven Goncalves")
                            .font(.title3).bold()
                    }
                }
                    .padding([.leading,.trailing],20)
                    .padding(.top,40)
                    .frame(width: 320,alignment: .leading)
                
                VStack{
                    VStack(alignment:.leading){
                        Text("Email")
                            .foregroundColor(.accentColor)
                            .font(.title3)
                        Text(user?.email ?? "keven@gmail.com")
                            .foregroundColor(.black)
                            .font(.title3).bold()
                    }
                }
                .padding([.leading,.trailing],20)
                .padding(.top,40)
                .frame(width: 320,alignment: .leading)
                
                VStack{
                    VStack(alignment:.leading){
                        Text("Password")
                            .foregroundColor(.accentColor)
                            .font(.title3)
                        Text(user?.password ?? "****")
                            .foregroundColor(.black)
                            .font(.title3).bold()
                    }
                }
                .padding([.leading,.trailing],20)
                .padding(.top,40)
                .frame(width: 320,alignment: .leading)
                
                Spacer()
                Spacer()
                
            }
            .navigationTitle("Meu Perfil")
            .navigationBarTitleDisplayMode(.inline)
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
            }
        }
    }
}

struct ProfileModal_Previews: PreviewProvider {
    static var previews: some View {
        ProfileModal()
    }
}
