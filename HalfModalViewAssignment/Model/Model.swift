//
//  Model.swift
//  HalfModalViewAssignment
//
//  Created by Frimpong Anorchie II on 2021-08-21.
//

import Foundation

struct Service : Identifiable {
    var id = UUID().uuidString
    var name: String
    var category : String
    var location : String
}



