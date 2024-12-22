import SwiftUI
import Swinject

public protocol FontStyleContract {
    var body: Font { get }
    var headline: Font { get }
    var subheadline: Font { get }
}

open class FontStyle: FontStyleContract {
    open var body: Font
    open var headline: Font
    open var subheadline: Font
    
    public init() {
        body = .body
        headline = .headline
        subheadline = .subheadline
    }
}
