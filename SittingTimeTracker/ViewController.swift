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
    
  @IBOutlet weak var displayText: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()
    (UIApplication.shared.delegate as! AppDelegate).mainVC = self
  }

}

