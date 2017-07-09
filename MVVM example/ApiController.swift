import Foundation
import RxSwift
import RxAlamofire

class ApiController {
    
    let disposeBag = DisposeBag()
    
    let FIRST_POST_ENDPOINT_URL = "https://jsonplaceholder.typicode.com/posts/1"
    
    func getFirstPost(success: @escaping (PostDto) -> Void, failure: @escaping (String) -> Void) {
        RxAlamofire.requestJSON(.get, FIRST_POST_ENDPOINT_URL)
            .observeOn(MainScheduler.instance)
            .map { (r, json) -> [String: Any] in
                guard let jsonDict = json as? [String: Any] else {
                    return [:]
                }
                
                return jsonDict
            }
            .subscribe(onNext: { jsonDict in
                let postDto = PostDto(jsonDict: jsonDict)
                success(postDto)
            }, onError: { error in
                failure("Error")
            })
            .disposed(by: disposeBag)
    }
    
}
