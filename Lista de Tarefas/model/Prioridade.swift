//
//  Prioridade.swift
//  Lista de Tarefas
//
//  Created by Petrus Souza on 07/08/20.
//  Copyright © 2020 Petrus Souza. All rights reserved.
//

import Foundation
import UIKit


enum Prioridade: String, CaseIterable{
    case Alta = "Alta",
         Media = "Media",
         Baixa = "Baixa"
}

extension Prioridade {
    func getCor() -> CGColor{
        switch self {
        case .Alta:
            return UIColor.red.cgColor
        case .Media:
            return UIColor.yellow.cgColor
        default:
            return UIColor.green.cgColor
        }
    }
    
}
