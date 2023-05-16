//
//  AppTabBar.swift
//  stationclub
//
//  Created by Salah's iMac on 07/05/2023.
//

import UIKit

public class AppTabBar: UITabBar {
    
    private var shapeLayer: CALayer?
    
    public override func draw(_ rect: CGRect) {
        self.addShape()
    }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = drawPath()
        shapeLayer.fillColor = UIColor.appCell.cgColor
        
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
    }
    
    private func drawPath() -> CGPath {
        let path = UIBezierPath()
        
        let orcaX = bounds.width / 2
        let orcaY: CGFloat = 48.0
        
        let shapeAngle = 30.0
        let shiftCenterAngle = 45.0
        let shiftOutlineAngle = bounds.width / 4
        
        let topLeft = CGPoint(x: bounds.minX, y: bounds.minY)
        let topRight = CGPoint(x: bounds.maxX, y: bounds.minY)
        let bottomLeft = CGPoint(x: bounds.minX, y: bounds.maxY)
        let bottomRight = CGPoint(x: bounds.maxX, y: bounds.maxY)
        let orca = CGPoint(x: orcaX, y: orcaY)
        
        path.move(to: topLeft)
        
        let leftControlPoints = [
            CGPoint(x: 0 + shiftOutlineAngle, y: shapeAngle),
            CGPoint(x: orca.x - shiftCenterAngle, y: 0)
        ]
        
        path.addCurve(to: orca,
                      controlPoint1: leftControlPoints[0],
                      controlPoint2: leftControlPoints[1])
        
        let rightControlPoints = [
            CGPoint(x: orca.x + shiftCenterAngle, y: 0),
            CGPoint(x: topRight.x - shiftOutlineAngle, y: shapeAngle)
        ]
        
        path.addCurve(to: topRight,
                      controlPoint1: rightControlPoints[0],
                      controlPoint2: rightControlPoints[1])
        
        path.addLine(to: bottomRight)
        path.addLine(to: bottomLeft)
        path.addLine(to: topLeft)
        
        path.close()
        return path.cgPath
    }
}
