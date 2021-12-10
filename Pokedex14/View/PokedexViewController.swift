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
    private var pokedexViewModel = PokedexViewModel()
    
    lazy var pokedexUIView: PokedexUIView = {
        let view = PokedexUIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        pokedexViewModel.getPokemonList()
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController?.navigationBar.tintColor = .red
    }
    
    func initComponents() {
        addComponents()
        setAutolayout()
        setDelegates()
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
    
    func setDelegates() {
        pokedexViewModel.delegate = self
        pokedexUIView.delegate = self
    }
}

extension PokedexViewController: PokedexUIViewDelegate {
    func getPokemonType(text: String) {
        pokedexViewModel.getpokemonType(type: text)
    }
    
    func getpokemonDetail(pokemon: Pokemon) {
        pokedexCoordinator?.openPokedexDetail(pokemon: pokemon)
    }
    
    func getPokemon(text: String) {
        pokedexViewModel.getPokemonDetail(text)
    }
}

extension PokedexViewController: PokedexViewModelDelegate {
    func getPokemonDetail(pokemon: Pokemon) {
        pokedexUIView.pokemon = pokemon
        DispatchQueue.main.async {
            self.pokedexUIView.tableView.reloadData()
        }
    }
    
    func getPokemonList(pokemonList: PokemonList) {
        pokedexUIView.pokemonList = pokemonList
        DispatchQueue.main.async {
            self.pokedexUIView.tableView.reloadData()
        }
    }
    
    func getPokemonType(pokemon: PokemonType) {
        pokedexUIView.pokemonType = pokemon
        DispatchQueue.main.async {
            self.pokedexUIView.tableView.reloadData()
        }
    }
}
