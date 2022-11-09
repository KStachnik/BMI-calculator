import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weightSlider.value = 100
        heightSlider.value = 1.5
    }

    @IBAction func heightSliderChange(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f", sender.value) + " m"
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        weightLabel.text = String(format: "%.0f", sender.value) + " kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let height = heightSlider.value
        let weight = weightSlider.value

        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.adviceText  = calculatorBrain.getAdvice()
            destinationVC.resultColor = calculatorBrain.getColor()
        }
    }
}

