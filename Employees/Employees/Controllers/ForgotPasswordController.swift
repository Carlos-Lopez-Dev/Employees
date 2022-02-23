
import UIKit
import Alamofire

class ForgotPasswordController: UIViewController {

    @IBOutlet weak var sendMailButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendMailButton.layer.cornerRadius = 8.0
        backgroundView.layer.cornerRadius = 8.0
    }
    
    //Manda un email con la nueva contraseña
    
    @IBAction func sendMailButton(_ sender: UIButton) {
        
        NetworkingHelper().newPassword(success: { msg in
            let alert = UIAlertController(title: "Mail sent succesfully", message: "The mail was sent succesfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }, failure: { msg in
            let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }, parameters: ["email": emailTextField.text!])
    }
}
