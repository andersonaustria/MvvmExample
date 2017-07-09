import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    class func setup() {
        defaultContainer.register(ApiController.self, factory: { _ in
            ApiController()
        }).inObjectScope(.container)
        
        let apiController = defaultContainer.resolve(ApiController.self)
        
        if let apiController = apiController {
            defaultContainer.register(PostViewModel.self, factory: { _ in
                PostViewModel(apiController: apiController)
            })
        }
    }
    
    static func getContainer() -> Container {
        return defaultContainer
    }
    
}
