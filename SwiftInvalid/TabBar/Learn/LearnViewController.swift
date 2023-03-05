//
//  LearnViewController.swift
//  SwiftInvalid
//
//  Created by admin on 06.02.2023.
//

import UIKit

class LearnViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Задаем имена для ключей UserDefaults
    let userDefaultsKey = "myUserDefaultsKey"
    
    var sections: [String] = [] // Для сохранения тем используем упорядоченный массив
    var cells: [String: [String]] = [:]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Загружаем данные из UserDefaults
        if let savedSections = UserDefaults.standard.array(forKey: "sections") as? [String],
           let savedCells = UserDefaults.standard.dictionary(forKey: "cells") as? [String: [String]] {
            self.sections = savedSections
            self.cells = savedCells
        }
        else {
            // Если данных в UserDefaults нет, то задаем их вручную
            self.sections = ["Основы", "Базовые операторы", "Строки и символы",
             "Типы коллекций", "Управление потоком", "Функции", "Замыкания",
                             "Перечкесления", "Сабскрипты", "Наследование",
                             "Инициализация", "Деинициализация", "Опциональная последовательность",
                             "Обработка ошибок", "Согласованность","Приведение типов",
                             "Вложенные типы", "Расширения", "Непрозрачные типы",
                             "Протоколы", "Универсальные шаблоны",
                             "Автоматический подсчет ссылок (ARC)", "Безопасность хранения",
                             "Контроль доступа","Продвинутые операторы"]
    
                             
                             
            self.cells = ["Основы": ["Переменные и Константы", "Типы данных", "Многострочные строки", "Логические типы"],
                          "Базовые операторы": ["Массивы", "Словари", "Кортежи"],
                          "Строки и символы": ["Арифметические операторы", "Операторы присваивания", "Интерполяция строк", ],
                          "Типы коллекций": [""],
                          "Управление потоком": ["for-in"],
                          "Функции": [""],
                          "Замыкания": [""],
                          "Перечкесления": [""],
                          "Структуры и классы": [""],
                          "Свойства": [""],
                          "Методы": [""],
                          "Сабскрипты": [""],
                          "Наследование": [""],
                          "Инициализация": [""],
                          "Деинициализация": [""],
                          "Опциональная последовательность": [""],
                          "Обработка ошибок": [""],
                          "Согласованность": [""],
                          "Приведение типов": [""],
                          "Вложенные типы": [""],
                          "Расширения": [""],
                          "Непрозрачные типы": [""],
                          "Протоколы": [""],
                          "Универсальные шаблоны": [""],
                          "Автоматический подсчет ссылок (ARC)": [""],
                          "Безопасность хранения": [""],
                          "Контроль доступа": [""],
                          "Продвинутые операторы": [""]]
            
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LearnTableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let theme = sections[section]
        return cells[theme]!.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LearnTableViewCell
        cell.menuName.font = UIFont(name: "Arial", size: 18)
        let theme = sections[indexPath.section]
        let subtheme = cells[theme]![indexPath.row]
        cell.menuName.text = subtheme // устанавливаем текст ячейки d
        return cell
        
   
    }
    

}
                                     
                                     
                            
