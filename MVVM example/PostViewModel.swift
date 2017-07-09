import RxSwift
import RxCocoa

class PostViewModel {
    
    let apiController: ApiController
    let userId = Variable<String>("")
    let title = Variable<String>("")
    let id = Variable<String>("")
    let body = Variable<String>("")
    
    private var postDto: PostDto {
        willSet {
            userId.value = "[USER ID]\n\(newValue.userId)"
            title.value = "[TITLE]\n\(newValue.title)"
            id.value = "[ID]\n\(newValue.id)"
            body.value = "[BODY]\n\(newValue.body)"
        }
    }
    
    init(apiController: ApiController) {
        self.apiController = apiController
        self.postDto = PostDto()
    }
    
    func fetchFirstPost() {
        apiController.getFirstPost(success: { postDto in
            self.postDto = postDto
        }, failure:  { errorMsg in
            print(errorMsg)
        })
    }
    
}
