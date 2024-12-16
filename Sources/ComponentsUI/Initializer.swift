import Swinject
public actor ComponentsUI {
    static func initialize() {
        let container = Container()
        container.register(FontStyleContract.self) { _ in FontStyle() }
    }
}
