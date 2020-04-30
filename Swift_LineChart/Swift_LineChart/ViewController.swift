//
//  ViewController.swift
//  Swift_LineChart
//
//  Created by baixue on 2020/3/21.
//  Copyright © 2020 白雪. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChart()
        // Do any additional setup after loading the view.
    }

    func setupChart(){
        let chartViewWidth : CGFloat = UIScreen.main.bounds.width
        let chartViewHeight : CGFloat = UIScreen.main.bounds.height - 100
        var aaChartView = AAChartView()
        
        aaChartView.frame = CGRect(x:0,y:0,width:chartViewWidth,height:chartViewHeight)
        // 设置 aaChartView 的内容高度(content height)
        // aaChartView?.contentHeight = self.view.frame.size.height
        self.view.addSubview(aaChartView)
        

        let chartModel = AAChartModel()
            .chartType(.line)//图表类型
                .title("城市天气变化")//图表主标题
                .subtitle("2020年09月18日")//图表副标题
                .inverted(false)//是否翻转图形
                .yAxisTitle("摄氏度")// Y 轴标题
                .legendEnabled(true)//是否启用图表的图例(图表底部的可点击的小圆点)
                .tooltipValueSuffix("摄氏度")//浮动提示框单位后缀
                .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                             "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"])
                .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])//主题颜色数组
                .series([
                    AASeriesElement()
                        .name("东京")
                        .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]),
                    AASeriesElement()
                        .name("纽约")
                        .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]),
                    AASeriesElement()
                        .name("柏林")
                        .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]),
                    AASeriesElement()
                        .name("伦敦")
                        .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]),
                        ])
        
        aaChartView.aa_drawChartWithChartModel(chartModel)
    }

}

