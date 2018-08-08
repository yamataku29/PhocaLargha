//
//  PagingScrollView.swift
//  NavigationModule
//
//  Created by Yamada Taku on 2018/06/29.
//  Copyright © 2018 Yamada Taku. All rights reserved.
//

import Foundation
import UIKit

class PagingScrollView: UIScrollView {
    var currentPageIndex: Int {
        let index = contentOffset.x/frame.width
        return Int(index)
    }
    func getContainerViewCenterX(index: Int) -> CGFloat {
        let firstBaseViewCenterX = UIScreen.main.bounds.midX
        let scrollToPositionX = CGFloat(index) * UIScreen.main.bounds.width
        return scrollToPositionX+firstBaseViewCenterX
    }
    func scrollToNext() {
        let offset = CGPoint(x: pagingOffsetX(to: currentPageIndex+1, width: UIScreen.main.bounds.width), y: 0)
        setContentOffset(offset, animated: true)
    }
    private func pagingOffsetX(to index: Int, width: CGFloat) -> CGFloat {
        return CGFloat(index)*width
    }
}
