import UIKit

class GoalVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addGoalBtnPressed(_ sender: Any) {
        print("Debug: Goal Btn pressed")
    }
    
}

