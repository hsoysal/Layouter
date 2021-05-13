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
    }
    
    func addOtherSubviews() {
        view2 = UIView()
        view2.backgroundColor = .red
        view2.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(view2)
        
        view3 = UIView()
        view3.backgroundColor = .green
        view3.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(view3)
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
    
    /// func centerHorizontally(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testCenterHorizontal() {
        addOtherSubviews()
        view1.top(offset: 100)
            .left(offset: 100)
            .size(equals: 100)
            .equalWidths(with: view2, view3, constant: 40)
            .equalHeights(with: view2, view3)
            .arrangeVertically(with: view2, view3, constant: 20)
        
        view1.centerHorizontally(with: view2, view3)
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 220)
        XCTAssertEqual(view2.frame.origin.x, 80)
        XCTAssertEqual(view3.frame.origin.y, 340)
        XCTAssertEqual(view3.frame.origin.x, 80)
    }
    
    /// func centerHorizontally(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testCenterHorizontalWithOffset() {
        addOtherSubviews()
        view1.top(offset: 100)
            .left(offset: 100)
            .size(equals: 100)
            .equalWidths(with: view2, view3, constant: 40)
            .equalHeights(with: view2, view3)
            .arrangeVertically(with: view2, view3, constant: 20)
        
        view1.centerHorizontally(with: view2, view3, constant: 30)
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 220)
        XCTAssertEqual(view2.frame.origin.x, 110)
        XCTAssertEqual(view3.frame.origin.y, 340)
        XCTAssertEqual(view3.frame.origin.x, 110)
    }
    
    /// func centerHorizontally(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testCenterHorizontalWithOption() {
        addOtherSubviews()
        view1.top(offset: 100)
            .left(offset: 100)
            .size(equals: 100)
            .equalWidths(with: view2, view3, constant: 40)
            .equalHeights(with: view2, view3)
            .arrangeVertically(with: view2, view3, constant: 20)
        
        view1.centerHorizontally(with: view2, view3, constant: 20, option: .equal(998))
        view1.centerHorizontally(with: view2, view3, constant: 30, option: .equal(999))
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 220)
        XCTAssertEqual(view2.frame.origin.x, 110)
        XCTAssertEqual(view3.frame.origin.y, 340)
        XCTAssertEqual(view3.frame.origin.x, 110)
    }
    
    /// func centerHorizontally(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testCenterHorizontalWithOptionGrater() {
        addOtherSubviews()
        view1.top(offset: 100)
            .left(offset: 100)
            .size(equals: 100)
            .equalWidths(with: view2, view3, constant: 40)
            .equalHeights(with: view2, view3)
            .arrangeVertically(with: view2, view3, constant: 20)
        
        view1.centerHorizontally(with: view2, view3, constant: 20, option: .equal(998))
        view1.centerHorizontally(with: view2, view3, constant: 30, option: .equalOrGrater(999))
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 220)
        XCTAssertEqual(view2.frame.origin.x, 110)
        XCTAssertEqual(view3.frame.origin.y, 340)
        XCTAssertEqual(view3.frame.origin.x, 110)
    }
    
    /// func centerHorizontally(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testCenterHorizontalWithOptionLess() {
        addOtherSubviews()
        view1.top(offset: 100)
            .left(offset: 100)
            .size(equals: 100)
            .equalWidths(with: view2, view3, constant: 40)
            .equalHeights(with: view2, view3)
            .arrangeVertically(with: view2, view3, constant: 20)
        
        view1.centerHorizontally(with: view2, view3, constant: 40, option: .equal(998))
        view1.centerHorizontally(with: view2, view3, constant: 30, option: .equalOrless(999))
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 220)
        XCTAssertEqual(view2.frame.origin.x, 110)
        XCTAssertEqual(view3.frame.origin.y, 340)
        XCTAssertEqual(view3.frame.origin.x, 110)
    }
    
    /// func centerVertically(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testCenterVertical() {
        addOtherSubviews()
        view1.top(offset: 100)
            .left(offset: 100)
            .size(equals: 100)
            .equalWidths(with: view2, view3, constant: 40)
            .equalHeights(with: view2, view3)
            .arrangeHorizontally(with: view2, view3, constant: 20)
        
        view1.centerVertically(with: view2, view3)
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 100)
        XCTAssertEqual(view2.frame.origin.x, 220)
        XCTAssertEqual(view3.frame.origin.y, 100)
        XCTAssertEqual(view3.frame.origin.x, 380)
    }
    
    /// func centerVertically(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testCenterVerticalWithOffset() {
        addOtherSubviews()
        view1.top(offset: 100)
            .left(offset: 100)
            .size(equals: 100)
            .equalWidths(with: view2, view3, constant: 40)
            .equalHeights(with: view2, view3)
            .arrangeHorizontally(with: view2, view3, constant: 20)
        
        view1.centerVertically(with: view2, view3, constant: 30)
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 130)
        XCTAssertEqual(view2.frame.origin.x, 220)
        XCTAssertEqual(view3.frame.origin.y, 130)
        XCTAssertEqual(view3.frame.origin.x, 380)
    }
    
    /// func centerVertically(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testCenterVerticalWithOption() {
        addOtherSubviews()
        view1.top(offset: 100)
            .left(offset: 100)
            .size(equals: 100)
            .equalWidths(with: view2, view3, constant: 40)
            .equalHeights(with: view2, view3)
            .arrangeHorizontally(with: view2, view3, constant: 20)
        
        view1.centerVertically(with: view2, view3, constant: 20, option: .equal(998))
        view1.centerVertically(with: view2, view3, constant: 30, option: .equal(999))
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 130)
        XCTAssertEqual(view2.frame.origin.x, 220)
        XCTAssertEqual(view3.frame.origin.y, 130)
        XCTAssertEqual(view3.frame.origin.x, 380)
    }
    
    /// func centerVertically(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testCenterVerticalWithOptionGrater() {
        addOtherSubviews()
        view1.top(offset: 100)
            .left(offset: 100)
            .size(equals: 100)
            .equalWidths(with: view2, view3, constant: 40)
            .equalHeights(with: view2, view3)
            .arrangeHorizontally(with: view2, view3, constant: 20)
        
        view1.centerVertically(with: view2, view3, constant: 20, option: .equal(998))
        view1.centerVertically(with: view2, view3, constant: 30, option: .equalOrGrater(999))
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 130)
        XCTAssertEqual(view2.frame.origin.x, 220)
        XCTAssertEqual(view3.frame.origin.y, 130)
        XCTAssertEqual(view3.frame.origin.x, 380)
    }
    
    /// func centerVertically(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testCenterVerticalWithOptionLess() {
        addOtherSubviews()
        view1.top(offset: 100)
            .left(offset: 100)
            .size(equals: 100)
            .equalWidths(with: view2, view3, constant: 40)
            .equalHeights(with: view2, view3)
            .arrangeHorizontally(with: view2, view3, constant: 20)
        
        view1.centerVertically(with: view2, view3, constant: 40, option: .equal(998))
        view1.centerVertically(with: view2, view3, constant: 30, option: .equalOrless(999))
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 130)
        XCTAssertEqual(view2.frame.origin.x, 220)
        XCTAssertEqual(view3.frame.origin.y, 130)
        XCTAssertEqual(view3.frame.origin.x, 380)
    }
}
