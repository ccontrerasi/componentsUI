import SwiftUI
import Swinject

public protocol FontStyleContract {
    var head: Font { get }
    var body: Font { get }
    var headline: Font { get }
    var subheadline: Font { get }
}

open class FontStyle: FontStyleContract {
    open var head: Font
    open var body: Font
    open var headline: Font
    open var subheadline: Font
    
    public init() {
        head = .headline
        body = .body
        headline = .headline
        subheadline = .subheadline
    }
}
