import Swinject

public protocol InjectorContract {
    func register<Service>(_ serviceType: Service.Type, _ implementation: Service)
    func resolve<Service>(_ serviceType: Service.Type) -> Service?
}

public class Injector: InjectorContract {
    private let container: Container
    public nonisolated(unsafe) static let shared: Injector = {
        let instance = Injector()
        return instance
    }()
    
    private init() {
        logger.debug("[ComponentsUI] Called to init")
        container = Container()
        register(FontStyleContract.self, FontStyle())
    }
    
    public func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        container.resolve(serviceType)
    }
    
    public func register<Service>(_ serviceType: Service.Type, _ implementation: Service) {
        logger.debug("[ComponentsUI] Called to register \(serviceType)")
        container.register(serviceType) { _ in
            implementation
        }
    }
}
