//
//  HomeMapViewRepresentable.swift
//  caught-a-vibe
//
//  Created by Matthew Fernandez on 3/13/23.
//

import SwiftUI
import MapKit

struct HomeMapViewRepresentable: UIViewRepresentable {
    
    let mapView = MKMapView()
    
    func makeUIView(context: Context) -> some UIView {
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension HomeMapViewRepresentable {
    
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent: HomeMapViewRepresentable
        
        init(parent: HomeMapViewRepresentable) {
            self.parent = parent
            super.init()
        }
    }
    
    
}
