//
//  SignatureView.swift
//  PdfDocument
//
//  Created by Aminjoni Abdullozoda on 9/8/18.
//  Copyright © 2018 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit

class SignatureView: UIView {

    var lineColor : UIColor!
    var lineWidth : CGFloat!
    var path : UIBezierPath!
    var touchPoint : CGPoint!
    var startingPoint : CGPoint!
    
    override func layoutSubviews() {
        
        clipsToBounds = true
        isMultipleTouchEnabled = false
        
        lineColor = .white
        lineWidth = 5
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        startingPoint = touch?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        touchPoint = touch?.location(in: self)
        
        path = UIBezierPath()
        path.move(to: startingPoint)
        path.addLine(to: touchPoint)
        startingPoint = touchPoint
        
        drawSignature()
    }
    
    func drawSignature ()
    {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        self.layer.addSublayer(shapeLayer)
        self.setNeedsLayout()
        
    }
    
    func cleanSignature()
    {
        self.path.removeAllPoints()
        self.layer.sublayers = nil
        self.setNeedsDisplay()
    }

}
