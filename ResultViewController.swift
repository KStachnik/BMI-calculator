import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    var resultColor: UIColor?
    var adviceText: String?

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = bmiValue
        view.backgroundColor = resultColor
        adviceLabel.text = adviceText
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
 
}
