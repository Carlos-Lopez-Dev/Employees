
import UIKit
import Alamofire

class ProfilePageController: UIViewController {
    
    var user: User?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUser()
        backgroundView.layer.cornerRadius = 8.0
    }
    
    //Mustra los datos del usuario
    
    func loadUser() {
        if let user = user {
            nameLabel.text = user.name
            
            switch user.job {
                case "humanresources":
                    roleLabel.text = "Recursos humanos"
                    break
                case "employee":
                    roleLabel.text = "Empleados"
                    break
                case "executive":
                    roleLabel.text = "Ejecutivo"
                    break
                default:
                    roleLabel.text = user.job
            }
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.currencyCode = "EUR"
            let result = formatter.string(from: NSNumber(value: user.salary))
            
            salaryLabel.text = result
            descriptionText.text = user.biography
        }
    }
}
