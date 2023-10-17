//
//  ContentView.swift
//  MozGrill
//
//  Created by Keven Goncalves on 15/10/23.
//

import SwiftUI

struct ContentView: View {
    var user : User?
    var body: some View {
        TabBarComponent(user: user)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
