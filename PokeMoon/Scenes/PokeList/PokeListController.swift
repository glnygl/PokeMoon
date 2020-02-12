//
//  PokeListController.swift
//  PokeMoon
//
//  Created by Gülenay Gül on 22.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import UIKit

protocol PokeListDisplayLogic: class {
    func displayPokemons(viewModel: PokeListScene.Fetch.ViewModel)
    func displayPokemon()
}

final class PokeListController: UIViewController, PokeListDisplayLogic {
    
    var interactor: (PokeListBusinessLogic & PokeListDataStore)?
    var router: PokeListRoutingLogic?
    
    var pokemons: [Pokemon] {
        return interactor?.pokemons ?? []
    }
    
    @IBOutlet weak var pokeListCollectionView: UICollectionView! {
        didSet {
            pokeListCollectionView.register(types: [.PokeListCollectionCell])
            pokeListCollectionView.delegate = self
            pokeListCollectionView.dataSource = self
        }
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
    
    func setup(){
        #warning("viewcontroller should only now about interactor and the router other components needs to be initialized within eachother presenter inside the interactor and presenters delegate which is in this case the viewcontroller should be passed as an argument through the initializer of the interactor to init the presenter")
        // check https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template
        // completion handler version is kind of similar to your implementation if you want to check as well 
        // https://github.com/onurhuseyincantay/Clean-Swift-App
        let viewController = self
        let interactor = PokeListInteractor()
        let presenter = PokeListPresenter()
        let worker = PokeListWorker()
        let router = PokeListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = viewController
        router.viewController = viewController
    }
    
    func displayPokemons(viewModel: PokeListScene.Fetch.ViewModel) {
        pokeListCollectionView.reloadData()
    }
    
    func displayPokemon() {
        router?.navigatePokemon()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        interactor?.fetchPokemons(request: PokeListScene.Fetch.Request())
    }
}

extension PokeListController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeue(type: CellType.PokeListCollectionCell.rawValue, indexPath: indexPath) as? PokeListCollectionCell {
            cell.configure(pokemon: pokemons[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.size.width - 15.0) / 2.0
        let heigt = (5.0 * width) / 4.0
        return CGSize(width: width, height: heigt)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        interactor?.showPokemon(request: PokeListScene.Show.Request(index: indexPath.row))
    }
    
}
