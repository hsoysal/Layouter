//
//  LayoutSizeTests.swift
//  Layouter
//
//  Created by Hasan Soysal on 12.05.2021.
//

import XCTest
@testable import Layouter

class LayoutSizeTests: XCTestCase {
    
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
    
    /// func width(equals constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView
    /// func height(equals constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView
    func testFrameSize() {
        view1.top(offset: 10)
            .left(offset: 20)
            .width(equals: 100)
            .height(equals: 100)
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view1.frame.origin.y, 10)
        XCTAssertEqual(view1.frame.origin.x, 20)
        XCTAssertEqual(view1.frame.width, 100)
        XCTAssertEqual(view1.frame.height, 100)
    }
    
    /// func width(equals constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView
    /// func height(equals constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView
    func testFrameSizeWithOption() {
        view1.top(offset: 10)
            .left(offset: 20)
            .width(equals: 100, option: .equal(999))
            .height(equals: 100, option: .equal(999))
        
        view1.width(equals: 200, option: .equal(998))
            .height(equals: 200, option: .equal(998))
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view1.frame.origin.y, 10)
        XCTAssertEqual(view1.frame.origin.x, 20)
        XCTAssertEqual(view1.frame.width, 100)
        XCTAssertEqual(view1.frame.height, 100)
    }
    
    /// func width(equals constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView
    /// func height(equals constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView
    func testFrameSizeWithOptionGrater() {
        view1.top(offset: 10)
            .left(offset: 20)
            .width(equals: 100, option: .equal(998))
            .height(equals: 100, option: .equal(998))
        
        view1.width(equals: 200, option: .equalOrGrater(999))
            .height(equals: 200, option: .equalOrGrater(999))
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view1.frame.origin.y, 10)
        XCTAssertEqual(view1.frame.origin.x, 20)
        XCTAssertEqual(view1.frame.width, 200)
        XCTAssertEqual(view1.frame.height, 200)
    }
    
    /// func width(equals constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView
    /// func height(equals constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView
    func testFrameSizeWithOptionLess() {
        view1.top(offset: 10)
            .left(offset: 20)
            .width(equals: 200, option: .equal(998))
            .height(equals: 200, option: .equal(998))
        
        view1.width(equals: 100, option: .equalOrless(999))
            .height(equals: 100, option: .equalOrless(999))
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view1.frame.origin.y, 10)
        XCTAssertEqual(view1.frame.origin.x, 20)
        XCTAssertEqual(view1.frame.width, 100)
        XCTAssertEqual(view1.frame.height, 100)
    }
    
    /// func equalWidths(with views: UIView..., multiplier: CGFloat = 1, constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func equalHeights(with views: UIView..., multiplier: CGFloat = 1, constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testEquality() {
        view1.top(offset: 10)
            .left(offset: 20)
            .width(equals: 100)
            .height(equals: 100)
        view2.top(offset: 10)
            .left(offset: 20)
        view3.top(offset: 10)
            .left(offset: 20)
        
        view1.equalWidths(with: view2, view3)
            .equalHeights(with: view2, view3)
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view1.bounds, view2.bounds)
        XCTAssertEqual(view1.bounds, view3.bounds)
        XCTAssertEqual(view2.frame.width, 100)
        XCTAssertEqual(view2.frame.height, 100)
    }
    
    /// func equalWidths(with views: UIView..., multiplier: CGFloat = 1, constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func equalHeights(with views: UIView..., multiplier: CGFloat = 1, constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testEqualityWithMultiplier() {
        view1.top(offset: 10)
            .left(offset: 20)
            .width(equals: 100)
            .height(equals: 100)
        view2.top(offset: 10)
            .left(offset: 20)
        view3.top(offset: 10)
            .left(offset: 20)
        
        view1.equalWidths(with: view2, view3, multiplier: 2)
            .equalHeights(with: view2, view3, multiplier: 3)
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.bounds, view3.bounds)
        XCTAssertEqual(view1.bounds.width * 2, view2.bounds.width)
        XCTAssertEqual(view1.bounds.height * 3, view2.bounds.height)
        XCTAssertEqual(view2.frame.width, 200)
        XCTAssertEqual(view2.frame.height, 300)
    }
    
    /// func equalWidths(with views: UIView..., multiplier: CGFloat = 1, constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func equalHeights(with views: UIView..., multiplier: CGFloat = 1, constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testEqualityWithConstant() {
        view1.top(offset: 10)
            .left(offset: 20)
            .width(equals: 100)
            .height(equals: 100)
        view2.top(offset: 10)
            .left(offset: 20)
        view3.top(offset: 10)
            .left(offset: 20)
        
        view1.equalWidths(with: view2, view3, multiplier: 2, constant: 20)
            .equalHeights(with: view2, view3, multiplier: 3, constant: 20)
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.bounds, view3.bounds)
        XCTAssertEqual(view1.bounds.width * 2 + 20, view2.bounds.width)
        XCTAssertEqual(view1.bounds.height * 3 + 20, view2.bounds.height)
        XCTAssertEqual(view2.frame.width, 220)
        XCTAssertEqual(view2.frame.height, 320)
    }
    
    /// func equalWidths(with views: UIView..., multiplier: CGFloat = 1, constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func equalHeights(with views: UIView..., multiplier: CGFloat = 1, constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testEqualityWithOption() {
        view1.top(offset: 10)
            .left(offset: 20)
            .width(equals: 100)
            .height(equals: 100)
        view2.top(offset: 10)
            .left(offset: 20)
        view3.top(offset: 10)
            .left(offset: 20)
        
        view1.equalWidths(with: view2, view3, multiplier: 2, constant: 20, option: .equal(998))
            .equalHeights(with: view2, view3, multiplier: 3, constant: 20, option: .equal(998))
        
        view1.equalWidths(with: view2, view3, multiplier: 4, constant: 30, option: .equal(999))
            .equalHeights(with: view2, view3, multiplier: 6, constant: 30, option: .equal(999))
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.bounds, view3.bounds)
        XCTAssertEqual(view1.bounds.width * 4 + 30, view2.bounds.width)
        XCTAssertEqual(view1.bounds.height * 6 + 30, view2.bounds.height)
        XCTAssertEqual(view2.frame.width, 430)
        XCTAssertEqual(view2.frame.height, 630)
    }
    
    /// func equalWidths(with views: UIView..., multiplier: CGFloat = 1, constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func equalHeights(with views: UIView..., multiplier: CGFloat = 1, constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testEqualityWithOptionGrater() {
        view1.top(offset: 10)
            .left(offset: 20)
            .width(equals: 100)
            .height(equals: 100)
        view2.top(offset: 10)
            .left(offset: 20)
        view3.top(offset: 10)
            .left(offset: 20)
        
        view1.equalWidths(with: view2, view3, multiplier: 2, constant: 20, option: .equal(998))
            .equalHeights(with: view2, view3, multiplier: 3, constant: 20, option: .equal(998))
        
        view1.equalWidths(with: view2, view3, multiplier: 4, constant: 30, option: .equalOrGrater(999))
            .equalHeights(with: view2, view3, multiplier: 6, constant: 30, option: .equalOrGrater(999))
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.bounds, view3.bounds)
        XCTAssertEqual(view1.bounds.width * 4 + 30, view2.bounds.width)
        XCTAssertEqual(view1.bounds.height * 6 + 30, view2.bounds.height)
        XCTAssertEqual(view2.frame.width, 430)
        XCTAssertEqual(view2.frame.height, 630)
    }
    
    /// func equalWidths(with views: UIView..., multiplier: CGFloat = 1, constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func equalHeights(with views: UIView..., multiplier: CGFloat = 1, constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testEqualityWithOptionLess() {
        view1.top(offset: 10)
            .left(offset: 20)
            .width(equals: 100)
            .height(equals: 100)
        view2.top(offset: 10)
            .left(offset: 20)
        view3.top(offset: 10)
            .left(offset: 20)
        
        view1.equalWidths(with: view2, view3, multiplier: 4, constant: 20, option: .equal(998))
            .equalHeights(with: view2, view3, multiplier: 6, constant: 20, option: .equal(998))
        
        view1.equalWidths(with: view2, view3, multiplier: 2, constant: 10, option: .equalOrless(999))
            .equalHeights(with: view2, view3, multiplier: 3, constant: 10, option: .equalOrless(999))
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.bounds, view3.bounds)
        XCTAssertEqual(view1.bounds.width * 2 + 10, view2.bounds.width)
        XCTAssertEqual(view1.bounds.height * 3 + 10, view2.bounds.height)
        XCTAssertEqual(view2.frame.width, 210)
        XCTAssertEqual(view2.frame.height, 310)
    }
}
