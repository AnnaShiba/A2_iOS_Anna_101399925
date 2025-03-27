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
        descriptionLabel.text = product.desc
        priceLabel.text = String(format: "$%.2f", product.price)
        providerLabel.text = product.provider
    }

}

