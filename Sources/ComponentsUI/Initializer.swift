import Swinject
public actor ComponentsUi {
    public static func initialize() {
        let container = Container()
        container.register(FontStyleContract.self) { _ in FontStyle() }
    }
}
