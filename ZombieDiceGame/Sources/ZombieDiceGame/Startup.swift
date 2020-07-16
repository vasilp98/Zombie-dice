import ZombieDiceLibrary

class Startup {
    static func Configure() -> DependencyContainerProtocol {
        let container = DependencyContainer()
        container.configureDefault()

        return container
    }
}