//
//  SmileView.swift
//  Smile
//
//  Created by Kajetan Dąbrowski on 05/11/2017.
//  Copyright © 2017 DaftMobile. All rights reserved.
//

import UIKit

class SmileView: UIView {
	weak var dataSource: SmileDataSource?
	private let faceLineWidth: CGFloat = 3

	private func drawEye(at point: CGPoint, size: CGSize, in context: CGContext) {
		let eyeRect = CGRect(origin: point, size: .zero).insetBy(dx: -size.width * 0.5, dy: -size.height * 0.5)
		let irisRect = eyeRect
						.insetBy(dx: eyeRect.width * 0.25, dy: eyeRect.height * 0.25)
						.offsetBy(dx: 0, dy: eyeRect.height * 0.15)

		context.saveGState()
		context.setFillColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
		context.fillEllipse(in: eyeRect)
		context.setFillColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
		context.fillEllipse(in: irisRect)
		context.restoreGState()
	}

	private func drawFace(rect: CGRect, in context: CGContext) {
		context.saveGState()
		context.setFillColor(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
		context.fillEllipse(in: rect)

		context.setStrokeColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
		context.setLineWidth(faceLineWidth)
		context.strokeEllipse(in: rect)
		context.restoreGState()
	}

	private func drawSmile(level: Float, in context: CGContext) {
		let smileVerticalOffset = bounds.height * 0.15
		let smileHorizontalOffset = bounds.width * 0.25
		let maxSmileOffset: CGFloat = bounds.height * 0.15

		let smileOffset = CGFloat(level) * maxSmileOffset
		let smileCenter = CGPoint(x: bounds.midX, y: bounds.midY + smileVerticalOffset)
		let smileLeftPoint = CGPoint(x: smileCenter.x - smileHorizontalOffset, y: smileCenter.y - smileOffset * 0.21)
		let smileRightPoint = CGPoint(x: smileCenter.x + smileHorizontalOffset, y: smileCenter.y - smileOffset * 0.21)

		let smileControlPoint = CGPoint(x: smileCenter.x, y: smileCenter.y + smileOffset)

		context.saveGState()
		context.setLineCap(.round)
		context.setStrokeColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
		context.setLineWidth(8.0)

		context.move(to: smileLeftPoint)
		context.addQuadCurve(to: smileRightPoint, control: smileControlPoint)
		context.strokePath()
		context.restoreGState()

	}

	override func draw(_ rect: CGRect) {
		guard let context = UIGraphicsGetCurrentContext() else { return }

		// Step 1: Draw face shape
		let faceRect = bounds.insetBy(dx: faceLineWidth * 0.5, dy: faceLineWidth * 0.5)
		drawFace(rect: faceRect, in: context)

		// Step 2: Draw eyes
		let eyeVerticalOffset = bounds.height * 0.14
		let eyeHorizontalOffset = bounds.width * 0.13
		let eyesCenter = CGPoint(x: bounds.midX, y: bounds.midY - eyeVerticalOffset)
		let eyeWidth: CGFloat = bounds.width * 0.11
		let eyeHeight: CGFloat = eyeWidth * 1.05
		let eyeSize = CGSize(width: eyeWidth, height: eyeHeight)
		drawEye(at: CGPoint(x: eyesCenter.x - eyeHorizontalOffset, y: eyesCenter.y), size: eyeSize, in: context)
		drawEye(at: CGPoint(x: eyesCenter.x + eyeHorizontalOffset, y: eyesCenter.y), size: eyeSize, in: context)

		// Step 3: Ignore the nose 👃

		// Step 4: Draw the smile itself
		guard let smile = dataSource?.smileLevel(for: self) else { return }
		drawSmile(level: smile, in: context)
	}
}
