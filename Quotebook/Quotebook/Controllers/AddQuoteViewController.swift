//
//  AddQuoteViewController.swift
//  Quotebook
//
//  Created by Nathalia Cardoso on 10/02/21.
//

import UIKit

class AddQuoteViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var quoteTextView: UITextView!
    @IBOutlet weak var livroTextView: UITextView!
    @IBOutlet weak var paginaTextView: UITextView!
    var nome = "livro"
    var placeholder = ""

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Adicionar quote"

        quoteTextView.delegate = self
        livroTextView.delegate = self
        paginaTextView.delegate = self

        addPlaceholder(textView: quoteTextView, text: "Escreva seu quote aqui ou tire uma foto para identificarmos o texto")
        addPlaceholder(textView: livroTextView, text: "Digite o nome do livro")
        addPlaceholder(textView: paginaTextView, text: "Digite a página")

        setUpSegmentedControl()

    }

    @IBAction func indexChage(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            paginaTextView.isHidden = false
            if livroTextView.text == "Digite o nome do autor" {
                livroTextView.text = "Digite o nome do livro"
            }
            nome = "livro"
        case 1:
            paginaTextView.isHidden = true
            if livroTextView.text == "Digite o nome do livro" {
                livroTextView.text = "Digite o nome do autor"
            }
            nome = "autor"
        default:
            break
        }

    }

    func addPlaceholder(textView: UITextView, text: String) {
        textView.text = text
        textView.textColor = UIColor(named: "placeholderColor")
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor(named: "placeholderColor") {
            textView.text = nil
            textView.textColor = UIColor(named: "textColor")
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            switch textView.restorationIdentifier {
            case "quote":
                placeholder = "Escreva seu quote aqui ou tire uma foto para identificarmos o texto"
            case "nome":
                placeholder = "Digite o nome do \(nome)"
            case "pagina":
                placeholder = "Digite a página"
            default:
                placeholder = ""
            }

            textView.text = placeholder
            textView.textColor = UIColor(named: "placeholderColor")
        }
    }

    func setUpSegmentedControl() {
        segmentedControl.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        segmentedControl.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor: UIColor(named: "textColor") ?? UIColor.white], for: .normal)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //dismi
    }
}
