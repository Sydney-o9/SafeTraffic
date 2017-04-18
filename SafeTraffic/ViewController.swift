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
    @IBOutlet weak var lightNorth: UIImageView!
    @IBOutlet weak var lightWest: UIImageView!
    @IBOutlet weak var lightSouth: UIImageView!
    @IBOutlet weak var lightEast: UIImageView!
    
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
            
            lightNorth.image = UIImage(named: "Light-Green")!
            lightSouth.image = UIImage(named: "Light-Green")!
            
            lightWest.image = UIImage(named: "Light-Red")!
            lightEast.image = UIImage(named: "Light-Red")!
            
        } else {
            print("---> Stopping Simulation.")
            controlAnimationBtn.setTitle("Start", for: UIControlState.normal)
            animationRunning = false
        }
        
    }
    
    

}

