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
            static let topLbPokemonName: CGFloat = 5
            static let leadingLbPokemonName: CGFloat = 20
        }
        enum ImgPokemon {
            static let topImgPokemon: CGFloat = 5
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
            mainContainer.topAnchor.constraint(equalTo: topAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            lbPokemonName.topAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.topAnchor, constant: PokemonTableViewCellConstraints.LbPokemonName.topLbPokemonName),
            lbPokemonName.leadingAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.leadingAnchor, constant: PokemonTableViewCellConstraints.LbPokemonName.leadingLbPokemonName),
            lbPokemonName.bottomAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            
            imgPokemon.topAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.topAnchor, constant: PokemonTableViewCellConstraints.ImgPokemon.topImgPokemon),
            imgPokemon.trailingAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.trailingAnchor, constant: PokemonTableViewCellConstraints.ImgPokemon.trailingImgPokemon),
            imgPokemon.bottomAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.bottomAnchor, constant: -5)
        ])
    }
    
    func fillPokemonList(pokemon: String) {
        imgPokemon.isHidden = true
        lbPokemonName.text = pokemon
    }
    
    func fillDetailPokemon(pokemon: Pokemon) {
        imgPokemon.image = UIImage.getImageFromURL(imageString: pokemon.sprites.frontDefault)
        imgPokemon.isHidden = false
        lbPokemonName.text = pokemon.name
    }
}
