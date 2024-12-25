import SwiftUI
import Swinject

public protocol FontStyleContract {
    var head: Font { get }
    var body: Font { get }
    var headline: Font { get }
    var subheadline: Font { get }
    var small: Font { get }
}

open class FontStyle: FontStyleContract {
    open var head: Font
    open var body: Font
    open var headline: Font
    open var subheadline: Font
    open var small: Font
    
    public init() {
        head = .headline
        body = .body
        headline = .headline
        subheadline = .subheadline
        small = .system(size: 10)
    }
}
