//
//  ViewController.swift
//  god
//
//  Created by taiki on 2018/07/21.
//  Copyright © 2018年 taiki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func openQRReader(_ sender: Any) {
//        let vc = QRReaderViewController()
//        self.present(vc, animated: true, completion: nil)
        let sb = UIStoryboard(name: QRReaderViewController.className, bundle: nil)
        let vc = sb.instantiateInitialViewController()!
        self.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

