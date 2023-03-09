
import UIKit

class LearnViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Properties
    var userDefaultsKey: String?
    var theme: String?
    var sections: [String] = []
    var cells: [String: [String]] = [:]
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        enum UserDefaultsKeys: String {
            case sections
            case cells
        }

        // Затем использовать так:
        if let savedSections = UserDefaults.standard.array(forKey: "\(UserDefaultsKeys.sections.rawValue)") as? [String],
            let savedCells = UserDefaults.standard.dictionary(forKey: "\(UserDefaultsKeys.cells.rawValue)") as? [String: [String]] {
            self.sections = savedSections
            self.cells = savedCells
        }

        tableView.register(LearnTableViewCell.self, forCellReuseIdentifier: "cell")

        if self.sections.isEmpty {
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
    
    // MARK: - Table view data source
       
       func numberOfSections(in tableView: UITableView) -> Int {
           return sections.count
       }
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionName = sections[section]
        return cells[sectionName]?.count ?? 0
    }

       func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           return sections[section]
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? LearnTableViewCell else {
            return UITableViewCell()
        }
        let sectionName = sections[indexPath.section]
        let cellName = cells[sectionName]?[indexPath.row] ?? ""
        cell.textLabel?.text = cellName
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionName = sections[indexPath.section]
        let cellName = cells[sectionName]?[indexPath.row] ?? ""
        let lectureVC = LectureViewController() // создаем новый экран LectureViewController
        lectureVC.cellTitle = cellName // передаем заголовок ячейки на новый экран
        navigationController?.pushViewController(lectureVC, animated: true) // выполняем переход на новый экран
    }


   }
                                     
                            
