//
//  Layouter.swift
//  Layouter
//
//  Created by Hasan Soysal on 11.05.2021.
//

import Foundation
import UIKit

public extension NSLayoutConstraint {
    
    /// Activates the constraints
    ///
    /// It calls:
    ///
    ///     self.isActive = true
    ///
    func activate() {
        self.isActive = true
    }
}

// MARK: - Origin
public extension UIView {
    
    /// The location where the constraint will be applied to
    ///
    /// When you need to add the constraints for your first level view in the view hierarchy,
    /// then you can select the location with this enum cases.
    ///
    ///     case superview, safearea
    ///
    enum Where {
        case superview, safearea
    }
    
    /// The option where the constraint will be equal, graterThanOrEqualTo, or lessThanOrEqualTo
    ///
    /// When you need to add the constraints for your view other than to be equal,
    /// then you can select the option with this enum cases.
    ///
    ///     case equal(CGFloat)
    ///     case equalOrGrater(CGFloat)
    ///     case equalOrless(CGFloat)
    ///
    enum SizeOption {
        case equal(Float)
        case equalOrGrater(Float)
        case equalOrless(Float)
    }
    
    /// Returns self
    ///
    /// Produces an active constraint of the form:
    ///
    ///     self.top = other.top + constant
    ///
    /// - Parameters:
    ///   - offset: offset constant for the constraint.
    ///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
    ///   The default is `equal(1000)`.
    ///   - location: location for the constraint. It can be `superview` or `safearea`.
    ///   The default is `superview`.
    /// - Returns: `self`
    @discardableResult
    func top(offset constant: CGFloat, option: SizeOption = .equal(1000), location: Where = .superview) -> UIView {
        guard let superview = superview else { return self }
        var anchor: NSLayoutYAxisAnchor {
            switch location {
            case .superview: return superview.topAnchor
            case .safearea:
                if #available(iOS 11.0, *) {
                    return superview.safeAreaLayoutGuide.topAnchor
                } else {
                    return superview.topAnchor
                }
            }
        }
        
        switch option {
        case .equal(let priority):
            let constraint: NSLayoutConstraint = self.topAnchor.constraint(equalTo: anchor, constant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        case .equalOrGrater(let priority):
            let constraint: NSLayoutConstraint = self.topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        case .equalOrless(let priority):
            let constraint: NSLayoutConstraint = self.topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        }
        return self
    }
    
    /// Returns self
    ///
    /// Produces an active constraint of the form:
    ///
    ///     self.left = other.left + constant
    ///
    /// - Parameters:
    ///   - offset: offset constant for the constraint.
    ///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
    ///   The default is `equal(1000)`.
    ///
    /// - Returns: `self`
    @discardableResult
    func left(offset constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView {
        guard let superview = superview else { return self }
        switch option {
        case .equal(let priority):
            let constraint: NSLayoutConstraint = self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        case .equalOrGrater(let priority):
            let constraint: NSLayoutConstraint = self.leadingAnchor.constraint(greaterThanOrEqualTo: superview.leadingAnchor, constant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        case .equalOrless(let priority):
            let constraint: NSLayoutConstraint = self.leadingAnchor.constraint(lessThanOrEqualTo: superview.leadingAnchor, constant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        }
        return self
    }
    
    /// Returns self
    ///
    /// Produces an active constraint of the form:
    ///
    ///     self.right + constant = other.right
    ///
    /// - Parameters:
    ///   - offset: offset constant for the constraint.
    ///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
    ///   The default is `equal(1000)`.
    ///
    /// - Returns: `self`
    @discardableResult
    func right(offset constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView {
        guard let superview = superview else { return self }
        switch option {
        case .equal(let priority):
            let constraint: NSLayoutConstraint = superview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        case .equalOrGrater(let priority):
            let constraint: NSLayoutConstraint = superview.trailingAnchor.constraint(greaterThanOrEqualTo: self.trailingAnchor, constant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        case .equalOrless(let priority):
            let constraint: NSLayoutConstraint = superview.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        }
        return self
    }
    
    /// Returns self
    ///
    /// Produces an active constraint of the form:
    ///
    ///     self.bottom + constant = other.bottom
    ///
    /// - Parameters:
    ///   - offset: offset constant for the constraint.
    ///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
    ///   The default is `equal(1000)`.
    ///   - location: location for the constraint. It can be `superview` or `safearea`.
    ///   The default is `superview`.
    /// - Returns: `self`
    @discardableResult
    func bottom(offset constant: CGFloat, option: SizeOption = .equal(1000), location: Where = .superview) -> UIView {
        guard let superview = superview else { return self }
        var anchor: NSLayoutYAxisAnchor {
            switch location {
            case .superview: return superview.bottomAnchor
            case .safearea:
                if #available(iOS 11.0, *) {
                    return superview.safeAreaLayoutGuide.bottomAnchor
                } else {
                    return superview.bottomAnchor
                }
            }
        }
        
        switch option {
        case .equal(let priority):
            let constraint: NSLayoutConstraint = anchor.constraint(equalTo: self.bottomAnchor, constant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        case .equalOrGrater(let priority):
            let constraint: NSLayoutConstraint = anchor.constraint(greaterThanOrEqualTo: self.bottomAnchor, constant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        case .equalOrless(let priority):
            let constraint: NSLayoutConstraint = anchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        }
        return self
    }
}

// MARK: - Align
public extension UIView {
    
    /// Returns self
    ///
    /// Produces an active constraint of the form:
    ///
    ///     self.top + constant = others.top
    ///
    /// - Parameters:
    ///   - views: other views whose tops will be aligned with this view
    ///   - constant: offset constant for the constraint.
    ///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
    ///   The default is `equal(1000)`.
    /// - Returns: `self`
    @discardableResult
    func alignTops(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView {
        views.forEach({
            switch option {
            case .equal(let priority):
                let constraint: NSLayoutConstraint = $0.topAnchor.constraint(equalTo: self.topAnchor, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            case .equalOrGrater(let priority):
                let constraint: NSLayoutConstraint = $0.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            case .equalOrless(let priority):
                let constraint: NSLayoutConstraint = $0.topAnchor.constraint(lessThanOrEqualTo: self.topAnchor, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            }
        })
        return self
    }
    
    /// Returns self
    ///
    /// Produces an active constraint of the form:
    ///
    ///     self.bottom = others.bottom + constant
    ///
    /// - Parameters:
    ///   - views: other views whose bottoms will be aligned with this view
    ///   - constant: offset constant for the constraint.
    ///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
    ///   The default is `equal(1000)`.
    /// - Returns: `self`
    @discardableResult
    func alignBottoms(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView {
        views.forEach({
            switch option {
            case .equal(let priority):
                let constraint: NSLayoutConstraint = $0.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            case .equalOrGrater(let priority):
                let constraint: NSLayoutConstraint = $0.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            case .equalOrless(let priority):
                let constraint: NSLayoutConstraint = $0.bottomAnchor.constraint(greaterThanOrEqualTo: self.bottomAnchor, constant: -constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            }
        })
        return self
    }
    
    /// Returns self
    ///
    /// Produces an active constraint of the form:
    ///
    ///     self.left + constant = others.left
    ///
    /// - Parameters:
    ///   - views: other views whose lefts will be aligned with this view
    ///   - constant: offset constant for the constraint.
    ///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
    ///   The default is `equal(1000)`.
    /// - Returns: `self`
    @discardableResult
    func alignLefts(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView {
        views.forEach({
            switch option {
            case .equal(let priority):
                let constraint: NSLayoutConstraint = $0.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            case .equalOrGrater(let priority):
                let constraint: NSLayoutConstraint = $0.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            case .equalOrless(let priority):
                let constraint: NSLayoutConstraint = $0.leadingAnchor.constraint(lessThanOrEqualTo: self.leadingAnchor, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            }
        })
        return self
    }
    
    /// Returns self
    ///
    /// Produces an active constraint of the form:
    ///
    ///     self.right = others.right + constant
    ///
    /// - Parameters:
    ///   - views: other views whose rights will be aligned with this view
    ///   - constant: offset constant for the constraint.
    ///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
    ///   The default is `equal(1000)`.
    /// - Returns: `self`
    @discardableResult
    func alignRights(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView {
        views.forEach({
            switch option {
            case .equal(let priority):
                let constraint: NSLayoutConstraint = $0.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            case .equalOrGrater(let priority):
                let constraint: NSLayoutConstraint = $0.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            case .equalOrless(let priority):
                let constraint: NSLayoutConstraint = $0.trailingAnchor.constraint(greaterThanOrEqualTo: self.trailingAnchor, constant: -constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            }
        })
        return self
    }
}

//MARK: - Arrangement
public extension UIView {
    
    /// Returns self
    ///
    /// Produces an active constraint of the form:
    ///
    ///     self.trailing + constant = others.leading
    ///
    /// - Parameters:
    ///   - views: other views who will be in the horizontal sequence starting with this view
    ///   - constant: offset constant for the constraint.
    ///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
    ///   The default is `equal(1000)`.
    /// - Returns: `self`
    @discardableResult
    func arrangeHorizontally(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView {
        var current: UIView = self
        views.forEach({
            switch option {
            case .equal(let priority):
                let constraint: NSLayoutConstraint = $0.leadingAnchor.constraint(equalTo: current.trailingAnchor, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            case .equalOrGrater(let priority):
                let constraint: NSLayoutConstraint = $0.leadingAnchor.constraint(greaterThanOrEqualTo: current.trailingAnchor, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            case .equalOrless(let priority):
                let constraint: NSLayoutConstraint = $0.leadingAnchor.constraint(lessThanOrEqualTo: current.trailingAnchor, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            }
            current = $0
        })
        return self
    }
    
    /// Returns self
    ///
    /// Produces an active constraint of the form:
    ///
    ///     self.bottom + constant= others.top
    ///
    /// - Parameters:
    ///   - views: other views who will be in the vertical sequence starting with this view
    ///   - constant: offset constant for the constraint.
    ///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
    ///   The default is `equal(1000)`.
    /// - Returns: `self`
    @discardableResult
    func arrangeVertically(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView {
        var current: UIView = self
        views.forEach({
            switch option {
            case .equal(let priority):
                let constraint: NSLayoutConstraint = $0.topAnchor.constraint(equalTo: current.bottomAnchor, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            case .equalOrGrater(let priority):
                let constraint: NSLayoutConstraint = $0.topAnchor.constraint(greaterThanOrEqualTo: current.bottomAnchor, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            case .equalOrless(let priority):
                let constraint: NSLayoutConstraint = $0.topAnchor.constraint(lessThanOrEqualTo: current.bottomAnchor, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            }
            current = $0
        })
        return self
    }
}

// MARK: - Size
public extension UIView {
    
    /// Returns self
    ///
    /// Produces an active constraint of the form:
    ///
    ///     self.width = constant
    ///
    /// - Parameters:
    ///   - constant: constant for the constraint.
    ///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
    ///   The default is `equal(1000)`.
    /// - Returns: `self`
    @discardableResult
    func width(equals constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView {
        switch option {
        case .equal(let priority):
            let constraint: NSLayoutConstraint = self.widthAnchor.constraint(equalToConstant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        case .equalOrGrater(let priority):
            let constraint: NSLayoutConstraint = self.widthAnchor.constraint(greaterThanOrEqualToConstant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        case .equalOrless(let priority):
            let constraint: NSLayoutConstraint = self.widthAnchor.constraint(lessThanOrEqualToConstant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        }
        return self
    }
    
    /// Returns self
    ///
    /// Produces an active constraint of the form:
    ///
    ///     self.height = constant
    ///
    /// - Parameters:
    ///   - constant: constant for the constraint.
    ///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
    ///   The default is `equal(1000)`.
    /// - Returns: `self`
    @discardableResult
    func height(equals constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView {
        switch option {
        case .equal(let priority):
            let constraint: NSLayoutConstraint = self.heightAnchor.constraint(equalToConstant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        case .equalOrGrater(let priority):
            let constraint: NSLayoutConstraint = self.heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        case .equalOrless(let priority):
            let constraint: NSLayoutConstraint = self.heightAnchor.constraint(lessThanOrEqualToConstant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        }
        return self
    }
    
    /// Returns self
    ///
    /// Produces an active constraint of the form:
    ///
    ///     self.width = constant
    ///     self.height = constant
    ///
    /// - Parameters:
    ///   - constant: constant for the constraint.
    ///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
    ///   The default is `equal(1000)`.
    /// - Returns: `self`
    @discardableResult
    func size(equals constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView {
        width(equals: constant, option: option)
        height(equals: constant, option: option)
        return self
    }
}

// MARK: - Equal
public extension UIView {
    
    /// Returns self
    ///
    /// Produces an active constraint of the form:
    ///
    ///     self.width * multiplier + constant = others.width
    ///
    /// - Parameters:
    ///   - views: other views whose width will be equal to this view
    ///   - multiplier: multiplier constant for the constraint.
    ///   - constant: constant for the constraint.
    ///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
    ///   The default is `equal(1000)`.
    /// - Returns: `self`
    @discardableResult
    func equalWidths(with views: UIView..., multiplier: CGFloat = 1, constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView {
        views.forEach({
            switch option {
            case .equal(let priority):
                let constraint: NSLayoutConstraint = $0.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: multiplier, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            case .equalOrGrater(let priority):
                let constraint: NSLayoutConstraint = $0.widthAnchor.constraint(greaterThanOrEqualTo: self.widthAnchor, multiplier: multiplier, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            case .equalOrless(let priority):
                let constraint: NSLayoutConstraint = $0.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: multiplier, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            }
        })
        return self
    }
    
    /// Returns self
    ///
    /// Produces an active constraint of the form:
    ///
    ///     self.height * multiplier + constant = others.height
    ///
    /// - Parameters:
    ///   - views: other views whose width will be equal to this view
    ///   - multiplier: multiplier constant for the constraint.
    ///   - constant: constant for the constraint.
    ///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
    ///   The default is `equal(1000)`.
    /// - Returns: `self`
    @discardableResult
    func equalHeights(with views: UIView..., multiplier: CGFloat = 1, constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView {
        views.forEach({
            switch option {
            case .equal(let priority):
                let constraint: NSLayoutConstraint = $0.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: multiplier, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            case .equalOrGrater(let priority):
                let constraint: NSLayoutConstraint = $0.heightAnchor.constraint(greaterThanOrEqualTo: self.heightAnchor, multiplier: multiplier, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            case .equalOrless(let priority):
                let constraint: NSLayoutConstraint = $0.heightAnchor.constraint(lessThanOrEqualTo: self.heightAnchor, multiplier: multiplier, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            }
        })
        return self
    }
}

// MARK: - Fill Size
public extension UIView {
    
    /// Returns self
    ///
    /// Produces an active constraint of the form:
    ///
    ///     self.left = other.left + constant
    ///     self.right + constant = other.right
    ///
    /// It calls the methods:
    ///
    ///     left(offset: constant, option: option)
    ///     right(offset: constant, option: option)
    ///
    /// - Parameters:
    ///   - offset: offset constant for the constraint.
    ///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
    ///   The default is `equal(1000)`.
    /// - Returns: `self`
    @discardableResult
    func fillHorizontal(offset constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView {
        left(offset: constant, option: option)
        right(offset: constant, option: option)
        return self
    }

    /// Returns self
    ///
    /// Produces an active constraint of the form:
    ///
    ///     self.top = other.top + constant
    ///     self.bottom + constant = other.bottom
    ///
    /// It calls the methods:
    ///
    ///     top(offset: constant, option: option, location: location)
    ///     bottom(offset: constant, option: option, to: location)
    ///
    /// - Parameters:
    ///   - offset: offset constant for the constraint.
    ///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
    ///   The default is `equal(1000)`.
    ///   - location: location for the constraint. It can be `superview` or `safearea`.
    ///   The default is `superview`.
    /// - Returns: `self`
    @discardableResult
    func fillVertical(offset constant: CGFloat = 0, option: SizeOption = .equal(1000), location: Where = .superview) -> UIView {
        top(offset: constant, option: option, location: location)
        bottom(offset: constant, option: option, location: location)
        return self
    }
    
    /// Returns self
    ///
    /// Produces an active constraint of the form:
    ///
    ///     self.left = other.left + constant
    ///     self.right + constant = other.right
    ///     self.top = other.top + constant
    ///     self.bottom + constant = other.bottom
    ///
    /// It calls the methods:
    ///
    ///     fillHorizontal(offset: constant, option: option)
    ///     fillVertical(offset: constant, option: option, location: location)
    ///
    /// - Parameters:
    ///   - offset: offset constant for the constraint.
    ///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
    ///   The default is `equal(1000)`.
    ///   - location: location for the constraint. It can be `superview` or `safearea`.
    ///   The default is `superview`.
    /// - Returns: `self`
    @discardableResult
    func fillDimension(offset constant: CGFloat = 0, option: SizeOption = .equal(1000), location: Where = .superview) -> UIView {
        fillHorizontal(offset: constant, option: option)
        fillVertical(offset: constant, option: option, location: location)
        return self
    }
}

// MARK: - Center
public extension UIView {
    
    /// Returns self
    ///
    /// Produces an active constraint of the form:
    ///
    ///     self.centerX + constant = others.centerX
    ///
    /// - Parameters:
    ///   - views: other views who will be in the horizontal sequence starting with this view
    ///   - constant: offset constant for the constraint.
    ///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
    ///   The default is `equal(1000)`.
    /// - Returns: `self`
    @discardableResult
    func centerHorizontally(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView {
        views.forEach({
            switch option {
            case .equal(let priority):
                let constraint: NSLayoutConstraint = $0.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            case .equalOrGrater(let priority):
                let constraint: NSLayoutConstraint = $0.centerXAnchor.constraint(greaterThanOrEqualTo: self.centerXAnchor, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            case .equalOrless(let priority):
                let constraint: NSLayoutConstraint = $0.centerXAnchor.constraint(lessThanOrEqualTo: self.centerXAnchor, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            }
        })
        return self
    }
    
    /// Returns self
    ///
    /// Produces an active constraint of the form:
    ///
    ///     self.centerY + constant= others.centerY
    ///
    /// - Parameters:
    ///   - views: other views who will be in the vertical sequence starting with this view
    ///   - constant: offset constant for the constraint.
    ///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
    ///   The default is `equal(1000)`.
    /// - Returns: `self`
    @discardableResult
    func centerVertically(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView {
        views.forEach({
            switch option {
            case .equal(let priority):
                let constraint: NSLayoutConstraint = $0.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            case .equalOrGrater(let priority):
                let constraint: NSLayoutConstraint = $0.centerYAnchor.constraint(greaterThanOrEqualTo: self.centerYAnchor, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            case .equalOrless(let priority):
                let constraint: NSLayoutConstraint = $0.centerYAnchor.constraint(lessThanOrEqualTo: self.centerYAnchor, constant: constant)
                constraint.priority = UILayoutPriority(rawValue: priority)
                constraint.activate()
            }
        })
        return self
    }
    
    /// Returns self
    ///
    /// Produces an active constraint of the form:
    ///
    ///     self.center = superview.center + constant
    ///
    /// - Parameters:
    ///   - offset: offset constant for the constraint.
    ///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
    ///   The default is `equal(1000)`.
    /// - Returns: `self`
    @discardableResult
    func centerHorizontally(offset constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView {
        guard let superview = superview else { return self }
        switch option {
        case .equal(let priority):
            let constraint: NSLayoutConstraint = self.centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        case .equalOrGrater(let priority):
            let constraint: NSLayoutConstraint = self.centerXAnchor.constraint(greaterThanOrEqualTo: superview.centerXAnchor, constant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        case .equalOrless(let priority):
            let constraint: NSLayoutConstraint = self.centerXAnchor.constraint(lessThanOrEqualTo: superview.centerXAnchor, constant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        }
        return self
    }
    
    /// Returns self
    ///
    /// Produces an active constraint of the form:
    ///
    ///     self.center = other.center + constant
    ///
    /// - Parameters:
    ///   - offset: offset constant for the constraint.
    ///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
    ///   The default is `equal(1000)`.
    ///   - location: location for the constraint. It can be `superview` or `safearea`.
    ///   The default is `superview`.
    /// - Returns: `self`
    @discardableResult
    func centerVertically(offset constant: CGFloat = 0, option: SizeOption = .equal(1000), location: Where = .superview) -> UIView {
        guard let superview = superview else { return self }
        var anchor: NSLayoutYAxisAnchor {
            switch location {
            case .superview: return superview.centerYAnchor
            case .safearea:
                if #available(iOS 11.0, *) {
                    return superview.safeAreaLayoutGuide.centerYAnchor
                } else {
                    return superview.centerYAnchor
                }
            }
        }
        
        switch option {
        case .equal(let priority):
            let constraint: NSLayoutConstraint = self.centerYAnchor.constraint(equalTo: anchor, constant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        case .equalOrGrater(let priority):
            let constraint: NSLayoutConstraint = self.centerYAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        case .equalOrless(let priority):
            let constraint: NSLayoutConstraint = self.centerYAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
            constraint.priority = UILayoutPriority(rawValue: priority)
            constraint.activate()
        }
        return self
    }
}
