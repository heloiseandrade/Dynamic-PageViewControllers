//
//  ContentViewController.swift
//  PageView
//
//  Created by Heloise Andrade on 10/5/16.
//  Copyright © 2016 ___Heloise Andrade___. All rights reserved.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

class ContentViewController: UIViewController {
    
  
    @IBOutlet var titleLabel: UILabel!
    var pageIndex: Int!
  var titleText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         self.titleLabel.text = self.titleText
        self.view.backgroundColor = UIColor(red:   .random(),
                                            green: .random(),
                                            blue:  .random(),
                                            alpha: 1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
