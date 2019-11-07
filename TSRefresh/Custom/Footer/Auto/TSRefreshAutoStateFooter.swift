//
//  TSRefreshAutoStateFooter.swift
//  TSRefreshExanple
//
//  Created by Lee on 2018/8/22.
//  Copyright © 2018年 LEE. All rights reserved.
//

import UIKit

open class TSRefreshAutoStateFooter: TSRefreshAutoFooter {
    // MARK: - 状态相关

    /// 文字距离圈圈、箭头的距离
    public var labelLeftInset: CGFloat = TSRefreshConst.labelLeftInset
    /// 显示刷新状态的label
    public lazy var stateLabel: UILabel = {
        let label = UILabel.ts_lable()
        return label
    }()

    /// 隐藏刷新状态的文字
    public var refreshingTitleHidden: Bool = false
    /// 所有状态对应的文字
    lazy var stateTitles = [Int: String]()

    open override var state: TSRefreshState {
        set(newState) {
            // 状态检查
            let oldState = state
            if oldState == newState {
                return
            }
            super.state = newState

            if refreshingTitleHidden, newState == .Refreshing {
                stateLabel.text = nil
            } else {
                stateLabel.text = stateTitles[newState.hashValue]
            }
        }
        get {
            return super.state
        }
    }
}

extension TSRefreshAutoStateFooter {
    /// 设置state状态下的文字
    public func setTitle(_ title: String?, _ state: TSRefreshState) {
        guard let title = title else { return }
        stateTitles[state.hashValue] = title
        stateLabel.text = stateTitles[state.hashValue]
    }
}

// MARK: - 重写父类的方法

extension TSRefreshAutoStateFooter {
    open override func prepare() {
        super.prepare()
        addSubview(stateLabel)
        // 初始化文字
        setTitle(Bundle.localizedString(TSRefreshAutoFoot.refreshingText), .Refreshing)
        setTitle(Bundle.localizedString(TSRefreshAutoFoot.noMoreDataText), .NoMoreData)
        setTitle(Bundle.localizedString(TSRefreshAutoFoot.idleText), .Idle)

        // 监听label
        stateLabel.isUserInteractionEnabled = true
        stateLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(stateLabelClick)))
    }

    open override func placeSubviews() {
        super.placeSubviews()

        if stateLabel.constraints.count > 0 {
            return
        }
        // 状态标签
        stateLabel.frame = bounds
    }
}

extension TSRefreshAutoStateFooter {
    @objc fileprivate func stateLabelClick() {
        if state == .Idle {
            beginRefreshing()
        }
    }
}
