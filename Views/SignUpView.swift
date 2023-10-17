//
//  SignUpView.swift
//  MozGrill
//
//  Created by Keven Goncalves on 17/10/23.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var email:String = ""
    @State private var password: String = ""
    @State private var name: String = ""
    
    var body: some View {
        NavigationStack{
            
            ZStack{
                Color.accentColor.ignoresSafeArea()
                Circle()
                    .scale(2)
                    .foregroundColor(.white.opacity(0.15))
                
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white)
                
                
                Spacer()
                VStack(alignment:.center){
                    HStack{
                        VStack(alignment:.leading){
                            Text("Bem Vindo a ")
                                .font(.title)
                                .bold()
                            
                            Text("MozGrill")
                                .font(.title)
                                .bold()
                                .foregroundColor(.accentColor)
                        }
                        Spacer()
                        Image(systemName: "fork.knife.circle")
                            .font(.system(size: 40))
                            .foregroundColor(.accentColor)
                    }
                    .padding(.horizontal,40)
                    
                    Form{
                        Section {
                            TextField("Email", text: $email)
                        } header: {
                            Text("Email")
                                .bold()
                                .foregroundColor(.accentColor)
                        }
                        
                        Section {
                            TextField("Nome", text: $name)
                        } header: {
                            Text("Nome")
                                .bold()
                                .foregroundColor(.accentColor)
                        }
                        
                        Section{
                            SecureField("Password", text: $password)
                        } header: {
                            Text("Password")
                                .bold()
                                .foregroundColor(.accentColor)
                        }
                        
                        VStack(alignment:.center){
                            Button{
                               register(name: name, email: email, password: password)
                            }label: {
                                Text("Cadastrar").bold()
                            }
                            .padding()
                            .padding(.horizontal,85)
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .cornerRadius(15)
                        }
                        
                        
                        VStack(alignment:.center){
                            NavigationLink{
                                LoginView()
                            }label: {
                                Text("Entrar").bold()
                            }
                            .padding()
                            .padding(.horizontal,90)
                            .cornerRadius(15)
                            .foregroundColor(.black)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .scrollDisabled(true)
                    .padding(.horizontal,20)
                    .frame(height:480)
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func register(name:String, email:String, password:String){
        DataController().createUser(name: name.lowercased(), email: email.lowercased(), password: password, context: managedObjectContext)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
