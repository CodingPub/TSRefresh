//
//  JTableViewControllerDemo.swift
//  JRefreshExanple
//
//  Created by Lee on 2018/8/22.
//  Copyright © 2018年 LEE. All rights reserved.
//

import UIKit
import JRefresh

class JTableViewControllerDemo: UITableViewController {
    var demoIndex: IndexPath = IndexPath(row: 0, section: 0)
    var count = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        switch demoIndex.section {
        case 0:
            switch demoIndex.row {
                // MARK: - 默认下拉(只有刷新时间、状态)

            case 0:
                tableView.ts_header = JRefreshStateHeader.headerWithRefreshingBlock { [weak self] in
                    guard let `self` = self else { return }
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                        self.count += 2
                        self.tableView.reloadData()
                        self.tableView.ts_header?.endRefreshing()
                    }
                }
                tableView.ts_header?.beginRefreshing()

                // MARK: - 下拉带菊花、箭头

            case 1:
                tableView.ts_header = JRefreshNormalHeader.headerWithRefreshingBlock { [weak self] in
                    guard let `self` = self else { return }
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                        self.count += 2
                        self.tableView.reloadData()
                        self.tableView.ts_header?.endRefreshing()
                    }
                }
                tableView.ts_header?.beginRefreshing()

                // MARK: - 隐藏时间

            case 2:
                let header = JRefreshNormalHeader.headerWithRefreshingBlock { [weak self] in
                    guard let `self` = self else { return }
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                        self.count += 2
                        self.tableView.reloadData()
                        self.tableView.ts_header?.endRefreshing()
                    }
                }
                // 设置自动切换透明度(在导航栏下面自动隐藏)
                header.automaticallyChangeAlpha = true
                (header as! JRefreshNormalHeader).lastUpdatedTimeLabel.isHidden = true
                header.beginRefreshing()
                tableView.ts_header = header

                // MARK: - GIF 刷新

            case 3:
                tableView.ts_header = JChiBaoZiHeader.headerWithRefreshingBlock { [weak self] in
                    guard let `self` = self else { return }
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                        self.count += 2
                        self.tableView.reloadData()
                        self.tableView.ts_header?.endRefreshing()
                    }
                }
                tableView.ts_header?.beginRefreshing()

                // MARK: - 隐藏时间和状态

            case 4:
                let header = JChiBaoZiHeader.headerWithRefreshingBlock { [weak self] in
                    guard let `self` = self else { return }
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                        self.count += 2
                        self.tableView.reloadData()
                        self.tableView.ts_header?.endRefreshing()
                    }
                }
                (header as! JChiBaoZiHeader).stateLabel.isHidden = true
                (header as! JChiBaoZiHeader).lastUpdatedTimeLabel.isHidden = true
                header.beginRefreshing()
                tableView.ts_header = header

                // MARK: - 下拉刷新 自定义文字

            case 5:
                let header = JRefreshNormalHeader.headerWithRefreshingBlock { [weak self] in
                    guard let `self` = self else { return }
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                        self.count += 2
                        self.tableView.reloadData()
                        self.tableView.ts_header?.endRefreshing()
                    }
                }
                // 设置文字
                (header as! JRefreshNormalHeader).setTitle("lee", .Idle)
                (header as! JRefreshNormalHeader).setTitle("jiang", .Pulling)
                (header as! JRefreshNormalHeader).setTitle("bo", .Refreshing)
                // 设置字体
                (header as! JRefreshNormalHeader).stateLabel.font = UIFont.systemFont(ofSize: 16)
                (header as! JRefreshNormalHeader).lastUpdatedTimeLabel.font = UIFont.systemFont(ofSize: 14)
                // 设置颜色
                (header as! JRefreshNormalHeader).stateLabel.textColor = UIColor.red
                (header as! JRefreshNormalHeader).lastUpdatedTimeLabel.textColor = UIColor.blue
                header.beginRefreshing()
                tableView.ts_header = header

                // MARK: - 自定义下拉视图

            case 6:
                tableView.ts_header = JDIYHerader.headerWithRefreshingBlock { [weak self] in
                    guard let `self` = self else { return }
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                        self.count += 2
                        self.tableView.reloadData()
                        self.tableView.ts_header?.endRefreshing()
                    }
                }
                tableView.ts_header?.beginRefreshing()
            case 7:
                tableView.ts_header = JRefreshNormalHeader.headerWithRefreshingBlock { [weak self] in
                    guard let `self` = self else { return }
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                        self.count += 2
                        self.tableView.reloadData()
                        self.tableView.ts_header?.endRefreshing()
                    }
                }
                (tableView.ts_header as? JRefreshNormalHeader)?.arrowViewNeedCircle = true
                tableView.ts_header?.beginRefreshing()
            default:
                break
            }
        case 1:
            switch demoIndex.row {
                // MARK: - 默认上拉

            case 0:
                count = 10
                tableView.ts_footer = JRefreshAutoStateFooter.footerWithRefreshingBlock { [weak self] in
                    guard let `self` = self else { return }
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                        self.count += 2
                        self.tableView.reloadData()
                        self.tableView.ts_footer?.endRefreshing()
                    }
                }

                // MARK: - 上拉带loading

            case 1:
                count = 10
                tableView.ts_footer = JRefreshAutoNormalFooter.footerWithRefreshingBlock { [weak self] in
                    guard let `self` = self else { return }
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                        self.count += 2
                        self.tableView.reloadData()
                        self.tableView.ts_footer?.endRefreshing()
                    }
                }

                // MARK: - 静默加载+没有更多了

            case 2:
                count = 20
                tableView.ts_footer = JRefreshAutoNormalFooter.footerWithRefreshingBlock { [weak self] in
                    guard let `self` = self else { return }
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                        self.count += 5
                        self.tableView.reloadData()
                        self.tableView.ts_footer?.endRefreshing()
                        if self.count >= 40 {
                            self.tableView.ts_footer?.endRefreshingWithNoMoreData()
                        }
                    }
                }
                // 当底部控件出现多少时就自动刷新 , 实际使用中我们会提前几个cell的高度
                (tableView.ts_footer as? JRefreshAutoNormalFooter)?.triggerAutomaticallyRefreshPercent = -10

                // MARK: - 上拉Gif

            case 3:
                tableView.ts_footer = JChiBaoZiFooter.footerWithRefreshingBlock { [weak self] in
                    guard let `self` = self else { return }
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                        self.count += 5
                        self.tableView.reloadData()
                        self.tableView.ts_footer?.endRefreshing()
                        if self.count >= 40 {
                            self.tableView.ts_footer?.endRefreshingWithNoMoreData()
                        }
                    }
                }

                // MARK: - 上拉Gif(无文字状态)

            case 4:
                tableView.ts_footer = JChiBaoZiFooter.footerWithRefreshingBlock { [weak self] in
                    guard let `self` = self else { return }
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                        self.count += 5
                        self.tableView.reloadData()
                        self.tableView.ts_footer?.endRefreshing()
                        if self.count >= 40 {
                            self.tableView.ts_footer?.endRefreshingWithNoMoreData()
                        }
                    }
                }
                (tableView.ts_footer as? JRefreshAutoGifFooter)?.refreshingTitleHidden = true

                // MARK: - 上拉,禁止默认自动刷新

            case 5:
                count = 10
                tableView.ts_footer = JRefreshAutoNormalFooter.footerWithRefreshingBlock { [weak self] in
                    guard let `self` = self else { return }
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                        self.count += 2
                        self.tableView.reloadData()
                        self.tableView.ts_footer?.endRefreshing()
                    }
                }
                (tableView.ts_footer as? JRefreshAutoNormalFooter)?.automaticallyRefresh = false

                // MARK: - 上拉自定义文案

            case 6:
                count = 10
                tableView.ts_footer = JRefreshAutoNormalFooter.footerWithRefreshingBlock { [weak self] in
                    guard let `self` = self else { return }
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                        self.count += 2
                        self.tableView.reloadData()
                        self.tableView.ts_footer?.endRefreshing()
                    }
                }
                (tableView.ts_footer as? JRefreshAutoNormalFooter)?.setTitle("bo", .NoMoreData)
                (tableView.ts_footer as? JRefreshAutoNormalFooter)?.setTitle("jiang", .Refreshing)
                (tableView.ts_footer as? JRefreshAutoNormalFooter)?.setTitle("lee", .Idle)
                (tableView.ts_footer as? JRefreshAutoNormalFooter)?.stateLabel.textColor = UIColor.red

                // MARK: - 自定义上拉视图

            case 7:

                tableView.ts_footer = JDIYAutoFooter.footerWithRefreshingBlock { [weak self] in
                    guard let `self` = self else { return }
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                        self.count += 5
                        self.tableView.reloadData()
                        self.tableView.ts_footer?.endRefreshing()
                        if self.count >= 40 {
                            self.tableView.ts_footer?.endRefreshingWithNoMoreData()
                        }
                    }
                }
            default:
                break
            }
        default:
            break
        }
    }

    // MARK: - Table view data source

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JTableViewControllerDemo", for: indexPath)
        cell.textLabel?.text = "demo\(indexPath.row)"
        return cell
    }
}
