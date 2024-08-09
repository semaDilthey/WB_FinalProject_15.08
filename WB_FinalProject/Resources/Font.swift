import SwiftUI

/*
 USAGE EXAMPLE:
 Text("Some text")
    .font(.wb(.body1))
 */

typealias WBFont = SFDisplayPro

enum SFDisplayPro {
    case heading1
    case heading2
    case subheading1
    case subheading2
    case body1
    case body2
    case metadata1
    case metadata2
    case metadata3
}

extension Font {
    
    static func wb(_ font: WBFont) -> Self {
        switch font {
        case .heading1:
            Font.system(size: 32, weight: .bold, design: .default)
        case .heading2:
            Font.system(size: 24, weight: .bold, design: .default)
        case .subheading1:
            Font.system(size: 18, weight: .semibold, design: .default)
        case .subheading2:
            Font.system(size: 16, weight: .semibold, design: .default)
        case .body1:
            Font.system(size: 14, weight: .semibold, design: .default)
        case .body2:
            Font.system(size: 14, weight: .thin, design: .default)
        case .metadata1:
            Font.system(size: 12, weight: .thin, design: .default)
        case .metadata2:
            Font.system(size: 10, weight: .thin, design: .default)
        case .metadata3:
            Font.system(size: 10, weight: .semibold, design: .default)
        }
    }
}
