//
//  TSRefreshFooter.swift
//  TSRefreshExanple
//
//  Created by Lee on 2018/8/22.
//  Copyright © 2018年 LEE. All rights reserved.
//

import UIKit

open class TSRefreshFooter: TSRefreshComponent {
    /// 忽略多少scrollView的contentInset的bottom
    public var ignoredScrollViewContentInsetBottom: CGFloat = 0

    // MARK: - 创建footer方法

    public class func footerWithRefreshingBlock(_ refreshingBlock: @escaping Block) -> TSRefreshFooter {
        let cmp = self.init()
        cmp.refreshingBlock = refreshingBlock
        return cmp
    }
}

extension TSRefreshFooter {
    open override func prepare() {
        super.prepare()
        // 设置自己的高度
        height = TSRefreshConst.footerHeight
    }
}

// MARK: - 公共方法

extension TSRefreshFooter {
    public func endRefreshingWithNoMoreData() {
        DispatchQueue.main.async { [weak self] in
            self?.state = .NoMoreData
        }
    }

    public func resetNoMoreData() {
        DispatchQueue.main.async { [weak self] in
            self?.state = .Idle
        }
    }
}
