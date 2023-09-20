//
//  FormatTime.swift
//  App189
//
//  Created by IGOR on 11/09/2023.
//

import SwiftUI

func formatTime(time: Double) -> String {
    
    if time.isFinite {
        
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        
        return String(format: "%02d:%02d", minutes, seconds)
        
    } else {
        
        return "00:00"
    }
}
