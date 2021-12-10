//
//  PokedexDetailUIView.swift
//  Pokedex14
//
//  Created by Raúl Leonardo Pavón Toral on 27/11/21.
//

import UIKit
import Foundation

class PokedexDetailUIView: UIView {

    enum PokedexDetailUIViewConstraints {
        enum LbPokemonName {
            static let topLbPokemonName: CGFloat = 25
            static let leadingLbPokemonName: CGFloat = 25
        }
        enum LbPokemonNumber {
            static let topLbPokemonNumber: CGFloat = 25
            static let trailingLbPokemonNumber: CGFloat = -25
        }
        enum ImgPokemon {
            static let topImgPokemon: CGFloat = 50
            static let leadingImgPokemon: CGFloat = 25
            static let heightImgPokemon: CGFloat = 20
        }
        enum ImgPokemonShiny {
            static let topImgPokemonShiny: CGFloat = 50
            static let trailingImgPokemonShiny: CGFloat = -25
            static let heightImgPokemonShiny: CGFloat = 20
        }
        enum BtnPokemonType1 {
            static let topBtnPokemonType1: CGFloat = 50
            static let leadingBtnPokemonType1: CGFloat = 25
        }
        enum BtnPokemonType2 {
            static let topBtnPokemonType2: CGFloat = 50
            static let leadingBtnPokemonType2: CGFloat = 5
        }
        enum LbPokemonStats {
            static let trailingLbPokemonStats: CGFloat = -25
        }
    }
    
    private lazy var mainContainer: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
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
    
    private let lbPokemonNumber: UILabel = {
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
    
    private let imgPokemonShiny: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let btnPokemonType1: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        return button
    }()
    
    private let btnPokemonType2: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        return button
    }()
    
    private let lbPokemonStats: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        return label
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
        mainContainer.addSubview(lbPokemonName)
        mainContainer.addSubview(lbPokemonNumber)
        mainContainer.addSubview(imgPokemon)
        mainContainer.addSubview(imgPokemonShiny)
        mainContainer.addSubview(btnPokemonType1)
        mainContainer.addSubview(btnPokemonType2)
        mainContainer.addSubview(lbPokemonStats)
    }
    
    func setAutolayout() {
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: topAnchor),
            mainContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            lbPokemonName.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: PokedexDetailUIViewConstraints.LbPokemonName.topLbPokemonName),
            lbPokemonName.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: PokedexDetailUIViewConstraints.LbPokemonName.leadingLbPokemonName),
            
            lbPokemonNumber.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: PokedexDetailUIViewConstraints.LbPokemonNumber.topLbPokemonNumber),
            lbPokemonNumber.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: PokedexDetailUIViewConstraints.LbPokemonNumber.trailingLbPokemonNumber),
            
            imgPokemon.topAnchor.constraint(equalTo: lbPokemonName.bottomAnchor, constant: PokedexDetailUIViewConstraints.ImgPokemon.topImgPokemon),
            imgPokemon.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: PokedexDetailUIViewConstraints.ImgPokemon.leadingImgPokemon),
            imgPokemon.heightAnchor.constraint(equalToConstant: PokedexDetailUIViewConstraints.ImgPokemon.heightImgPokemon),
            
            imgPokemonShiny.topAnchor.constraint(equalTo: lbPokemonNumber.bottomAnchor, constant: PokedexDetailUIViewConstraints.ImgPokemonShiny.topImgPokemonShiny),
            imgPokemonShiny.trailingAnchor.constraint(equalTo: trailingAnchor, constant: PokedexDetailUIViewConstraints.ImgPokemonShiny.trailingImgPokemonShiny),
            imgPokemonShiny.heightAnchor.constraint(equalToConstant: PokedexDetailUIViewConstraints.ImgPokemonShiny.heightImgPokemonShiny),
            
            btnPokemonType1.topAnchor.constraint(equalTo: imgPokemon.bottomAnchor, constant: PokedexDetailUIViewConstraints.BtnPokemonType1.topBtnPokemonType1),
            btnPokemonType1.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: PokedexDetailUIViewConstraints.BtnPokemonType1.leadingBtnPokemonType1),
            
            btnPokemonType2.topAnchor.constraint(equalTo: imgPokemon.bottomAnchor, constant: PokedexDetailUIViewConstraints.BtnPokemonType2.topBtnPokemonType2),
            btnPokemonType2.leadingAnchor.constraint(equalTo: btnPokemonType1.trailingAnchor, constant: PokedexDetailUIViewConstraints.BtnPokemonType2.leadingBtnPokemonType2),
            
            lbPokemonStats.topAnchor.constraint(equalTo: btnPokemonType1.topAnchor),
            lbPokemonStats.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant:  PokedexDetailUIViewConstraints.LbPokemonStats.trailingLbPokemonStats),
        ])
    }
    
    func fillPokemonDetail(pokemon: Pokemon) {
        lbPokemonName.text = "Name: \(pokemon.name)"
        lbPokemonNumber.text = "Number: \(pokemon.id)"
        imgPokemon.image =  UIImage.getImageFromURL(imageString: pokemon.sprites.front_default)
        imgPokemonShiny.image = UIImage.getImageFromURL(imageString: pokemon.sprites.front_shiny)
        
        setPokemonType(types: pokemon.types)
        
        lbPokemonStats.text = setPokemonStats(stats: pokemon.stats)
    }
    
    func setPokemonType(types: [Types]) {
        for i in 0...types.count - 1 {
            if i == 1  {
                btnPokemonType1.setTitle(types[i].type.name, for: .normal)
                btnPokemonType1.backgroundColor = setTypeColor(type: types[i].type.name)
            } else {
                btnPokemonType2.setTitle(types[i].type.name, for: .normal)
                btnPokemonType2.backgroundColor = setTypeColor(type: types[i].type.name)
            }
        }
    }
    
    func setPokemonStats(stats: [Stats]) -> String {
        var stringStat = ""
        for i in 0...stats.count - 1 {
            stringStat += "\(stats[i].stat.name): \(stats[i].base_stat)\n"
        }
        return stringStat
    }
    
    func setTypeColor(type: String) -> UIColor {
        switch type {
        case GlobalConstants.Pokedex.PokemonType.bug.rawValue:
            return UIColor(hex: GlobalConstants.Pokedex.TypeColor.bug.rawValue)
        case GlobalConstants.Pokedex.PokemonType.dark.rawValue:
            return UIColor(hex: GlobalConstants.Pokedex.TypeColor.dark.rawValue)
        case GlobalConstants.Pokedex.PokemonType.dragon.rawValue:
            return UIColor(hex: GlobalConstants.Pokedex.TypeColor.dragon.rawValue)
        case GlobalConstants.Pokedex.PokemonType.electric.rawValue:
            return UIColor(hex: GlobalConstants.Pokedex.TypeColor.electric.rawValue)
        case GlobalConstants.Pokedex.PokemonType.fairy.rawValue:
            return UIColor(hex: GlobalConstants.Pokedex.TypeColor.fairy.rawValue)
        case GlobalConstants.Pokedex.PokemonType.fighting.rawValue:
            return UIColor(hex: GlobalConstants.Pokedex.TypeColor.fighting.rawValue)
        case GlobalConstants.Pokedex.PokemonType.fire.rawValue:
            return UIColor(hex: GlobalConstants.Pokedex.TypeColor.fire.rawValue)
        case GlobalConstants.Pokedex.PokemonType.flying.rawValue:
            return UIColor(hex: GlobalConstants.Pokedex.TypeColor.flying.rawValue)
        case GlobalConstants.Pokedex.PokemonType.ghost.rawValue:
            return UIColor(hex: GlobalConstants.Pokedex.TypeColor.ghost.rawValue)
        case GlobalConstants.Pokedex.PokemonType.grass.rawValue:
            return UIColor(hex: GlobalConstants.Pokedex.TypeColor.grass.rawValue)
        case GlobalConstants.Pokedex.PokemonType.ground.rawValue:
            return UIColor(hex: GlobalConstants.Pokedex.TypeColor.ground.rawValue)
        case GlobalConstants.Pokedex.PokemonType.ice.rawValue:
            return UIColor(hex: GlobalConstants.Pokedex.TypeColor.ice.rawValue)
        case GlobalConstants.Pokedex.PokemonType.normal.rawValue:
            return UIColor(hex: GlobalConstants.Pokedex.TypeColor.normal.rawValue)
        case GlobalConstants.Pokedex.PokemonType.poison.rawValue:
            return UIColor(hex: GlobalConstants.Pokedex.TypeColor.poison.rawValue)
        case GlobalConstants.Pokedex.PokemonType.psychic.rawValue:
            return UIColor(hex: GlobalConstants.Pokedex.TypeColor.psychic.rawValue)
        case GlobalConstants.Pokedex.PokemonType.rock.rawValue:
            return UIColor(hex: GlobalConstants.Pokedex.TypeColor.rock.rawValue)
        case GlobalConstants.Pokedex.PokemonType.steel.rawValue:
            return UIColor(hex: GlobalConstants.Pokedex.TypeColor.steel.rawValue)
        case GlobalConstants.Pokedex.PokemonType.water.rawValue:
            return UIColor(hex: GlobalConstants.Pokedex.TypeColor.water.rawValue)
        default:
            break
        }
        return UIColor()
    }
    
    func setTypeButtonTarget(target: Any?, action: Selector) {
        btnPokemonType1.addTarget(target, action: action, for: .touchUpInside)
        btnPokemonType2.addTarget(target, action: action, for: .touchUpInside)
    }
}
