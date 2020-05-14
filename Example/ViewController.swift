import UIKit

class ViewController: UIViewController {
   
   @IBOutlet weak var imageView: UIImageView?
   
   // MARK: -
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      clear()
      downloadImages()
   }
   
   // MARK: -
   
   private func downloadImages() {
      DEImageDepot.shared.image(withPath: "http://golyash.com/images/dec.jpg") { [weak self] (image) in
         self?.imageView?.image = image
      }
   }
   
   private func clear() {
      DEImageDepot.shared.clear()
   }
}
