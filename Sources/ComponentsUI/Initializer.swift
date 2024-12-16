import Swinject
public actor ComponentsUI {
    public static func initialize() {
        let container = Container()
        container.register(FontStyleContract.self) { _ in FontStyle() }
    }
}
