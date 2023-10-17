//
//  LoginView.swift
//  MozGrill
//
//  Created by Keven Goncalves on 17/10/23.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.managedObjectContext) var managedObjectContect
    @State private var email:String = ""
    @State private var password: String = ""
    @State private var wrongPassword = 0
    @State private var wrongEmail = 0
    @State private var showNextPage = false
    @State private var userSigned: User?
    
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
                        
                        Section{
                            SecureField("Password", text: $password)
                        } header: {
                            Text("Password")
                                .bold()
                                .foregroundColor(.accentColor)
                        }
                        
                        VStack(alignment:.center){
                            Button{
                               login(email: email, password: password)
                            }label: {
                                Text("Entrar").bold()
                            }
                            .padding()
                            .padding(.horizontal,90)
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .cornerRadius(15)
                        }
                        
                        
                        VStack(alignment:.center){
                            NavigationLink{
                                SignUpView()
                            } label: {
                                Text("Cadastrar").bold()
                            }
                            .padding()
                            .padding(.horizontal,75)
                            .cornerRadius(15)
                            .foregroundColor(.black)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .scrollDisabled(true)
                    .padding(.horizontal,20)
                    .frame(height:400)
                }
                Spacer()
                
                NavigationLink(destination: ContentView(user: userSigned), isActive: $showNextPage){
                   EmptyView()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func login(email: String, password: String){
        let user = DataController().getUser(email: email.lowercased(), password: password, context: managedObjectContect)
            
        if user != nil{
            userSigned = user
            showNextPage = true
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
