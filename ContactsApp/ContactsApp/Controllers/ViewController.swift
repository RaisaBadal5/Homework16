//
//  ViewController.swift
//  ContactsApp
//
//  Created by Default on 12.04.24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let mainView: UIView = {
        let mv = UIView()
        mv.translatesAutoresizingMaskIntoConstraints = false
        return mv
    }()
    
    let stackForSquad: UIStackView = {
       let st = UIStackView()
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    let labelForSquad: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let stackForIcon: UIStackView = {
        let st = UIStackView()
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    let imageForIcon: UIImageView = {
        let im = UIImageView()
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    let stackForName: UIStackView = {
        let st = UIStackView()
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    let stackForSymbol: UIStackView = {
        let st = UIStackView()
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    let labelForName: UILabel = {
        let im = UILabel()
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    let symbolstack: UIStackView = {
        let sm = UIStackView()
        sm.translatesAutoresizingMaskIntoConstraints = false
        return sm
    }()
    
    let symbolView: UIImageView = {
        let sm = UIImageView()
        sm.translatesAutoresizingMaskIntoConstraints = false
        return sm
    }()
    
    
    
    let tableViewForName: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tb
    }()
    var titleForSection = Array(Set(developers.map{ String($0.name.prefix(1)) }))

    
    var developersDict = [String: [String]]()
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        addMainView()
        addStackForSquad()
        addLabelForSquad()
        loadStackForIcon()
        loadIconImage()
       // loadalphabetSlider()
        tableViewForName.dataSource = self
        tableViewForName.delegate = self
        self.view.addSubview(tableViewForName)
        tableviewForDevelopers()
    
      
    }

    func constraintForMainView() {
        mainView.widthAnchor.constraint(equalToConstant: 375).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: 812).isActive = true
       // mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
      //  mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainView.backgroundColor = UIColor.white
    }
    
    func addMainView() {
        self.view.addSubview(mainView)
        constraintForMainView()
    }
    
    func constraintForStackForSquad() {
        stackForSquad.widthAnchor.constraint(equalToConstant: 343).isActive = true
        stackForSquad.heightAnchor.constraint(equalToConstant: 41).isActive = true
        stackForSquad.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackForSquad.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 4).isActive = true
        stackForSquad.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 14)
       
    }
    
    func addStackForSquad() {
        mainView.addSubview(stackForSquad)
        constraintForStackForSquad()
        
    }
    
    func constraintForLabelForSquad() {
        labelForSquad.widthAnchor.constraint(equalToConstant: 329).isActive = true
        labelForSquad.heightAnchor.constraint(equalToConstant: 41).isActive = true
        let attributedText = NSMutableAttributedString(string: "iOS Squad", attributes: [
                .font: UIFont(name: "SFProDisplay-Bold", size: 34) ?? UIFont.boldSystemFont(ofSize: 34),
                .foregroundColor: UIColor.black
            ])
            labelForSquad.attributedText = attributedText
        }
    
    
    func addLabelForSquad() {
        stackForSquad.addSubview(labelForSquad)
        constraintForLabelForSquad()
        
    }
    
    func constraintForStackForIcon() {
        stackForIcon.widthAnchor.constraint(equalToConstant: 343).isActive = true
        stackForIcon.heightAnchor.constraint(equalToConstant: 72).isActive = true
        stackForIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 101).isActive = true
        stackForIcon.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 13).isActive = true
        stackForIcon.layoutMargins = UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0)
        stackForIcon.axis = .horizontal
        stackForIcon.spacing = 13
    }

    func loadStackForIcon() {
        mainView.addSubview(stackForIcon)
        constraintForStackForIcon()
    }
    
    func constraintForIconImage() {
        imageForIcon.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageForIcon.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageForIcon.layer.cornerRadius = 100
        imageForIcon.image = UIImage(named: "Image2W")
        imageForIcon.backgroundColor = UIColor.white
        imageForIcon.contentMode = .scaleAspectFill
    }
    
    func loadIconImage() {
        stackForIcon.addArrangedSubview(imageForIcon)
        constraintForIconImage()
        stackForIcon.addArrangedSubview(stackForName)
        constraintstackForName()
        stackForName.addArrangedSubview(labelForName)
        constraintForlabelForName()
        stackForIcon.addArrangedSubview(symbolstack)
        constraintForStackForSymbol()
        symbolstack.addArrangedSubview(symbolView)
        constraintForsymbolView()
        
    }
    
    func constraintstackForName() {
        stackForName.widthAnchor.constraint(equalToConstant: 270).isActive = true
        stackForName.heightAnchor.constraint(equalToConstant: 45).isActive = true
        stackForName.axis = .vertical
    }
    
    func constraintForstackForSymbol() {
        stackForSymbol.widthAnchor.constraint(equalToConstant: 247).isActive = true
        stackForSymbol.heightAnchor.constraint(equalToConstant: 45).isActive = true
        stackForSymbol.spacing = 2
    }
    
    func constraintForlabelForName() {
        labelForName.widthAnchor.constraint(equalToConstant: 230).isActive = true
        labelForName.heightAnchor.constraint(equalToConstant: 28).isActive = true
        labelForName.text = "რაისა ბადალ"
        labelForName.textColor = UIColor.black
    }
    
    func constraintForStackForSymbol() {
        symbolstack.widthAnchor.constraint(equalToConstant: 15).isActive = true
        symbolstack.heightAnchor.constraint(equalToConstant: 2).isActive = true
        symbolstack.spacing = 12
    }
    
    func constraintForsymbolView() {
        symbolView.widthAnchor.constraint(equalToConstant: 2).isActive = true
        symbolView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        symbolView.image = UIImage(systemName: "chevron.right")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        developersDict[titleForSection[section]]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let developer = developers[indexPath.row]
        cell.textLabel?.text = developersDict[titleForSection[indexPath.section]]?[indexPath.row]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        titleForSection.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      titleForSection[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        titleForSection
    }
    
    
    
    func tableviewForDevelopers() {
        titleForSection.sort()
        titleForSection.forEach({developersDict[$0] = [String]()})
        developers.forEach({developersDict[String($0.name.prefix(1))]?.append($0.name)})
        
        NSLayoutConstraint.activate([
               tableViewForName.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor , constant: 170),
               tableViewForName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
               tableViewForName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
               tableViewForName.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
           ])
    }

    
}



