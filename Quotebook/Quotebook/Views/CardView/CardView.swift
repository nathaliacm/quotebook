//
//  CardView.swift
//  Quotebook
//
//  Created by Nathalia Cardoso on 09/02/21.
//

import UIKit

class CardView: UITableViewCell {

    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var aspas: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        quote.numberOfLines = 0
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
