//
//  STCalendarViewController.swift
//  serieztv
//
//  Created by Goktug on 16/05/2017.
//  Copyright © 2017 serieztv. All rights reserved.
//

import UIKit
import JTAppleCalendar

class STCalendarViewController: UIViewController {
    
    let formatter = DateFormatter()
    
    let calendarView = STCalendarView()
    
   // let collectionView = UICollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(calendarView)
     //   calendarView.scrollDirection = .horizontal
        calendarView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalTo(0)
            
        }
        
        calendarView.calendarView.scrollDirection = .horizontal
        calendarView.calendarView.isPagingEnabled = true
        calendarView.calendarView.register(CalendarCell.self, forCellWithReuseIdentifier: "calendarCell")
        
        calendarView.detailCollectionView.delegate = self
        calendarView.detailCollectionView.dataSource = self
        calendarView.calendarView.register(CalendarCell.self, forCellWithReuseIdentifier: "collectionCell")
        
       // calendarView.registerCellViewClass(type: JTAppleDayCell.self)

        //calendarView.calendarDelegate = self
        calendarView.calendarView.ibCalendarDelegate = self
        calendarView.calendarView.ibCalendarDataSource = self
        
        calendarView.calendarView.visibleDates { (visibleDates) in
            self.setupMonthAndYearLabels(from: visibleDates)
        }
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.topItem?.title = "Calendar"
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func handleCellSelected(view: JTAppleCell?, cellState: CellState) {
        guard let selectedCell = view as? CalendarCell else { return }
        if cellState.isSelected {
            selectedCell.selectedView.isHidden = false
        } else {
            selectedCell.selectedView.isHidden = true
        }
    }
    
    func handleCellTextColor(view: JTAppleCell?, cellState: CellState) {
        guard let selectedCell = view as? CalendarCell else { return }
        if cellState.isSelected {
            selectedCell.label.textColor = .black
        } else {
            if cellState.dateBelongsTo == .thisMonth {
                selectedCell.label.textColor = .white
            } else {
                selectedCell.label.textColor = UIColor.white.withAlphaComponent(0.5)
            }
        }
    }
    
    func setupMonthAndYearLabels(from visibleDates: DateSegmentInfo) {
        let date = visibleDates.monthDates.first!.date
        
        formatter.dateFormat = "yyyy"
        calendarView.yearLabel.text = formatter.string(from: date)
        
        formatter.dateFormat = "MMMM"
        calendarView.monthLabel.text = formatter.string(from: date)
    }
}

extension STCalendarViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "calendarCell", for: indexPath) as! CalendarCell
        cell.label.text = cellState.text
        cell.label.textColor = .white
        
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
        return cell
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        let startDate = formatter.date(from: "2017 01 01")
        let endDate = formatter.date(from: "2017 12 31")
        let paramaters = ConfigurationParameters(startDate: startDate!, endDate: endDate!)
        return paramaters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)

    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setupMonthAndYearLabels(from: visibleDates)
    }

}

extension STCalendarViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)
        return cell
    }
}
