//
//  PokemonTableViewCell.swift
//  Pokedex14
//
//  Created by Raúl Leonardo Pavón Toral on 27/11/21.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    enum PokemonTableViewCellConstraints {
        enum MainContainer {
            static let topMainContainer: CGFloat = 20
            static let leadingMainContainer: CGFloat = 20
            static let trailingMainContainer: CGFloat = -20
            static let bottomMaincontainer: CGFloat = -10
        }
        enum LbPokemonName {
            static let topLbPokemonName: CGFloat = 20
            static let leadingLbPokemonName: CGFloat = 20
        }
        enum ImgPokemon {
            static let topImgPokemon: CGFloat = 20
            static let heightImgPokemon: CGFloat = 20
            static let trailingImgPokemon: CGFloat = -20
        }
    }
    
    private lazy var mainContainer: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let lbPokemonName: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private let imgPokemon: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    static var identifier: String {
        return String(describing: self)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        initComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initComponents()
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
    }
    
    private func  addComponents() {
        addSubview(mainContainer)
        mainContainer.addSubview(imgPokemon)
        mainContainer.addSubview(lbPokemonName)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: topAnchor, constant: PokemonTableViewCellConstraints.MainContainer.topMainContainer),
            mainContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: PokemonTableViewCellConstraints.MainContainer.trailingMainContainer),
            mainContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: PokemonTableViewCellConstraints.MainContainer.leadingMainContainer),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: PokemonTableViewCellConstraints.MainContainer.bottomMaincontainer),
            
            lbPokemonName.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: PokemonTableViewCellConstraints.LbPokemonName.topLbPokemonName),
            lbPokemonName.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: PokemonTableViewCellConstraints.LbPokemonName.leadingLbPokemonName),
            
            imgPokemon.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: PokemonTableViewCellConstraints.ImgPokemon.topImgPokemon),
            imgPokemon.heightAnchor.constraint(equalToConstant: PokemonTableViewCellConstraints.ImgPokemon.heightImgPokemon),
            imgPokemon.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: PokemonTableViewCellConstraints.ImgPokemon.trailingImgPokemon),
        ])
    }
    
    func fillPokemonList(pokemon: String) {
        imgPokemon.isHidden = true
        lbPokemonName.text = pokemon
    }
    
    func fillDetailPokemon(pokemon: Pokemon) {
        imgPokemon.image = UIImage.getImageFromURL(imageString: pokemon.sprites.front_default)
        imgPokemon.isHidden = false
        lbPokemonName.text = pokemon.name
    }
}
