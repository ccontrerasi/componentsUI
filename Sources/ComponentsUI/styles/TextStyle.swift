import SwiftUI
import Swinject

public struct TextStyle {
    var color: Color
    var font: Font
}

public enum TextStyleType {
    case head
    case title
    case subtitle
    case body
    
    case headClear
    case titleClear
    case subtitleClear
    case bodyClear

    public var style: TextStyle {
        let fontStyle = Injector.shared.resolve(FontStyleContract.self)
        switch self {
        case .head:
            return TextStyle(
                color: .black, font: fontStyle?.headline ?? .headline
            )
        case .title:
            return TextStyle(
                color: .black, font: fontStyle?.headline ?? .headline
            )
        case .subtitle:
            return TextStyle(
                color: .black, font: fontStyle?.subheadline ?? .subheadline
            )
        case .body:
            return TextStyle(
                color: .black, font: fontStyle?.body ?? .body
            )
        case .headClear:
            return TextStyle(
                color: .white, font: fontStyle?.headline ?? .headline
            )
        case .titleClear:
            return TextStyle(
                color: .white, font: fontStyle?.headline ?? .headline
            )
        case .subtitleClear:
            return TextStyle(
                color: .white, font: fontStyle?.subheadline ?? .subheadline
            )
        case .bodyClear:
            return TextStyle(
                color: .white, font: fontStyle?.body ?? .body
            )
        }
    }
}
