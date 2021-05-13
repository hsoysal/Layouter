//
//  LayoutAlignmentTests.swift
//  Layouter
//
//  Created by Hasan Soysal on 13.05.2021.
//

import XCTest
@testable import Layouter

class LayoutArrangementTests: XCTestCase {
    
    var window: UIWindow!
    var viewController: UIViewController!
    var view1: UIView!
    var view2: UIView!
    var view3: UIView!
    
    override func setUp() {
        super.setUp()
        window = UIWindow(frame: UIScreen.main.bounds)
        viewController =  UIViewController()
        window.rootViewController = viewController
        view1 = UIView()
        view1.backgroundColor = .orange
        view1.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(view1)
        
        view2 = UIView()
        view2.backgroundColor = .red
        view2.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(view2)
        
        view3 = UIView()
        view3.backgroundColor = .green
        view3.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(view3)
    }
    
    /// func arrangeHorizontally(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testArrangeHorizontal() {
        view1.top(offset: 100)
            .left(offset: 100)
            .size(equals: 100)
            .alignTops(with: view2, view3)
            .equalWidths(with: view2, view3)
            .equalHeights(with: view2, view3)
        
        view1.arrangeHorizontally(with: view2, view3)
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 100)
        XCTAssertEqual(view2.frame.origin.x, 200)
        XCTAssertEqual(view3.frame.origin.y, 100)
        XCTAssertEqual(view3.frame.origin.x, 300)
        
        XCTAssertEqual(view1.bounds, view2.bounds)
        XCTAssertEqual(view1.bounds, view3.bounds)
    }
    
    /// func arrangeHorizontally(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testArrangeHorizontalWithOffset() {
        view1.top(offset: 100)
            .left(offset: 100)
            .size(equals: 100)
            .alignTops(with: view2, view3)
            .equalWidths(with: view2, view3)
            .equalHeights(with: view2, view3)
        
        view1.arrangeHorizontally(with: view2, view3, constant: 20)
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 100)
        XCTAssertEqual(view2.frame.origin.x, 220)
        XCTAssertEqual(view3.frame.origin.y, 100)
        XCTAssertEqual(view3.frame.origin.x, 340)
        
        XCTAssertEqual(view1.bounds, view2.bounds)
        XCTAssertEqual(view1.bounds, view3.bounds)
    }
    
    /// func arrangeHorizontally(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testArrangeHorizontalWithOption() {
        view1.top(offset: 100)
            .left(offset: 100)
            .size(equals: 100)
            .alignTops(with: view2, view3)
            .equalWidths(with: view2, view3)
            .equalHeights(with: view2, view3)
        
        view1.arrangeHorizontally(with: view2, view3, constant: 20, option: .equal(998))
        view1.arrangeHorizontally(with: view2, view3, constant: 40, option: .equal(999))
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 100)
        XCTAssertEqual(view2.frame.origin.x, 240)
        XCTAssertEqual(view3.frame.origin.y, 100)
        XCTAssertEqual(view3.frame.origin.x, 380)
        
        XCTAssertEqual(view1.bounds, view2.bounds)
        XCTAssertEqual(view1.bounds, view3.bounds)
    }
    
    /// func arrangeHorizontally(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testArrangeHorizontalWithOptionGrater() {
        view1.top(offset: 100)
            .left(offset: 100)
            .size(equals: 100)
            .alignTops(with: view2, view3)
            .equalWidths(with: view2, view3)
            .equalHeights(with: view2, view3)
        
        view1.arrangeHorizontally(with: view2, view3, constant: 20, option: .equal(998))
        view1.arrangeHorizontally(with: view2, view3, constant: 40, option: .equalOrGrater(999))
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 100)
        XCTAssertEqual(view2.frame.origin.x, 240)
        XCTAssertEqual(view3.frame.origin.y, 100)
        XCTAssertEqual(view3.frame.origin.x, 380)
        
        XCTAssertEqual(view1.bounds, view2.bounds)
        XCTAssertEqual(view1.bounds, view3.bounds)
    }
    
    /// func arrangeHorizontally(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testArrangeHorizontalWithOptionLess() {
        view1.top(offset: 100)
            .left(offset: 100)
            .size(equals: 100)
            .alignTops(with: view2, view3)
            .equalWidths(with: view2, view3)
            .equalHeights(with: view2, view3)
        
        view1.arrangeHorizontally(with: view2, view3, constant: 40, option: .equal(998))
        view1.arrangeHorizontally(with: view2, view3, constant: 20, option: .equalOrless(999))
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 100)
        XCTAssertEqual(view2.frame.origin.x, 220)
        XCTAssertEqual(view3.frame.origin.y, 100)
        XCTAssertEqual(view3.frame.origin.x, 340)
        
        XCTAssertEqual(view1.bounds, view2.bounds)
        XCTAssertEqual(view1.bounds, view3.bounds)
    }
    
    /// func arrangeVertically(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testArrangeVertical() {
        view1.top(offset: 100)
            .left(offset: 100)
            .size(equals: 100)
            .alignLefts(with: view2, view3)
            .equalWidths(with: view2, view3)
            .equalHeights(with: view2, view3)
        
        view1.arrangeVertically(with: view2, view3)
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 200)
        XCTAssertEqual(view2.frame.origin.x, 100)
        XCTAssertEqual(view3.frame.origin.y, 300)
        XCTAssertEqual(view3.frame.origin.x, 100)
        
        XCTAssertEqual(view1.bounds, view2.bounds)
        XCTAssertEqual(view1.bounds, view3.bounds)
    }
    
    /// func arrangeVertically(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testArrangeVerticalWithOffset() {
        view1.top(offset: 100)
            .left(offset: 100)
            .size(equals: 100)
            .alignLefts(with: view2, view3)
            .equalWidths(with: view2, view3)
            .equalHeights(with: view2, view3)
        
        view1.arrangeVertically(with: view2, view3, constant: 20)
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 220)
        XCTAssertEqual(view2.frame.origin.x, 100)
        XCTAssertEqual(view3.frame.origin.y, 340)
        XCTAssertEqual(view3.frame.origin.x, 100)
        
        XCTAssertEqual(view1.bounds, view2.bounds)
        XCTAssertEqual(view1.bounds, view3.bounds)
    }
    
    /// func arrangeVertically(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testArrangeVerticalWithOption() {
        view1.top(offset: 100)
            .left(offset: 100)
            .size(equals: 100)
            .alignLefts(with: view2, view3)
            .equalWidths(with: view2, view3)
            .equalHeights(with: view2, view3)
        
        view1.arrangeVertically(with: view2, view3, constant: 20, option: .equal(998))
        view1.arrangeVertically(with: view2, view3, constant: 40, option: .equal(999))
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 240)
        XCTAssertEqual(view2.frame.origin.x, 100)
        XCTAssertEqual(view3.frame.origin.y, 380)
        XCTAssertEqual(view3.frame.origin.x, 100)
        
        XCTAssertEqual(view1.bounds, view2.bounds)
        XCTAssertEqual(view1.bounds, view3.bounds)
    }
    
    /// func arrangeVertically(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testArrangeVerticalWithOptionGrater() {
        view1.top(offset: 100)
            .left(offset: 100)
            .size(equals: 100)
            .alignLefts(with: view2, view3)
            .equalWidths(with: view2, view3)
            .equalHeights(with: view2, view3)
        
        view1.arrangeVertically(with: view2, view3, constant: 20, option: .equal(998))
        view1.arrangeVertically(with: view2, view3, constant: 40, option: .equalOrGrater(999))
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 240)
        XCTAssertEqual(view2.frame.origin.x, 100)
        XCTAssertEqual(view3.frame.origin.y, 380)
        XCTAssertEqual(view3.frame.origin.x, 100)
        
        XCTAssertEqual(view1.bounds, view2.bounds)
        XCTAssertEqual(view1.bounds, view3.bounds)
    }
    
    /// func arrangeVertically(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testArrangeVerticalWithOptionLess() {
        view1.top(offset: 100)
            .left(offset: 100)
            .size(equals: 100)
            .alignLefts(with: view2, view3)
            .equalWidths(with: view2, view3)
            .equalHeights(with: view2, view3)
        
        view1.arrangeVertically(with: view2, view3, constant: 40, option: .equal(998))
        view1.arrangeVertically(with: view2, view3, constant: 20, option: .equalOrless(999))
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 220)
        XCTAssertEqual(view2.frame.origin.x, 100)
        XCTAssertEqual(view3.frame.origin.y, 340)
        XCTAssertEqual(view3.frame.origin.x, 100)
        
        XCTAssertEqual(view1.bounds, view2.bounds)
        XCTAssertEqual(view1.bounds, view3.bounds)
    }
}
