//
//  QRReaderViewController.swift
//  god
//
//  Created by Yuichiro Abe on 2018/07/22.
//  Copyright © 2018 taiki. All rights reserved.
//

import UIKit
import AVFoundation

let myWebApp: String = "https://godio.herokuapp.com/45236364573890.html"

class QRReaderViewController: UIViewController {
    @IBOutlet weak var qrReader: QRReaderView! {
        didSet {
            qrReader.delegate = self
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        if !qrReader.session.isRunning {
            qrReader.session.startRunning()
        }
    }
}

extension QRReaderViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metadata = qrReader.metadataOutput(output, didOutput: metadataObjects, from: connection) {
            // metadataにQRが読み取った値が入ってる
            // 読み取った値によって変わる処理など書いたり，どっかに値を渡したり．
            var sb: UIStoryboard?
            var vc: UIViewController?
            if myWebApp == metadata.stringValue {
                sb = UIStoryboard(name: AViewController.className, bundle: nil)
                vc = sb!.instantiateInitialViewController()
            } else {
                sb = UIStoryboard(name: BViewController.className, bundle: nil)
                vc = sb!.instantiateInitialViewController()
            }
            self.navigationController?.pushViewController(vc!, animated: true)
        } else {
            qrReader.session.startRunning()
        }
    }
}
