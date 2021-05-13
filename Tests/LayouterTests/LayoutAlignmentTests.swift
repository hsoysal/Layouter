//
//  LayoutAlignmentTests.swift
//  Layouter
//
//  Created by Hasan Soysal on 12.05.2021.
//

import XCTest
@testable import Layouter

class LayoutAlignmentTests: XCTestCase {
    
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
    
    /// func alignTops(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func alignBottoms(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func alignLefts(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func alignRights(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testAlignSingle() {
        view1.fillDimension()
        view1.alignTops(with: view2).alignBottoms(with: view2).alignLefts(with: view2).alignRights(with: view2)
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 0)
        XCTAssertEqual(view2.frame.origin.x, 0)
        XCTAssertEqual(view1.frame, view2.frame)
        XCTAssertEqual(view2.frame.width, viewController.view.bounds.width)
        XCTAssertEqual(view2.frame.height, viewController.view.bounds.height)
    }
    
    /// func alignTops(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func alignBottoms(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func alignLefts(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func alignRights(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testAlignMultiple() {
        view1.fillDimension(offset: 20)
        view1.alignTops(with: view2, view3).alignBottoms(with: view2, view3).alignLefts(with: view2, view3).alignRights(with: view2, view3)
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 20)
        XCTAssertEqual(view2.frame.origin.x, 20)
        XCTAssertEqual(view3.frame.origin.y, 20)
        XCTAssertEqual(view3.frame.origin.x, 20)
        XCTAssertEqual(view1.frame, view2.frame)
        XCTAssertEqual(view1.frame, view3.frame)
        XCTAssertEqual(view2.frame.width, viewController.view.bounds.width - 40)
        XCTAssertEqual(view2.frame.height, viewController.view.bounds.height - 40)
    }
    
    /// func alignTops(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView 
    /// func alignBottoms(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func alignLefts(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func alignRights(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testAlignWithOffset() {
        view1.top(offset: 10).left(offset: 20).size(equals: 100)
        view1.alignTops(with: view2, view3, constant: 10)
            .alignLefts(with: view2, view3, constant: 20)
            .alignBottoms(with: view2, view3, constant: 30)
            .alignRights(with: view2, view3, constant: 40)
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 20)
        XCTAssertEqual(view2.frame.origin.x, 40)
        XCTAssertEqual(view2.frame.width, 40)
        XCTAssertEqual(view2.frame.height, 60)
        XCTAssertEqual(view2.frame, view3.frame)
    }
    
    /// func alignTops(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func alignBottoms(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func alignLefts(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func alignRights(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testAlignWithOption() {
        view1.top(offset: 10).left(offset: 20).size(equals: 100)
        view1.alignTops(with: view2, view3, constant: 10, option: .equal(998))
            .alignLefts(with: view2, view3, constant: 10, option: .equal(998))
            .alignBottoms(with: view2, view3, constant: 10, option: .equal(998))
            .alignRights(with: view2, view3, constant: 10, option: .equal(998))
        
        view1.alignTops(with: view2, view3, option: .equal(999))
            .alignLefts(with: view2, view3, option: .equal(999))
            .alignBottoms(with: view2, view3, option: .equal(999))
            .alignRights(with: view2, view3, option: .equal(999))
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 10)
        XCTAssertEqual(view2.frame.origin.x, 20)
        XCTAssertEqual(view2.frame.width, 100)
        XCTAssertEqual(view2.frame.height, 100)
        XCTAssertEqual(view1.frame, view2.frame)
        XCTAssertEqual(view1.frame, view3.frame)
        
    }
    
    /// func alignTops(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func alignBottoms(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func alignLefts(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func alignRights(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testAlignWithOptionGrater() {
        view1.top(offset: 10)
            .left(offset: 20)
            .bottom(offset: 30)
            .right(offset: 40)
        
        view1.alignTops(with: view2, view3, option: .equal(996))
            .alignLefts(with: view2, view3, option: .equal(996))
            .alignBottoms(with: view2, view3, option: .equal(996))
            .alignRights(with: view2, view3, option: .equal(996))
        
        view1.alignTops(with: view2, view3, constant: 30, option: .equalOrGrater(999))
            .alignLefts(with: view2, view3, constant: 40, option: .equalOrGrater(999))
            .alignBottoms(with: view2, view3, constant: 50, option: .equalOrGrater(999))
            .alignRights(with: view2, view3, constant: 60, option: .equalOrGrater(999))
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 40)
        XCTAssertEqual(view2.frame.origin.x, 60)
        XCTAssertEqual(view2.frame.width, view1.frame.width - 100)
        XCTAssertEqual(view2.frame.height, view1.frame.height - 80)
        XCTAssertEqual(view3.frame, view2.frame)
    }
    
    /// func alignTops(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func alignBottoms(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func alignLefts(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    /// func alignRights(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
    func testAlignWithOptionLess() {
        view1.top(offset: 100)
            .left(offset: 100)
            .bottom(offset: 100)
            .right(offset: 100)
        
        view1.alignTops(with: view2, view3, constant: 30, option: .equal(996))
            .alignLefts(with: view2, view3, constant: 40, option: .equal(996))
            .alignBottoms(with: view2, view3, constant: 50, option: .equal(996))
            .alignRights(with: view2, view3, constant: 60, option: .equal(996))
        
        view1.alignTops(with: view2, view3, option: .equalOrless(999))
            .alignLefts(with: view2, view3, option: .equalOrless(999))
            .alignBottoms(with: view2, view3, option: .equalOrless(999))
            .alignRights(with: view2, view3, option: .equalOrless(999))
        
        viewController.view.layoutIfNeeded()
        XCTAssertEqual(view2.frame.origin.y, 100)
        XCTAssertEqual(view2.frame.origin.x, 100)
        XCTAssertEqual(view2.frame.width, view1.frame.width)
        XCTAssertEqual(view2.frame.height, view1.frame.height)
        XCTAssertEqual(view2.frame, view3.frame)
    }
}
