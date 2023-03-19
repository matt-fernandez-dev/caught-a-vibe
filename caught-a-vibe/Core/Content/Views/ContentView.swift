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
    
    @State private var isSideBarOpened = false

    var body: some View {
        
        Group {
            if session.loggedUser != nil {
                ZStack{
                    HomeMapView()
                    SideMenu(isSidebarVisible: $isSideBarOpened)
                }
            }
            else {
                NavigationView {
                    LoginView()
                }
            }
    }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
