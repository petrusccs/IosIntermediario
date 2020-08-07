//
//  Todo.swift
//  Lista de Tarefas
//
//  Created by Petrus Souza on 02/08/20.
//  Copyright © 2020 Petrus Souza. All rights reserved.
//

import Foundation

class Todo {
    private static var instance: Todo? = nil
    private var lista: [Tarefa] = []
    
    static func getInstance() -> Todo {
        if(instance == nil){
            instance = Todo()
        }
        return instance!
    }
    
    func getLista() -> [Tarefa] {
        return lista
    }
    
    func get(_ index: Int) -> Tarefa{
        return lista[index]
    }
    func add(_ tarefa: Tarefa){
        lista.append(tarefa)
    }
    func modify(tarefa: Tarefa, index: Int){
        lista[index] = tarefa
    }
}
