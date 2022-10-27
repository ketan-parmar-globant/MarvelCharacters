//
//  ThemeManager.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 20/10/22.
//

import Foundation
import UIKit

enum Colors {
    static let backgroundColor = UIColor(named: "backgroundColor")
    static let primaryFontColor = UIColor(named: "primaryFontColor")
    static let secondaryFontColor = UIColor.lightText
    static let systemBlueColor = UIColor.systemBlue
    static let clearColor = UIColor.clear
    static let systemGrayColor = UIColor.systemGray5
}

enum Fonts {
    static let primaryFont = UIFont.systemFont(ofSize: 17.0)
    static let secondaryFont = UIFont.systemFont(ofSize: 15.0)
}

enum Spacing {
    /// 0 points
    static let s0: CGFloat = 0
    /// 2 points
    static let s1: CGFloat = 2
    /// 5 points
    static let s2: CGFloat = 5
    /// 10 points
    static let s3: CGFloat = 10
    /// 15 points
    static let s4: CGFloat = 15
    /// 20 points
    static let s5: CGFloat = 20
    /// 25 points
    static let s6: CGFloat = 25
    /// 30 points
    static let s7: CGFloat = 30
    /// 35 points
    static let s8: CGFloat = 35
    /// 40 points
    static let s9: CGFloat = 40
}
