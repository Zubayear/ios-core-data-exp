import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

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
        
        if pointsTextField != nil {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    func save(compeletion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        let goal = Goal(context: managedContext)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompeletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            compeletion(true)
        } catch {
            debugPrint("Could not save: \(error.localizedDescription)")
            compeletion(false)
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        pointsTextField.text = ""
        pointsTextField.textColor = #colorLiteral(red: 0.6394329667, green: 0.1201454774, blue: 0.3139832616, alpha: 1)
    }
}
