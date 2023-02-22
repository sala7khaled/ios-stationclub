//
//  DocumentsPicker.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit
import MobileCoreServices

protocol DocumentsPickerDelegate: AnyObject {
    func didSelectFile(selectedFile file: LocalFile?)
}

class DocumentsPicker: NSObject {
    
    static let shared = DocumentsPicker()
    var delegate: DocumentsPickerDelegate?

    var documentPicker: UIDocumentPickerViewController!
    
    func importFile(in vc: UIViewController, documentTypes: [String]) {
        documentPicker = UIDocumentPickerViewController(documentTypes: documentTypes, in: .import)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        vc.present(documentPicker, animated: true, completion: nil)
    }
}

extension DocumentsPicker: UIDocumentPickerDelegate, UINavigationControllerDelegate {
    
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let fileURL = urls.first else {
            self.delegate?.didSelectFile(selectedFile: nil)
            return
        }
        
        var file: LocalFile = LocalFile(url: fileURL)
        
        if let fileName = fileURL.absoluteString.split(separator: "/").last {
            file.name = "\(fileName)"
        } else {
            file.name = UUID().uuidString
        }
        
        var fileSize = 0.0
        try? fileSize = (fileURL.resourceValues(forKeys: [URLResourceKey.fileSizeKey]).allValues.first?.value as! Double?)!
        
        if (fileSize / (1024 * 1024)).rounded() > 0.0 {
            file.size = "\((fileSize / (1024 * 1024)).rounded()) \(DocumentSizes.MB)"
        } else {
            file.size = "\((fileSize / (1024)).rounded()) \(DocumentSizes.KB)"
        }
        
        self.delegate?.didSelectFile(selectedFile: file)
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        Console.log("DocumentsManager", "Picker was cancelled")
    }
}

