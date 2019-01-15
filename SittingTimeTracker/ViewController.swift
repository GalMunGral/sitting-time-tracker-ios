//
//  ViewController.swift
//  SittingTimeTracker
//
//  Created by Wenqi He on 1/13/19.
//  Copyright © 2019 Wenqi He. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
  
  var motionManager: CMMotionManager?
  let queue = OperationQueue()
  var prevAcceleration = 0.0
  
  @IBOutlet weak var displayText: UITextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.motionManager = (UIApplication.shared.delegate as! AppDelegate).motionManager
    startQueuedUpdates() // Defined below
  }
  
  private func startQueuedUpdates() {
    guard let motionManager = motionManager else { return }
    motionManager.deviceMotionUpdateInterval = 1.0 / 60.0
    motionManager.startDeviceMotionUpdates(
      using: .xMagneticNorthZVertical, to: self.queue) { (data, err) in
      if let err = err { print("Error: \(err.localizedDescription)"); return }
      guard let data = data else { return }
      
      let acceleration = (
        data.gravity.x * data.userAcceleration.x
        + data.gravity.y * data.userAcceleration.y
        + data.gravity.z * data.userAcceleration.z
        ) / 9.81
      if (acceleration.magnitude < 0.01) { return }
      
      if (self.prevAcceleration <= 0 && acceleration > 0) {
        DispatchQueue.main.async { self.displayText.text = "아래" }
      } else if (self.prevAcceleration >= 0 && acceleration < 0) {
        DispatchQueue.main.async { self.displayText.text = "위" }
      }
      
      self.prevAcceleration = acceleration
    }
    
  }

  

}

