//
//  CloseImageGenerator.swift
//  NCMB
//
//  Translated by OOPer in cooperation with shlab.jp, on 2019/05/07
//

import UIKit


/// A class to generate an image from the drawing methods on CGContext
public class CGImageGenerator {
    
    private var width: Int
    private var height: Int
    
    var bytes: UnsafeMutableRawPointer?
    
    public init(frame: CGRect) {
        self.width = Int(frame.width)
        self.height = Int(frame.height)
    }
    
    deinit {
        bytes?.deallocate()
    }
    
    ///Please override this method
    open func draw(in contxt: CGContext) {
    }
    
    private func createContext() -> CGContext? {
        let bitsPerComponent = 8
        let bytesPerPixel = 4   //RGBA each 1-byte
        let byteCount = width * height * bytesPerPixel
        let bytes = UnsafeMutableRawPointer.allocate(byteCount: byteCount, alignment: bytesPerPixel)
        bytes.initializeMemory(as: UInt8.self, repeating: 0, count: byteCount)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo: CGBitmapInfo = [
            CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedFirst.rawValue)
        ]
        let context = CGContext(data: bytes, width: width, height: height, bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerPixel*width, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        return context
    }
    
    public func makeImage() -> CGImage? {
        guard let context: CGContext = createContext() else {return nil}
        draw(in: context)
        return context.makeImage()
    }
    
    public func makeUIImage() -> UIImage? {
        guard let cgImage = makeImage() else {return nil}
        return UIImage(cgImage: cgImage)
    }
}

class CloseImageGenerator: CGImageGenerator {
    
    private let IMAGE_SIZE: CGFloat = 15

    override func draw(in context: CGContext) {
        context.setStrokeColor(red: 1, green: 1, blue: 1, alpha: 1.0)
        context.setLineWidth(2.0)
        context.setLineCap(.butt)
        
        context.move(to: CGPoint(x: 1, y: 1))
        context.addLine(to: CGPoint(x: IMAGE_SIZE, y: IMAGE_SIZE))
        context.strokePath()
        
        context.move(to: CGPoint(x: 1, y: IMAGE_SIZE))
        context.addLine(to: CGPoint(x: IMAGE_SIZE, y: 1))
        context.strokePath()
    }
}
