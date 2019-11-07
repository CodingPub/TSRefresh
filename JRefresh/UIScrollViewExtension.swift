//
//  UIScrollViewExtension.swift
//  JRefreshExanple
//
//  Created by Lee on 2018/8/20.
//  Copyright © 2018年 LEE. All rights reserved.
//

import UIKit

extension UIScrollView {
    var inset: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return self.adjustedContentInset
        } else {
            return contentInset
        }
    }

    var insetTop: CGFloat {
        set(newTop) {
            var inset = contentInset
            inset.top = newTop
            if #available(iOS 11.0, *) {
                inset.top -= (self.adjustedContentInset.top - self.contentInset.top)
            }
            contentInset = inset
        }
        get {
            return inset.top
        }
    }

    var insetRight: CGFloat {
        set(newRight) {
            var inset = contentInset
            inset.right = newRight
            if #available(iOS 11.0, *) {
                inset.right -= (self.adjustedContentInset.right - self.contentInset.right)
            }
            contentInset = inset
        }
        get {
            return inset.right
        }
    }

    var insetBottom: CGFloat {
        set(newBottom) {
            var inset = contentInset
            inset.bottom = newBottom
            if #available(iOS 11.0, *) {
                inset.bottom -= (self.adjustedContentInset.bottom - self.contentInset.bottom)
            }
            contentInset = inset
        }
        get {
            return inset.bottom
        }
    }

    var insetLeft: CGFloat {
        set(newLeft) {
            var inset = contentInset
            inset.left = newLeft
            if #available(iOS 11.0, *) {
                inset.left -= (self.adjustedContentInset.left - self.contentInset.left)
            }
            contentInset = inset
        }
        get {
            return inset.left
        }
    }

    var offsetX: CGFloat {
        set(newOffsetX) {
            var offset = contentOffset
            offset.x = newOffsetX
            contentOffset = offset
        }
        get {
            return contentOffset.x
        }
    }

    var offsetY: CGFloat {
        set(newOffsetY) {
            var offset = contentOffset
            offset.y = newOffsetY
            contentOffset = offset
        }
        get {
            return contentOffset.y
        }
    }

    var contentW: CGFloat {
        set(newContentW) {
            var size = contentSize
            size.width = newContentW
            contentSize = size
        }
        get {
            return contentSize.width
        }
    }

    var contentH: CGFloat {
        set(newContentH) {
            var size = contentSize
            size.height = newContentH
            contentSize = size
        }
        get {
            return contentSize.height
        }
    }
}
