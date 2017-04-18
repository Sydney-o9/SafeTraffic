/**
 *  SafeTrafficTests.swift
 *  SafeTraffic
 *
 *  Created by Sydney-o9 <anthony.rey21@gmail.com>
 *  Copyright © 2017 Safety Culture. All rights reserved.
 */

import XCTest
@testable import SafeTraffic

class SafeTrafficTests: XCTestCase {
    
    var vc: SimulatorViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        vc = storyboard.instantiateInitialViewController() as! SimulatorViewController

    }
    
    func testViewDidLoad() {
        
        let _ = vc.view
        
        /** Testing initial values Simulator */
        XCTAssert(vc.lightNorth.image == UIImage(named: "Light-Green"))
        XCTAssert(vc.lightSouth.image == UIImage(named: "Light-Green"))
        XCTAssert(vc.lightWest.image == UIImage(named: "Light-Red"))
        XCTAssert(vc.lightEast.image == UIImage(named: "Light-Red"))
        
        /** Testing initial values Counter */
        XCTAssert(vc.counterProgressView.progress == 1.0)
        XCTAssert(vc.counterProgressView.progressTintColor == UIColor.green)
    }
    
    func testOnTouchControlAnimationBtn() {
        
        let _ = vc.view
        
        XCTAssert(vc.isAnimationRunning == false)
        
        vc.controlAnimationBtn.sendActions(for: .touchUpInside)
        XCTAssert(vc.isAnimationRunning == true)
        XCTAssert(vc.controlAnimationBtn.currentTitle == "Stop")
        
        vc.controlAnimationBtn.sendActions(for: .touchUpInside);
        XCTAssert(vc.isAnimationRunning == false)
        XCTAssert(vc.controlAnimationBtn.currentTitle == "Start")
    }

    
    func testStartAnimation() {
        
        let _ = vc.view
        
        XCTAssert(vc.isAnimationRunning == false)
        vc.startAnimation()
        
    }
    
    
    override func tearDown() {
        super.tearDown()
    }
    

    
}
