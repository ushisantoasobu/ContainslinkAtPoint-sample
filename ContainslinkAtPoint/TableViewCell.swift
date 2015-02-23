import UIKit

protocol tableViewCellDelegate {
    func tableViewCellLinkTapped(linkurl :String)
    func tableViewCellTapped(cell :TableViewCell)
}

class TableViewCell: UITableViewCell,
    TTTAttributedLabelDelegate,
    UIGestureRecognizerDelegate {

    @IBOutlet weak var label: TTTAttributedLabel!
    
    var delegate :tableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.label.delegate = self
        self.label.enabledTextCheckingTypes = NSTextCheckingType.Link.rawValue
        self.label.linkAttributes = [kCTForegroundColorAttributeName : UIColor.greenColor()]
        self.label.activeLinkAttributes = [kCTForegroundColorAttributeName : UIColor.orangeColor()]
        
        setupGesture()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupGesture() {
        let selector : Selector = "pressed:"
        let tapGesture = UITapGestureRecognizer(target: self, action: selector)
        tapGesture.delegate = self
        self.addGestureRecognizer(tapGesture)
    }
    
    func pressed(gestureRecognizer: UITapGestureRecognizer) {
        delegate?.tableViewCellTapped(self)
    }
    
    func setData(str :String) {
        label.text = str
    }
    
    // MARK: - TTTAttributedLabelDelegate
    
    func attributedLabel(label: TTTAttributedLabel!, didSelectLinkWithURL url: NSURL!) {
        self.delegate?.tableViewCellLinkTapped(url.absoluteString!)
    }
    
    // MARK: - UIGestureRecognizerDelegate
    
    override func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        return !self.label.containslinkAtPoint(touch.locationInView(self.label))
    }
    
}
