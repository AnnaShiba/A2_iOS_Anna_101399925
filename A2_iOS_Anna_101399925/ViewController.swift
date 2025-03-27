//
//  ViewController.swift
//  A2_iOS_Anna_101399925
//
//  Created by Anna on 26.03.25.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var providerLabel: UILabel!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var products: [Product] = []
    var currentIndex = 0

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchProducts()
        updateView()
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(doSwipe(_:)))
        view.addGestureRecognizer(swipe)
    }
    
    func fetchProducts() {
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        do {
            products = try context.fetch(request)
        } catch {
            print("Failed to fetch products: \(error)")
        }
    }

    func updateView() {
        let product = products[currentIndex]
        nameLabel.text = product.name
        idLabel.text = product.id?.uuidString
        descriptionLabel.text = product.desc
        priceLabel.text = String(format: "$%.2f", product.price)
        providerLabel.text = product.provider
        
        prevButton.isEnabled = currentIndex > 0
        nextButton.isEnabled = currentIndex < products.count - 1
    }
    
    @objc func doSwipe(_ gesture: UISwipeGestureRecognizer) {
        if currentIndex < products.count - 1 {
            currentIndex += 1
            updateView()
        }
    }

    @IBAction func prevTapped(_ sender: UIButton) {
        if currentIndex > 0 {
            currentIndex -= 1
            updateView()
        }
    }

    @IBAction func nextTapped(_ sender: UIButton) {
        if currentIndex < products.count - 1 {
            currentIndex += 1
            updateView()
        }
    }
}

