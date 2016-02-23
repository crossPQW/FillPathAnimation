//
//  ViewController.swift
//  GifControl
//
//  Created by 臧其龙 on 16/2/23.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let maskView = MaskAnimation(frame: CGRect(x: 0, y: 0, width: 104, height: 157))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.addSubview(maskView)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func startAnimation() {
        maskView.startFillAnimation()
    }
    
    @IBAction func pauseFillAnimation() {
        maskView.pauseFillAnimation()
    }
    
    @IBAction func resumeAnimation() {
        maskView.resumeFillAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

