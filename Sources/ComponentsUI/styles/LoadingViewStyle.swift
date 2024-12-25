import SwiftUI
import Swinject

public struct LoadingViewStyle {
    var strokeColor: Color
    var strokeWidth: CGFloat
    var size: CGFloat
    var textColor: Color
    var font: Font
    var cornerRadius: CGFloat
    var colorBackground: Color
}

public enum LoadingViewStyleType {
    case primary
    
    public var style: LoadingViewStyle {
        let fontStyle = Injector.shared.resolve(FontStyleContract.self)
        switch self {
        case .primary:
            return LoadingViewStyle(strokeColor: .black,
                                    strokeWidth: 2,
                                    size: 75,
                                    textColor: .black.opacity(8),
                                    font: fontStyle?.small ?? .body,
                                    cornerRadius: 8,
                                    colorBackground: .black.opacity(0.5))
        }
    }
}
