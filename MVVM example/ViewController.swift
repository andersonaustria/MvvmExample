import UIKit
import RxSwift
import RxCocoa
import Swinject
import SwinjectStoryboard

class ViewController: UIViewController {

    @IBOutlet weak var postIdLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var viewModel: PostViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initInjections()
        bindObservables()
        viewModel?.fetchFirstPost()
    }
    
    private func bindObservables() {
        _ = viewModel?.userId.asObservable().bind(to: postIdLabel.rx.text)
        _ = viewModel?.title.asObservable().bind(to: titleLabel.rx.text)
        _ = viewModel?.body.asObservable().bind(to: bodyLabel.rx.text)
        _ = viewModel?.id.asObservable().bind(to: idLabel.rx.text)
    }
    
    private func initInjections() {
        viewModel = SwinjectStoryboard.getContainer().resolve(PostViewModel.self)
    }

}
