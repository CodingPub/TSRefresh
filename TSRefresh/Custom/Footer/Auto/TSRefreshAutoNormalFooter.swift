//
//  TSRefreshAutoNormalFooter.swift
//  TSRefreshExanple
//
//  Created by Lee on 2018/8/23.
//  Copyright © 2018年 LEE. All rights reserved.
//

import UIKit

open class TSRefreshAutoNormalFooter: TSRefreshAutoStateFooter {
    public var activityIndicatorViewStyle: UIActivityIndicatorView.Style = .gray {
        didSet {
            loadingView.style = activityIndicatorViewStyle
            setNeedsLayout()
        }
    }

    public lazy var loadingView: UIActivityIndicatorView = {
        let loadingView = UIActivityIndicatorView(style: .gray)
        loadingView.hidesWhenStopped = true

        return loadingView
    }()

    open override var state: TSRefreshState {
        set(newState) {
            // 状态检查
            let oldState = state
            if oldState == newState {
                return
            }
            super.state = newState

            if newState == .NoMoreData || newState == .Idle {
                loadingView.stopAnimating()
            } else if state == .Refreshing {
                loadingView.startAnimating()
            }
        }
        get {
            return super.state
        }
    }
}

extension TSRefreshAutoNormalFooter {
    open override func prepare() {
        super.prepare()
        addSubview(loadingView)
    }

    open override func placeSubviews() {
        super.placeSubviews()
        // 圈圈
        var loadingCenterX = width * 0.5
        if !refreshingTitleHidden {
            loadingCenterX -= stateLabel.textWidth() * 0.5 + labelLeftInset
        }
        let loadingCenterY = height * 0.5
        loadingView.center = CGPoint(x: loadingCenterX, y: loadingCenterY)
    }
}
