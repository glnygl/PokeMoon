//
//  PokeDetailController.swift
//  PokeMoon
//
//  Created by Gülenay Gül on 22.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import UIKit

protocol PokeDetailDisplayLogic {
    func displayPokemon(viewModel: PokeDetailScene.Show.ViewModel)
}

final class PokeDetailController: UIViewController, PokeDetailDisplayLogic {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var typeButton: UIButton!
    @IBOutlet weak var weaknessButton: UIButton!
    
    
    var interactor: (PokeDetailBusinessLogic & PokeDetailDataStore)?
    var router: PokeDetailRoutingLogic?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        interactor?.showPokemon()
        typeButton.setTitleColor(.darkGray, for: .normal)
        weaknessButton.setTitleColor(.lightGray, for: .normal)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bottomView.roundCorners([.topLeft, .topRight], radius: 40.0)
    }

    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
      super.init(coder: aDecoder)
      setup()
    }
    
    func setup() {
        let viewController = self
        let interactor = PokeDetailInteractor()
        let presenter = PokeDetailPresenter()
        let worker = PokeDetailWorker()
        let router = PokeDetailRouter()
        self.interactor = interactor
        self.router = router
        interactor.worker = worker
        interactor.presenter = presenter
        presenter.controller = viewController
        router.controller = viewController
    }
    
    func setupScrollView(){
        
        self.scrollView.frame = CGRect(x: 0, y: self.scrollView.frame.origin.y, width: self.view.frame.size.width, height: self.view.frame.size.height - self.scrollView.frame.origin.y)
        
        
        let pokeTypeVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PokeTypeController") as! PokeTypeController
        pokeTypeVC.interactor?.type = self.interactor?.pokemon?.type
        let pokeWeakVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PokeWeaknessController") as! PokeWeaknessController
        pokeWeakVC.interactor?.weakness = self.interactor?.pokemon?.weaknesses
        
        let viewControllers = [pokeTypeVC, pokeWeakVC]
        let widthSize = CGFloat(viewControllers.count) *  UIScreen.main.bounds.width
        let size = CGSize(width: widthSize, height: 0)
        self.scrollView.contentSize = size
        var pageIndex = 0
        for childController in viewControllers {
            let x = CGFloat(pageIndex) *  UIScreen.main.bounds.width
            self.addChild(childController)
            let frameVC = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: scrollView.frame.size.height)
            childController.view.frame = frameVC
            childController.view.frame.origin.x = x
            scrollView.addSubview(childController.view)
            pageIndex += 1
        }
    }
    
    func displayPokemon(viewModel: PokeDetailScene.Show.ViewModel) {
        nameLabel.text = viewModel.data.name
        if let img = viewModel.data.img as NSString?, let cacheimg = Cache.shared.object(forKey: img) {
            contentImageView.image = cacheimg
        }        
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func typeButtonAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            self.typeButton.setTitleColor(.darkGray, for: .normal)
            self.weaknessButton.setTitleColor(.lightGray, for: .normal)
            self.lineView.frame.origin.x = self.typeButton.frame.origin.x
            self.scrollToPage(index: 0)
        }
    }
    
    @IBAction func weaknessButtonAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            self.typeButton.setTitleColor(.lightGray, for: .normal)
            self.weaknessButton.setTitleColor(.darkGray, for: .normal)
            self.lineView.frame.origin.x = self.weaknessButton.frame.origin.x
            self.scrollToPage(index: 1)
        }
    }
    
    func scrollToPage(index: Int) {
        let offset: CGPoint = CGPoint(x: CGFloat(index) * self.scrollView.frame.size.width, y: 0)
        DispatchQueue.main.async {
          self.scrollView.setContentOffset(offset, animated: true)
        }
        
    }
    
}
