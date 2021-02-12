//
//  QuoteViewController.swift
//  Quotebook
//
//  Created by Nathalia Cardoso on 10/02/21.
//

import UIKit

class QuoteViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigationBar()

        //mock
        quoteLabel.numberOfLines = 0
        dataLabel.text = "11/02/2021"
        quoteLabel.text = "Acho que, se a gente pudesse correr sem nunca se cansar, nunca mais iria querer parar. Mas às vezes existem razões muito especiais para se parar."
        label.text = "- As Crônicas de Nárnia, página 1"
        //fim do mock
    }

    func setUpNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Deletar", style: .plain, target: self, action: #selector(deletQuote))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "actionColor")
    }

    @objc func deletQuote() {
        //something here
    }
}
