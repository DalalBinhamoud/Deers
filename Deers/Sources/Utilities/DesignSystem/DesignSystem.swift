import Foundation
import SwiftUI

public class DesignSystem {
    enum Colors {
        static let primaryColor = Color(hex: "#ba952a")
        static let secondaryColor = Color(red: 0.01568627450980392, green: 0.1411764705882353, blue: 0.29411764705882354)
        static let labelColor = Color.white
    }

    enum customFontSize {
        static let largeTxt: CGFloat = 30
        static let title: CGFloat = 24
        static let subtitle: CGFloat = 18
    }

    enum CornerRadius {
        static let small = 8
        static let medium = 16
        static let big = 32
    }

    enum Spacing {
        static let small = 8
        static let medium = 16
        static let big = 24
    }
}


