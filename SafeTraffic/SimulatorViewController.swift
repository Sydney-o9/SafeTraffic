/**
 *  SimulatorViewController.swift
 *  SafeTraffic
 *
 *  Created by Sydney-o9 <anthony.rey21@gmail.com>
 *  Copyright © 2017 Safety Culture. All rights reserved.
 */

import UIKit

/*!
 * @brief UIView Extension, animate label up transition
 */
extension UIView {
    func pushUpTransition(_ duration:CFTimeInterval) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionPush
        animation.subtype = kCATransitionFromTop
        animation.duration = duration
        layer.add(animation, forKey: kCATransitionPush)
    }
}

class SimulatorViewController: UIViewController {
    
    @IBOutlet weak var controlAnimationBtn: UIButton!
    @IBOutlet weak var lightNorth: UIImageView!
    @IBOutlet weak var lightWest: UIImageView!
    @IBOutlet weak var lightSouth: UIImageView!
    @IBOutlet weak var lightEast: UIImageView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var counterProgressView: UIProgressView!
    
    enum Light {
        case green, yellow, red
        var image: UIImage {
            switch self {
            case .green: return UIImage(named: "Light-Green")!
            case .yellow: return UIImage(named: "Light-Yellow")!
            case .red: return UIImage(named: "Light-Red")!
            }
        }
        
    }
    
    var isAnimationRunning: Bool = false // Whether the animation is running or not
    var isNorthLightRed: Bool = false // Whether North Light is Red or not
    var currentCount:Int = 30 { // Timer running for 30 seconds
        didSet {
           UIView.animate(withDuration: 1.0, animations: { () -> Void in
                let fractionalProgress = (Float(self.currentCount) * 100.0 / 30.0) / 100.0
                self.counterProgressView.setProgress(fractionalProgress, animated: true)
            })
            counterLabel.pushUpTransition(1.0)
            counterLabel.text = ("\(currentCount)")
            
        }
    }
    
    weak var runningTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /** Start/Stop Btn */
        controlAnimationBtn.layer.borderColor = UIColor.white.cgColor
        controlAnimationBtn.layer.borderWidth = 3
        controlAnimationBtn.layer.cornerRadius = 15
        
        /** Set-up initial lights */
        lightNorth.image = Light.green.image
        lightSouth.image = Light.green.image
        lightWest.image = Light.red.image
        lightEast.image = Light.red.image
        
        /** Set-up initial counter */
        counterProgressView.setProgress(1.0, animated: true)
        counterProgressView.progressTintColor = UIColor.green
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    /*!
     * @brief When user touches Start/Stop Btn
     */
    @IBAction func onTouchControlAnimationBtn(_ sender: Any) {
        if (!isAnimationRunning) {
            startAnimation()
            controlAnimationBtn.setTitle("Stop", for: UIControlState.normal)
        } else {
            stopAnimation()
            controlAnimationBtn.setTitle("Start", for: UIControlState.normal)
        }
        isAnimationRunning = !isAnimationRunning
    }
    
    /*!
     * @brief Start the simulator
     */
    func startAnimation() {
        
        /** Start Counter */
        runningTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    /*!
     * @brief Stops the simulator
     */
    func stopAnimation() {
        
        /** Stop Counter */
        if self.isAnimationRunning == true {
            runningTimer?.invalidate()
            runningTimer = nil
        }
    }
    
    /*!
     * @brief Updates the counter
     * @param Timer
     */
    func updateCounter(timer: Timer) {
        
        self.currentCount -= 1
        if (self.currentCount == 0){
            reinitialiseCounter()
        }
        
        updateLights()

    }
    
    /*!
     * @brief Update Lights in the simulator
     */
    func updateLights(){
        
        if (self.isNorthLightRed == false && self.currentCount > 5) {
            counterProgressView.progressTintColor = UIColor.green
            
            lightNorth.image = Light.green.image
            lightSouth.image = Light.green.image
            lightWest.image = Light.red.image
            lightEast.image = Light.red.image
            
        } else if (self.isNorthLightRed == false && self.currentCount <= 5) {
            counterProgressView.progressTintColor = UIColor.yellow
            
            lightNorth.image = Light.yellow.image
            lightSouth.image = Light.yellow.image
            lightWest.image = Light.red.image
            lightEast.image = Light.red.image
            
        } else if (self.isNorthLightRed == true && self.currentCount > 5) {
            counterProgressView.progressTintColor = UIColor.red
            
            lightNorth.image = Light.red.image
            lightSouth.image = Light.red.image
            lightWest.image = Light.green.image
            lightEast.image = Light.green.image
            
        } else if (self.isNorthLightRed == true && self.currentCount <= 5) {
            
            lightNorth.image = Light.red.image
            lightSouth.image = Light.red.image
            lightWest.image = Light.yellow.image
            lightEast.image = Light.yellow.image
        }
    }
    
    /*!
     * @brief Re-initialised the counter back to 30s
     */
    func reinitialiseCounter(){
        self.isNorthLightRed = !self.isNorthLightRed
        self.currentCount = 30
        
        isNorthLightRed ? (counterProgressView.progressTintColor = UIColor.red) : (counterProgressView.progressTintColor = UIColor.green)
    }

}

