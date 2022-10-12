//
//  ColorManager.swift
//  Lesson7_2
//
//  Created by Donatas on 9.10.22.
//

import Foundation
import UIKit

class ColorManager {
    
    static let shared  = ColorManager()
    private init() {}
    
    //custom class preffered insted of tuples
    //funcs naming to be fixed
    
    private let colors: [(UIColor, String)] = [(.red, "Red"), (.blue, "Blue"), (.cyan, "Cyan"), (.green, "Green" ), (.orange, "Orange"), (.purple, "Purple"), (.brown, "Brown")]
    
    func randomColor() -> (UIColor, String) {
        var color: (UIColor, String)
        color = colors.randomElement() ?? (.black, "Black")
        return color
    }
    
    func ColorsAndNames() -> (UIColor, String) {
        let tempTuple = self.randomColor()
        let color = tempTuple.0
        let name = tempTuple.1
        return (color, name)
    }

}
