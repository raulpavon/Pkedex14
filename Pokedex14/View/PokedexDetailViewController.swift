//
//  PokedexDetailViewController.swift
//  Pokedex14
//
//  Created by Raúl Leonardo Pavón Toral on 28/11/21.
//

import UIKit

class PokedexDetailViewController: UIViewController {
    
    weak var pokedexCoordinator: PokedexCoordinator?
    private let factory: PokedexFactory
    private var pokemon: Pokemon?
    
    lazy var pokedexDetailUIView: PokedexDetailUIView = {
        let view = PokedexDetailUIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var viewModel: PokedexViewModel = {
        let viewModel = factory.makePokedexViewModel(view: self, pokedexRepository: PokedexRepository())
        return viewModel
    }()
    
    required init(factory: PokedexFactory, pokedexCoordinator: PokedexCoordinator, pokemon: Pokemon) {
        self.factory = factory
        self.pokedexCoordinator = pokedexCoordinator
        self.pokemon = pokemon
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        initComponents()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        self.title = "Pokedex"
        self.navigationItem.hidesBackButton = true
        let backButton =  UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(backPressed(sender:)))
        backButton.tintColor = .white
        backButton.image = UIImage()
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    func initComponents() {
        addComponents()
        setAutolayout()
        addTargets()
        pokedexDetailUIView.fillPokemonDetail(pokemon: pokemon ?? Pokemon())
    }
    
    func addComponents() {
        view.addSubview(pokedexDetailUIView)
    }
    
    func setAutolayout() {
        NSLayoutConstraint.activate([
            pokedexDetailUIView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pokedexDetailUIView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            pokedexDetailUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pokedexDetailUIView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func addTargets() {
        pokedexDetailUIView.setTypeButtonTarget(target: self, action: #selector(getType(_:)))
    }
    
    @objc func getType(_ sender: UIButton) {
        viewModel.getpokemonType(type: sender.titleLabel?.text ?? "")
    }
    
    @objc func backPressed(sender: UIBarButtonItem) {
        pokedexCoordinator?.start()
    }
}

extension PokedexDetailViewController: PokedexView {
    func setPokemonListType(pokemonType: PokemonType) {
        
    }
    
    func goToPokemonDetail(pokemon: Pokemon) {
        
    }
    
    func setPokemon(pokemon: Pokemon) {
        
    }
    
    func setPokemonList(pokemonList: [Results]) {
        
    }
}
