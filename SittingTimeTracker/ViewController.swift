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
  }
  
//  private func updateUIWith(text: String) {
//    DispatchQueue.main.async {
//      self.displayText.text = text
//    }
//  }

}

