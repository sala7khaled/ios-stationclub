//
//  AppTabBar.swift
//  stationclub
//
//  Created by Salah's iMac on 07/05/2023.
//

import UIKit

public class AppTabBar: UITabBar {
    
    let barBackground: UIColor = .appBlue
    
    private var shapeLayer: CALayer?
    
//    public override func draw(_ rect: CGRect) {
//        self.addShape()
//    }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = drawPath()
        shapeLayer.fillColor = barBackground.cgColor
        
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
    }
    
    private func drawPath() -> CGPath {
        let path = UIBezierPath()
        
        let topLeft = CGPoint(x: bounds.minX, y: bounds.minY)
        let topRight = CGPoint(x: bounds.maxX, y: bounds.minY)
        let bottomLeft = CGPoint(x: bounds.minX, y: bounds.maxY)
        let bottomRight = CGPoint(x: bounds.maxX, y: bounds.maxY)
        
        path.move(to: topLeft)
        path.addLine(to: topRight)
        path.addLine(to: bottomRight)
        path.addLine(to: bottomLeft)
        path.addLine(to: topLeft)
        
        path.close()
        return path.cgPath
    }
}
