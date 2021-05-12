//
//  LayoutFrameTests.swift
//  Layouter
//
//  Created by Hasan Soysal on 12.05.2021.
//

import XCTest
@testable import Layouter

class LayoutFrameTests: XCTestCase {

    var window: UIWindow!
    var viewController: UIViewController!
    var view: UIView!
    
    override func setUp() {
        super.setUp()
        window = UIWindow(frame: UIScreen.main.bounds)
        viewController =  UIViewController()
        window.rootViewController = viewController
        view = UIView()
        view.backgroundColor = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(view)
    }
    
    /// func top(offset constant: CGFloat, option: SizeOption = .equal(1000), location: Where = .superview) -> UIView
    /// func left(offset constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView
    /// func right(offset constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView
    /// func bottom(offset constant: CGFloat, option: SizeOption = .equal(1000), to location: Where = .superview) -> UIView
    func testFrameOriginWithOffset() {
        view.top(offset: 10).left(offset: 20).right(offset: 30).bottom(offset: 40)
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view.frame.origin.y, 10)
        XCTAssertEqual(view.frame.origin.x, 20)
        XCTAssertEqual(view.frame.width, viewController.view.bounds.width - 50)
        XCTAssertEqual(view.frame.height, viewController.view.bounds.height - 50)
    }
    
    /// func top(offset constant: CGFloat, option: SizeOption = .equal(1000), location: Where = .superview) -> UIView
    /// func left(offset constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView
    /// func right(offset constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView
    /// func bottom(offset constant: CGFloat, option: SizeOption = .equal(1000), to location: Where = .superview) -> UIView
    func testFrameOriginWithOption() {
        view.top(offset: 10)
            .left(offset: 20)
            .right(offset: 30)
            .bottom(offset: 40)
        
        view.top(offset: 60, option: .equal(999))
            .left(offset: 70, option: .equal(999))
            .right(offset: 80, option: .equal(999))
            .bottom(offset: 90, option: .equal(999))
        
        view.top(offset: 100, option: .equalOrGrater(998))
            .left(offset: 110, option: .equalOrGrater(998))
            .right(offset: 120, option: .equalOrGrater(998))
            .bottom(offset: 130, option: .equalOrGrater(998))
        
        view.top(offset: 140, option: .equalOrless(997))
            .left(offset: 150, option: .equalOrless(997))
            .right(offset: 160, option: .equalOrless(997))
            .bottom(offset: 170, option: .equalOrless(997))
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view.frame.origin.y, 10)
        XCTAssertEqual(view.frame.origin.x, 20)
        XCTAssertEqual(view.frame.width, viewController.view.bounds.width - 50)
        XCTAssertEqual(view.frame.height, viewController.view.bounds.height - 50)
    }
    
    /// func top(offset constant: CGFloat, option: SizeOption = .equal(1000), location: Where = .superview) -> UIView
    /// func left(offset constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView
    /// func right(offset constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView
    /// func bottom(offset constant: CGFloat, option: SizeOption = .equal(1000), to location: Where = .superview) -> UIView
    func testFrameOriginWithOptionGrater() {
        view.top(offset: 10, option: .equal(996))
            .left(offset: 20, option: .equal(996))
            .right(offset: 30, option: .equal(996))
            .bottom(offset: 40, option: .equal(996))
        
        view.top(offset: 100, option: .equalOrGrater(997))
            .left(offset: 110, option: .equalOrGrater(997))
            .right(offset: 120, option: .equalOrGrater(997))
            .bottom(offset: 130, option: .equalOrGrater(997))
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view.frame.origin.y, 100)
        XCTAssertEqual(view.frame.origin.x, 110)
        XCTAssertEqual(view.frame.width, viewController.view.bounds.width - 230)
        XCTAssertEqual(view.frame.height, viewController.view.bounds.height - 230)
    }
    
    /// func top(offset constant: CGFloat, option: SizeOption = .equal(1000), location: Where = .superview) -> UIView
    /// func left(offset constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView
    /// func right(offset constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView
    /// func bottom(offset constant: CGFloat, option: SizeOption = .equal(1000), to location: Where = .superview) -> UIView
    func testFrameOriginWithOptionLess() {
        
        view.top(offset: 100, option: .equal(996))
            .left(offset: 100, option: .equal(996))
            .right(offset: 100, option: .equal(996))
            .bottom(offset: 100, option: .equal(996))
        
        view.top(offset: 10, option: .equalOrless(997))
            .left(offset: 20, option: .equalOrless(997))
            .right(offset: 30, option: .equalOrless(997))
            .bottom(offset: 40, option: .equalOrless(997))
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view.frame.origin.y, 10)
        XCTAssertEqual(view.frame.origin.x, 20)
        XCTAssertEqual(view.frame.width, viewController.view.bounds.width - 50)
        XCTAssertEqual(view.frame.height, viewController.view.bounds.height - 50)
    }
    
    /// func top(offset constant: CGFloat, option: SizeOption = .equal(1000), location: Where = .superview) -> UIView
    /// func left(offset constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView
    /// func right(offset constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView
    /// func bottom(offset constant: CGFloat, option: SizeOption = .equal(1000), to location: Where = .superview) -> UIView
    func testFrameOriginWithLocation() {
        view.top(offset: 10, location: .safearea).left(offset: 20).right(offset: 30).bottom(offset: 40, location: .safearea)
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view.frame.origin.y, 10)
        XCTAssertEqual(view.frame.origin.x, 20)
        if #available(iOS 11.0, *) {
            XCTAssertEqual(view.frame.width, viewController.view.safeAreaLayoutGuide.layoutFrame.width - 50)
            XCTAssertEqual(view.frame.height, viewController.view.safeAreaLayoutGuide.layoutFrame.height - 50)
        } else {
            XCTAssertEqual(view.frame.width, viewController.view.frame.width - 50)
            XCTAssertEqual(view.frame.height, viewController.view.frame.height - 50)
        }
    }
    
}
