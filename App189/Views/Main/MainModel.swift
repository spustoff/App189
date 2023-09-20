//
//  MainModel.swift
//  App189
//
//  Created by IGOR on 09/09/2023.
//

import SwiftUI

struct MainModel: Identifiable, Equatable {
    
    var id = UUID().uuidString
    
    var title: String
    var color: Color
}
