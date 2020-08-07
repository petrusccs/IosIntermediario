//
//  TarefaTableViewCell.swift
//  Lista de Tarefas
//
//  Created by Petrus Souza on 03/08/20.
//  Copyright © 2020 Petrus Souza. All rights reserved.
//

import UIKit



class TarefaTableViewCell: UITableViewCell {

@IBOutlet weak var lbTarefa: UILabel!

    @IBOutlet weak var barraVertical: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
    func prepare(with tarefa: Tarefa) {
        lbTarefa.text = tarefa.descricao
        
        barraVertical.layer.backgroundColor = tarefa.prioridade.getCor()
        /*barraVertical.layer.backgroundColor = .init(srgbRed: TarefaTableViewCell.random(), green: TarefaTableViewCell.random(), blue: TarefaTableViewCell.random(), alpha: 1.0)*/
    }
    

}

