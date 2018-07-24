//
//  BViewController.swift
//  god
//
//  Created by Yuichiro Abe on 2018/07/22.
//  Copyright © 2018 taiki. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // バンドルした画像ファイルを読み込み
        let image = UIImage(named: "no")
        
        // Image Viewに画像を設定
        imageView.image = image
    }
}
