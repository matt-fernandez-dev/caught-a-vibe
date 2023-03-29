//
//  ContentView.swift
//  caught-a-vibe
//
//  Created by Matthew Fernandez on 3/13/23.
//

import SwiftUI
import Firebase

struct ContentView: View {

//    @EnvironmentObject var session: SessionManager
    
    @State private var isSideBarOpened = false
    
    @State private var viewToShow = "Home"

    var body: some View {
        
        Group {
            if FirebaseManager.shared.auth.currentUser != nil {
                ZStack{
                    switch viewToShow {
                    case "Home":
                        HomeMapView()
                    case "Settings":
                        SettingsView()
                    default:
                        HomeMapView()
                    }
                    
                    SideMenu(isSidebarVisible: $isSideBarOpened, viewToShow: $viewToShow)
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
