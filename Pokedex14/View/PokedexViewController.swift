//
//  PokedexViewController.swift
//  Pokedex14
//
//  Created by Raúl Leonardo Pavón Toral on 26/11/21.
//

import UIKit

class PokedexViewController: UIViewController {
    
    weak var pokedexCoordinator: PokedexCoordinator?
    private let factory: PokedexFactory
    
    lazy var pokedexUIView: PokedexUIView = {
        let view = PokedexUIView(frame: .zero)
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var viewModel: PokedexViewModel = {
        let viewModel = factory.makePokedexViewModel(view: self, pokedexRepository: PokedexRepository())
        return viewModel
    }()
    
    required init(factory: PokedexFactory, pokedexCoordinator: PokedexCoordinator) {
        self.factory = factory
        self.pokedexCoordinator = pokedexCoordinator
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
        viewModel.getPokemonList()
        view.backgroundColor = .red
        self.title = "Pokedex"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
    }
    
    func initComponents() {
        addComponents()
        setAutolayout()
    }
    
    func addComponents() {
        view.addSubview(pokedexUIView)
    }
    
    func setAutolayout() {
        NSLayoutConstraint.activate([
            pokedexUIView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pokedexUIView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            pokedexUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pokedexUIView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension PokedexViewController: PokedexUIViewDelegate {
    func getPokemon(text: String) {
        viewModel.getPokemonDetail(text)
    }
    
    func getPokemonType(text: String) {
        
    }
}

extension PokedexViewController: PokedexView {
    func setPokemonListType(pokemonType: PokemonType) {
        
    }
    
    func goToPokemonDetail(pokemon: Pokemon) {
        pokedexCoordinator?.openPokedexDetail(pokemon: pokemon)
    }
    
    
    func setPokemon(pokemon: Pokemon) {
        DispatchQueue.main.async {
            if !self.pokedexUIView.searchMode {
                self.goToPokemonDetail(pokemon: pokemon)
            } else {
                self.pokedexUIView.pokemon = pokemon
                self.pokedexUIView.tableView.reloadData()
            }
        }
    }
    
    func setPokemonList(pokemonList: [Results]) {
        pokedexUIView.pokemonList = pokemonList
        DispatchQueue.main.async {
            self.pokedexUIView.tableView.reloadData()
        }
    }
}
