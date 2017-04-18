/**
 *  ViewController.swift
 *  SafeTraffic
 *
 *  Created by Sydney-o9 <anthony.rey21@gmail.com>
 *  Copyright © 2017 Safety Culture. All rights reserved.
 */

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var controlAnimationBtn: UIButton!
    
    var animationRunning: Bool = false;

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoad")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTouchControlAnimationBtn(_ sender: Any) {
        print("Touched Button")
        if (animationRunning == false) {
            print("---> Starting Simulation.")
            controlAnimationBtn.setTitle("Stop", for: UIControlState.normal)
            animationRunning = true
        } else {
            print("---> Stopping Simulation.")
            controlAnimationBtn.setTitle("Start", for: UIControlState.normal)
            animationRunning = false
        }
        
    }

}

