//
//  PokedexUIView.swift
//  Pokedex14
//
//  Created by Raúl Leonardo Pavón Toral on 26/11/21.
//

import UIKit

protocol PokedexUIViewDelegate: AnyObject {
    func getPokemon(text: String)
    func getpokemonDetail(pokemon: Pokemon)
    func getPokemonType(text: String)
}

class PokedexUIView: UIView {
    
    enum PokedexUIViewConstraints {
        enum SearchBar {
            static let leadingSearchBar: CGFloat = 20
            static let trailingSearchBar: CGFloat = -20
            static let heightSearchBar: CGFloat = 60
        }
        enum TableView {
            static let leadingTableView: CGFloat = 20
            static let trailingTableView: CGFloat = -20
            static let bottomTableView: CGFloat = -16
        }
    }
    
    weak var delegate: PokedexUIViewDelegate?
    var pokemonList: PokemonList?
    var pokemon: Pokemon?
    var pokemonType: PokemonType?
    
    
    private lazy var mainContainer: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: .zero)
        let textFieldInsideUISearchbar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideUISearchbar?.textColor = .black
        textFieldInsideUISearchbar?.backgroundColor = .white
        textFieldInsideUISearchbar?.font = .systemFont(ofSize: 12)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = GlobalConstants.Pokedex.searchBarPlaceholder
        searchBar.delegate = self
        searchBar.keyboardType = .alphabet
        return searchBar
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: PokemonTableViewCell.identifier)
        tableView.separatorInset = .zero
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorStyle = .singleLine
        tableView.estimatedRowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initComponents() {
        addComponents()
        setAutolayout()
    }
    
    func addComponents() {
        addSubview(mainContainer)
        mainContainer.addSubview(searchBar)
        mainContainer.addSubview(tableView)
    }
    
    func setAutolayout() {
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: topAnchor),
            mainContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            searchBar.topAnchor.constraint(equalTo: mainContainer.topAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: PokedexUIViewConstraints.SearchBar.heightSearchBar),
            searchBar.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: PokedexUIViewConstraints.SearchBar.leadingSearchBar),
            searchBar.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: PokedexUIViewConstraints.SearchBar.trailingSearchBar),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: PokedexUIViewConstraints.TableView.leadingTableView),
            tableView.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor,constant: PokedexUIViewConstraints.TableView.trailingTableView),
            tableView.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor, constant: PokedexUIViewConstraints.TableView.bottomTableView)
        ])
    }
}

extension PokedexUIView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        delegate?.getPokemon(text: searchBar.text?.lowercased() ?? "")
    }
}

extension PokedexUIView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        !(searchBar.text?.isEmpty ?? false) ? 1 : pokemonList?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.identifier, for: indexPath) as? PokemonTableViewCell else {
            return UITableViewCell()
        }
        !(searchBar.text?.isEmpty ?? false) ? cell.fillDetailPokemon(pokemon: pokemon ?? Pokemon()) : cell.fillPokemonList(pokemon: pokemonList?.results[indexPath.row].name ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.getpokemonDetail(pokemon: pokemon ?? Pokemon())
    }
}
