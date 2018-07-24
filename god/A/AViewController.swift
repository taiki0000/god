//
//  AViewController.swift
//  god
//
//  Created by Yuichiro Abe on 2018/07/22.
//  Copyright © 2018 taiki. All rights reserved.
//

import UIKit

class AViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let image = UIImage(named: "ok")
        
        // Image Viewに画像を設定
        imageView.image = image
    }

}
