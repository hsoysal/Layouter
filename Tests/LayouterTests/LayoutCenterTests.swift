//
//  LayoutCenterTests.swift
//  Layouter
//
//  Created by Hasan Soysal on 13.05.2021.
//

import XCTest
@testable import Layouter

class LayoutCenterTests: XCTestCase {
    
    var window: UIWindow!
    var viewController: UIViewController!
    var view1: UIView!
    
    override func setUp() {
        super.setUp()
        window = UIWindow(frame: UIScreen.main.bounds)
        viewController =  UIViewController()
        window.rootViewController = viewController
        view1 = UIView()
        view1.backgroundColor = .orange
        view1.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(view1)
    }
    
    /// func centerHorizontally(offset constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func centerVertically(offset constant: CGFloat = 0, option: SizeOption = .equal(1000), location: Where = .superview) -> UIView
    func testCenter() {
        view1.size(equals: 100)
        view1.centerHorizontally()
            .centerVertically()
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view1.frame.origin.y, (viewController.view.frame.height - 100)/2)
        XCTAssertEqual(view1.frame.origin.x, (viewController.view.frame.width - 100)/2)
        XCTAssertEqual(view1.frame.width, 100)
        XCTAssertEqual(view1.frame.height, 100)
    }
    
    /// func centerHorizontally(offset constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func centerVertically(offset constant: CGFloat = 0, option: SizeOption = .equal(1000), location: Where = .superview) -> UIView
    func testCenterWithOffset() {
        view1.size(equals: 100)
        view1.centerHorizontally(offset: 100)
            .centerVertically(offset: 100)
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view1.frame.origin.y, (viewController.view.frame.height - 100)/2 + 100)
        XCTAssertEqual(view1.frame.origin.x, (viewController.view.frame.width - 100)/2 + 100)
        XCTAssertEqual(view1.frame.width, 100)
        XCTAssertEqual(view1.frame.height, 100)
    }
    
    /// func centerHorizontally(offset constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func centerVertically(offset constant: CGFloat = 0, option: SizeOption = .equal(1000), location: Where = .superview) -> UIView
    func testCenterWithOption() {
        view1.size(equals: 100)
        view1.centerHorizontally(offset: 100, option: .equal(998))
            .centerVertically(offset: 100, option: .equal(998))
        
        view1.centerHorizontally(offset: 200, option: .equal(999))
            .centerVertically(offset: 200, option: .equal(999))
        
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view1.frame.origin.y, (viewController.view.frame.height - 100)/2 + 200)
        XCTAssertEqual(view1.frame.origin.x, (viewController.view.frame.width - 100)/2 + 200)
        XCTAssertEqual(view1.frame.width, 100)
        XCTAssertEqual(view1.frame.height, 100)
    }
    
    /// func centerHorizontally(offset constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func centerVertically(offset constant: CGFloat = 0, option: SizeOption = .equal(1000), location: Where = .superview) -> UIView
    func testCenterWithOptionGrater() {
        view1.size(equals: 100)
        view1.centerHorizontally(offset: 100, option: .equal(998))
            .centerVertically(offset: 100, option: .equal(998))
        
        view1.centerHorizontally(offset: 200, option: .equalOrGrater(999))
            .centerVertically(offset: 200, option: .equalOrGrater(999))
        
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view1.frame.origin.y, (viewController.view.frame.height - 100)/2 + 200)
        XCTAssertEqual(view1.frame.origin.x, (viewController.view.frame.width - 100)/2 + 200)
        XCTAssertEqual(view1.frame.width, 100)
        XCTAssertEqual(view1.frame.height, 100)
    }
    
    /// func centerHorizontally(offset constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func centerVertically(offset constant: CGFloat = 0, option: SizeOption = .equal(1000), location: Where = .superview) -> UIView
    func testCenterWithOptionLess() {
        view1.size(equals: 100)
        view1.centerHorizontally(offset: 200, option: .equal(998))
            .centerVertically(offset: 200, option: .equal(998))
        
        view1.centerHorizontally(offset: 100, option: .equalOrless(999))
            .centerVertically(offset: 100, option: .equalOrless(999))
        
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view1.frame.origin.y, (viewController.view.frame.height - 100)/2 + 100)
        XCTAssertEqual(view1.frame.origin.x, (viewController.view.frame.width - 100)/2 + 100)
        XCTAssertEqual(view1.frame.width, 100)
        XCTAssertEqual(view1.frame.height, 100)
    }
    
    /// func centerHorizontally(offset constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func centerVertically(offset constant: CGFloat = 0, option: SizeOption = .equal(1000), location: Where = .superview) -> UIView
    func testCenterWithLocation() {
        view1.size(equals: 100)
        view1.centerHorizontally(offset: 200, option: .equal(998))
            .centerVertically(offset: 200, option: .equal(998), location: .safearea)
        
        view1.centerHorizontally(offset: 100, option: .equalOrless(999))
            .centerVertically(offset: 100, option: .equalOrless(999), location: .safearea)
        
        
        viewController.view.layoutIfNeeded()
        if #available(iOS 11.0, *) {
            XCTAssertEqual(view1.frame.origin.y, (viewController.view.safeAreaLayoutGuide.layoutFrame.height - 100)/2 + 100)
        } else {
            XCTAssertEqual(view1.frame.origin.y, (viewController.view.frame.height - 100)/2 + 100)
        }
        XCTAssertEqual(view1.frame.origin.x, (viewController.view.frame.width - 100)/2 + 100)
        XCTAssertEqual(view1.frame.width, 100)
        XCTAssertEqual(view1.frame.height, 100)
    }
}
