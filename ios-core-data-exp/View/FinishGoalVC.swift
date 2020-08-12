import UIKit

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    func initData(goalDescription: String, goalType: GoalType) {
        self.goalDescription = goalDescription
        self.goalType = goalType
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
        pointsTextField.delegate = self
    }

    @IBAction func createGoalBtnPressed(_ sender: Any) {
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        pointsTextField.text = ""
        pointsTextField.textColor = #colorLiteral(red: 0.6394329667, green: 0.1201454774, blue: 0.3139832616, alpha: 1)
    }
}
