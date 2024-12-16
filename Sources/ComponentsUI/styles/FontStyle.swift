import SwiftUI
import Swinject

public protocol FontStyleContract {
    var body: Font { get }
    var headline: Font { get }
    var subheadline: Font { get }
}

final class FontStyle: FontStyleContract {
    var body: Font = .body
    var headline: Font = .headline
    var subheadline: Font = .subheadline
}
