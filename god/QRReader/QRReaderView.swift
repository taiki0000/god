//
//  QRReaderView.swift
//  god
//
//  Created by Yuichiro Abe on 2018/07/22.
//  Copyright © 2018 taiki. All rights reserved.
//

import UIKit
import AVFoundation

class QRReaderView: UIView {
    public let session = AVCaptureSession()

    weak var delegate: AVCaptureMetadataOutputObjectsDelegate?
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: .video, position: .back)
        let devices = discoverySession.devices
        
        if let backCamera = devices.first {
            do {
                let deviceInput = try AVCaptureDeviceInput(device: backCamera)
                if session.canAddInput(deviceInput) {
                    session.addInput(deviceInput)
                    
                    let metadataOutput = AVCaptureMetadataOutput()
                    if session.canAddOutput(metadataOutput) {
                        session.addOutput(metadataOutput)
                        
                        metadataOutput.setMetadataObjectsDelegate(self.delegate, queue: DispatchQueue.main)
                        metadataOutput.metadataObjectTypes = [.qr]
                        
                        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
                        previewLayer.frame = self.bounds
                        previewLayer.videoGravity = .resizeAspectFill
                        self.layer.addSublayer(previewLayer)
                        
                        session.startRunning()
                    }
                }
            } catch {
                print("Error occured while creating video device input: \(error)")
            }
        }
    }
}

extension QRReaderView {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) -> AVMetadataMachineReadableCodeObject?  {
        for metadata in metadataObjects as! [AVMetadataMachineReadableCodeObject] {
            if metadata.type != .qr { continue }
            if metadata.stringValue == nil { continue }
            session.stopRunning()
            return metadata
        }
        return nil
    }
}


