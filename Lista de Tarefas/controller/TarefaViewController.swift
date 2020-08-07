//
//  TarefaViewController.swift
//  Lista de Tarefas
//
//  Created by Petrus Souza on 02/08/20.
//  Copyright © 2020 Petrus Souza. All rights reserved.
//

import UIKit

class TarefaViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate  {

    var indice: Int? = nil
    var tarefaObj = Tarefa()
    @IBOutlet weak var tarefa: UITextField!
    
    var selectedPrioridade: String?
    var prioridades = Prioridade.allCases
    @IBOutlet weak var prioridade: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        dismissPickerView()
        if(indice != nil){
            self.title = "Editar tarefa"
            tarefaObj = Todo.getInstance().get(indice!)
            tarefa.text = tarefaObj.descricao
            prioridade.text = tarefaObj.prioridade.rawValue
        }else{
            self.title = "Nova tarefa"
        }
    }
    
    
    @IBAction func btnSalvarTarefa(_ sender: Any) {
        let tarefaDescricao: String? = tarefa.text
        
        if(tarefaDescricao == nil || tarefaDescricao?.trimmingCharacters(in: .whitespaces) == ""){
            exibirMensagem(msg: "Digite a tarefa e depois clique em salvar!")
            return
        }
        
        let prioridadeText = prioridade.text ?? ""
        let existePrioridade = prioridades.contains { (value) -> Bool in
            value.rawValue as String == prioridadeText
        }
        if(!existePrioridade){
            exibirMensagem(msg: "Prioridade da tarefa inválida!")
            return;
        }
        
        tarefaObj.descricao = tarefaDescricao!.trimmingCharacters(in: .whitespaces)
        tarefaObj.prioridade = Prioridade(rawValue: prioridadeText)!
        
        if(indice != nil){
            Todo.getInstance().modify(tarefa: tarefaObj, index: indice!)
        }else{
            Todo.getInstance().add(tarefaObj)
        }
        navigationController?.popViewController(animated: true)
    }
    
    private func exibirMensagem(msg: String){
        let alertController = UIAlertController(title: "Alerta", message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return prioridades.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return prioridades[row].rawValue
       
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPrioridade = prioridades[row].rawValue
        prioridade.text = selectedPrioridade
    }
    
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        prioridade.inputView = pickerView
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        prioridade.inputAccessoryView = toolBar
    }
    
    @objc func action() {
       view.endEditing(true)
    }

}
