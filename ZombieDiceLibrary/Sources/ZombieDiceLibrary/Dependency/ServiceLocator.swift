public final class ServiceLocator {
    private var services: [ObjectIdentifier: Any]
    
    public init() {
        self.services = [:]
    }

    public func register<T>(_ service: T) {
        services[key(for: T.self)] = service
    }
    
    public func resolve<T>() -> T? {
        return services[key(for: T.self)] as? T
    }

    private func key<T>(for type: T.Type) -> ObjectIdentifier {
        return ObjectIdentifier(T.self)
    }
}
