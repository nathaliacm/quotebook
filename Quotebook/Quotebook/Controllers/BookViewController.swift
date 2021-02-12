//
//  ViewController.swift
//  Quotebook
//
//  Created by Nathalia Cardoso on 08/02/21.
//
// swiftlint:disable force_cast
import UIKit

class BookViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let quoteCellReuseIdentifier = "quoteCellReuseIdentifier"

    let quotes = [
        "I always was a crybaby, wasn’t I",
        "Do not worry about me. Someone has to take care of these flowers.",
        "They were the one that wanted to... ...to use our full power. I was the one that resisted. And then, because of me, we... Well, that's why I ended up a flower",
        "But I can feel every other monster's as well. They all care about each other so much. And... they care about you too, Frisk. I wish I could tell you how everyone feels about you.",

        "As a flower, I was soulless. I lacked the power to love other people. However, with everyone's souls inside me... I not only have my own compassion back... But I can feel every other monster's as well."
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpTableView()
    }

    func setUpNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.prefersLargeTitles = true
        //navigationController?.navigationItem.largeTitleDisplayMode = .automatic
    }

    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }

    func setUpTableView() {
        self.tableView.register(UINib(nibName: String(describing: CardView.self), bundle: nil), forCellReuseIdentifier: quoteCellReuseIdentifier)
        self.tableView.rowHeight  = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 80
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

}

extension BookViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: quoteCellReuseIdentifier, for: indexPath) as! CardView
        cell.quote.text = quotes[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "quoteViewSegue", sender: .none)
    }

}
