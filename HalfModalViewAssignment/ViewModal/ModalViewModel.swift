//
//  ModalViewModel.swift
//  HalfModalViewAssignment
//
//  Created by Frimpong Anorchie II on 2021-08-21.
//

import Foundation

final class ModalViewModel: ObservableObject {
    
   @Published var searchServices: [Service] = [
        Service(name: "Mario's Landscaping", category: "Landscaping", location: "Kelowna"),
        Service(name: "Kelowna's Detailers", category: "Cleaning", location: "Kelowna"),
        Service(name: "Heavy Automation", category: "Mechanics", location: "Kelowna"),
        Service(name: "Calgary Designers", category: "Home Decor", location: "Kelowna"),
        Service(name: "Harrison Home Services", category: "Home Service", location: "Kelowna")
    ]
    
}
