//
//  ContentView.swift
//  caught-a-vibe
//
//  Created by Matthew Fernandez on 3/13/23.
//

import SwiftUI
import Firebase

struct ContentView: View {

    @EnvironmentObject var session: SessionManager

    var body: some View {
        
        Group {
            if session.loggedUser != nil {
                HomeMapView()
            }
            else {
                NavigationView {
                    LoginView()
                }
            }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
