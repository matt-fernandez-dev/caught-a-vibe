//
//  HomeMapView.swift
//  caught-a-vibe
//
//  Created by Matthew Fernandez on 3/13/23.
//

import SwiftUI

struct HomeMapView: View {
    
    var body: some View {
        HomeMapViewRepresentable()
            .ignoresSafeArea()
        
    }
}

struct HomeMapView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMapView()
    }
}
