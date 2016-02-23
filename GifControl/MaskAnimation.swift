//
//  MaskAnimation.swift
//  GifControl
//
//  Created by 臧其龙 on 16/2/23.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

import UIKit

class MaskAnimation: UIView {
    
    private let kImageViewWidth:CGFloat = 104.0
    private let kImageViewHeight:CGFloat = 157.0
    
    private var isAnimating:Bool = false
    
    let maskLayer = CAShapeLayer()
    
    let foregroundImageView = UIImageView(image: UIImage(named: "group2"))
    let backgroundImageView = UIImageView(image: UIImage(named: "group1"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        maskLayer.path = UIBezierPath(rect: frame).CGPath
        
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: kImageViewWidth, height: kImageViewHeight)
        self.addSubview(backgroundImageView)
        
        foregroundImageView.frame = CGRect(x: 0, y: 0, width: kImageViewWidth, height: kImageViewHeight)
        foregroundImageView.layer.mask = maskLayer
        self.addSubview(foregroundImageView)
        
    }
    
    func startFillAnimation() {
        
        isAnimating = true
        let fromPath = UIBezierPath(rect: self.bounds).CGPath
        let toPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: kImageViewWidth, height: 0))
        maskLayer.path = fromPath
        maskLayer.speed = 1
        maskLayer.removeAllAnimations()
        let basicAnimation = CABasicAnimation(keyPath: "path")
        basicAnimation.fromValue = fromPath
        basicAnimation.toValue = toPath
        basicAnimation.duration = 5
        maskLayer.addAnimation(basicAnimation, forKey: "pathAnimation")
        maskLayer.path = toPath.CGPath
    }
    
    func pauseFillAnimation() {
        isAnimating = false
        let pausedTime = maskLayer.convertTime(CACurrentMediaTime(), fromLayer: nil)
        maskLayer.speed = 0
        maskLayer.timeOffset = pausedTime
    }
    
    func resumeFillAnimation() {
        if isAnimating {return}
        isAnimating = true
        let pausedTime = maskLayer.timeOffset
        maskLayer.speed = 1.0
        maskLayer.timeOffset = 0
        maskLayer.beginTime = 0
        let timeSincePause = maskLayer.convertTime(CACurrentMediaTime(), fromLayer: nil) - pausedTime
        maskLayer.beginTime = timeSincePause
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}
