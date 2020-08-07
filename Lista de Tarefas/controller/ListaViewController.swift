//
//  ListaViewController.swift
//  Lista de Tarefas
//
//  Created by Petrus Souza on 01/08/20.
//  Copyright © 2020 Petrus Souza. All rights reserved.
//

import UIKit

class ListaViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnAdd: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        configureBotao()
    }
    
    private func configureBotao() {
        btnAdd.layer.cornerRadius = 25
        btnAdd.layer.masksToBounds = true
        btnAdd.layer.borderColor = UIColor.lightGray.cgColor
        btnAdd.layer.borderWidth = 2
    }
    @IBAction func btnAddTarefa(_ sender: Any) {
        let viewController = TarefaViewController(nibName: "TarefaViewController", bundle: nil)
        navigationController?.pushViewController(viewController, animated: true)
    }
    @IBAction func btnEditarTarefa(_ sender: UIButton) {
       var superview = sender.superview
       while let view = superview, !(view is UITableViewCell) {
          superview = view.superview
       }
       let cell = superview as! UITableViewCell
       let indexPath = tableView.indexPath(for: cell)
       if indexPath != nil {
            let viewController = TarefaViewController(nibName: "TarefaViewController", bundle: nil)
            viewController.indice = indexPath!.row
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}

extension ListaViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Todo.getInstance().getLista().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TarefaTableViewCell
        let tarefa = Todo.getInstance().get(indexPath.row)
        cell.prepare(with: tarefa)
        return cell
    }
}




