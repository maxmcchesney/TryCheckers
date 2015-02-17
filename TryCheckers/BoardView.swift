//
//  BoardView.swift
//  TryCheckers
//
//  Created by Michael McChesney on 2/16/15.
//  Copyright (c) 2015 Max McChesney. All rights reserved.
//

import UIKit

@IBDesignable class BoardView: UIView {
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {

        let ctx = UIGraphicsGetCurrentContext()
    
        //set up board
        
        let screenWidth = self.bounds.width
        let screenHeight = self.bounds.height
        
        let margin: CGFloat = 6
        let squareMargin: CGFloat = -3
        
        let width = Double(screenWidth - margin) / Double(GRID_WIDTH)
        let height = Double(screenWidth - margin) / Double(GRID_WIDTH)

        let color1 = UIColor(red:0.15, green:0.16, blue:0.13, alpha:1) // blackish
        let color2 = UIColor.redColor() // red
        
//        let color1 = UIColor.whiteColor()
//        let color2 = UIColor(red:0.36, green:0.72, blue:0.37, alpha:1) // green
        
        for y in 0..<GRID_HEIGHT {
            // alternate colors for rows
            var currentColor: UIColor?
            if y % 2 == 0 {
                currentColor = color1
            } else {
                currentColor = color2
            }
        
            for x in 0..<GRID_WIDTH {
                // alternate colors for columns

                if currentColor == color1 {
                    currentColor = color2
                } else {
                    currentColor = color1
                }

                currentColor?.set()
                
                var square = CGRectMake(CGFloat(Double(x) * width) + (margin / 2), CGFloat(Double(y) * height) + (margin / 2), CGFloat(width) - squareMargin, CGFloat(height) - squareMargin)

//                CGContextFillRect(ctx, CGRectMake(CGFloat(Double(x) * width) + (margin / 2), CGFloat(Double(y) * height) + (margin / 2), CGFloat(width), CGFloat(height)))
                
                CGContextFillEllipseInRect(ctx, square)
                
            }
                
            
    
        }
    
    
    
    }
    

}
