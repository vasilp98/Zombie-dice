import ZombieDiceLibrary

func createDependencyContainer() -> DependencyContainer {
    let container = DependencyContainer()

    container.register(Console() as IOProcessor)
    container.register(TurnFactory(ioProcessor: container.resolve()! as IOProcessor) as TurnFactoryProtocol)
    container.register(GameFactory(turnFactory: container.resolve()! as TurnFactoryProtocol, ioProcessor: container.resolve()! as IOProcessor) as GameFactoryProtocol)

    return container
}

let container = createDependencyContainer()
let application = Application(container: container)
application.start()


