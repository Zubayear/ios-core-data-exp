import UIKit

class GoalCell: UITableViewCell {
    
    @IBOutlet weak var goalDescription: UILabel!
    @IBOutlet weak var goalType: UILabel!
    @IBOutlet weak var goalProgress: UILabel!
    
    func configCell(goalDescription: String, goalType: GoalType, goalProgress: Int) {
        self.goalDescription.text = goalDescription
        self.goalType.text = goalType.rawValue
        self.goalProgress.text = String(describing: goalProgress)
    }
}
