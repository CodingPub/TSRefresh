//
//  TSRefreshConst.swift
//  TSRefreshExanple
//
//  Created by Lee on 2018/8/20.
//  Copyright © 2018年 LEE. All rights reserved.
//

import UIKit

struct TSRefreshConst {
    static let labelLeftInset: CGFloat = 25.0
    static let headerHeight: CGFloat = 54.0
    static let footerHeight: CGFloat = 44.0
    static let fastAnimationDuration = 0.25
    static let slowAnimationDuration = 0.4
}

struct TSRefreshKeyPath {
    static let contentOffset = "contentOffset"
    static let contentInset = "contentInset"
    static let contentSize = "contentSize"
    static let panState = "state"
}

struct TSRefreshHead {
    static let lastUpdateTimeKey = "TSRefreshHeaderLastUpdateTimeKey"
    static let idleText = "TSRefreshHeaderIdleText"
    static let pullingText = "TSRefreshHeaderPullingText"
    static let refreshingText = "TSRefreshHeaderRefreshingText"

    static let lastTimeText = "TSRefreshHeaderLastTimeText"
    static let dateTodayText = "TSRefreshHeaderDateTodayText"
    static let noneLastDateText = "TSRefreshHeaderNoneLastDateText"
}

struct TSRefreshAutoFoot {
    static let idleText = "TSRefreshAutoFooterIdleText"
    static let refreshingText = "TSRefreshAutoFooterRefreshingText"
    static let noMoreDataText = "TSRefreshAutoFooterNoMoreDataText"
}

let TSRefreshLabelFont = UIFont.boldSystemFont(ofSize: 14)
let TSRefreshLabelTextColor = UIColor(red: 90.0 / 255.0, green: 90.0 / 255.0, blue: 90.0 / 255.0, alpha: 1.0)
