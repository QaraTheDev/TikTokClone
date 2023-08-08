//
//  ViewController.swift
//  TikTokClone
//
//  Created by Andas on 27.06.2023.
//

import UIKit
import SnapKit
import BMPlayer

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var tableView = UITableView()
    private var videoLinks: [String] = ["https://tt.sf-converter.com/get?payload=tlZ1SN1U20fRVwJaGqYE1uYKK8SZEHb2xHmGT3fiuZIrPPs-5RFxWNDK91C6VbnMvHVW6h1RnzeWzMotpd18hXtQnxLQd0IghUU~rxMORLWUl~PREaSyxx1t5XdRnOCof7I1OMuv5GnZvqsETtzOB~5TCbMbZcnjBkuaBXgsncUbdFIMgtpixyrr1vsFvEAnB4VRRMJ-bknQhEDg521vn4wxiqVTIQo6jf7Mz~y4xlwEZ2rAaFm2YkHKvZl4YcqzlRHvXCk3DaMpozpZzHv7J-zrZXWCzE8GBaSvujeKKQ2o6zlXYgz4gXTMOulZHOb928qQcC3qNTSn7wyePb1ZDGGCy0ft5~lDMS6c-si6pS86~mO7RMnjys7BKUhZFz2P-gIKMIGS89B5WkesnrAB7rLF8RiWW09460KhjgkWhv8CslJyuW9aK3s3tuL0jew8OQB8kewpY3R426qR-eru~wjLxnFXCJHBv0aYqR1vHvR6HkZ8Hr0YbnvqV5DQ3Wc8SfSKFikrO~BHR~NtaOBManlg~a~u98FVpoeIG0MM89~339iwm9J-79w3h72Lgmh9X6cYrKo_*45bab6ed7a40a2c9*1*1688023150",
                                        "https://tt.sf-converter.com/get?payload=tlZ1SkEuFSfBVu9AB9n9NCNzONQHPS0NJUSA1brnU18sCEDEBqY2oDsj99oyn2SGTpnu5H1HhoGM0esQHen2kr-RGqey1X~0sUxpBbJEDoJV1rMr~PA3SgEGjeEHHjgLappDJufzpIYjHowyWLbZ85YhoxD1dJYkGRIrL7jsZO8DhLRfzmvvofsG7k~siDVAD36Rn1LUQdofU63j08wnHOp0JuD4~X038jm9G7YyVCNeghfuzCfxnvUGrj-nIaIQgefeJLbPwSeZncGg9xECCRj14XOhUyr8rzBxkG2ALe6hh169GDwZEEzpT9U87wGy~JZwI~PBeu6gAU-SW-48gwvw6d06LteyiRkqKWFAWhVIMigb2tAZF4bfZNH4ySMi3Q1Rg7srcr4CRTJ5OXwXZ2N~kvL88uH4iG5IE1hpQDkuN3C9wF01mr6yC8ui9THatF07-naQBN~SEqTOElxbz2iTBn2lp92lB-3fJRHTzzQ1Z54b2BSlfnZMCmwCMasDTlBY~uU~H7D5AO9lls8yQWrC1ewOsxhoROpuwZb9hNv_*1c5970e0d2a577db*1*1688023266",
                                        "https://tt.sf-converter.com/get?payload=tlZ1SibW4xfRIw8QRu1RaL3vWgXDK4AXzgC0evR65ANGmXPGDYKeKEM77DPkCWQosT2JK6193dNnR2ze7seRWD3FtFwJ0sRiUpIMig7asapURaJvgZKPZ4FEi5XxG8akQo1P4SOWbXGVk6OTL8g29g6PDs2dWbN5STTlE42~sMeW5fVcZ9TdMws6loW4kjRG-8jtrrS87KHfmTZFGDk3O37Gs3TBw3cAoCvfJsKBaKOaf8ePzvNqtNvfvNy4OH-~X4aLKVf1ECyazvVIVnfnIqooYc21ZEmI9cAMa7biVZdXD4OGoj7~lL7Nks6akptMo09BrUN8R-tprP8sT~MDXm~-exgcJdOh2~YkJtTThASGDvmP997DY2m1pmDkkHO97-3~agM9ix5Nj9t19HuNTDubTp6T3pJXGB4uyuDD2Kxo93C7qlnPc8F3-sKM1ZtqqBHAaav2FKNisCPvoLQzZ5SWVhTIZxRzopYpPoxYVvFKFePSUvDBenIm7gI5nlbkj7Y-yCdmblfNn~MZkL-gQnA~xzJD7tHwagtOhz__*a2b64ab88d1642eb*1*1688023314",
                                        "https://tt.sf-converter.com/get?payload=tlZ1SJ1Wj0fRVi8EATLApJpZH2XrNXQqFSOY-F2E2RBZqq8CqfNHmAlRsr~VapYCPU26GeWBPGUlNP17rC9YiANp7rPZUxlVKoIPR9OeRkGIyxdN4GDljGlQZMmHaQZHwtIxxBBJOQjIyAOezzx3oAOCvbi8MNIQyifRIoB2cMzVPSRbtQQgIY80~UII2wKIVXlVvcAYSl3NpjVaK7UTrGVw2DTVdlieDoDw78AiDMinElAb~HkxcvogOqCEzERRggcFXoZU6jRDOfCEE2e2M4c1EfE-oLjAcuGC6SBqdX78BR1NvqO0LwmdU0igWE0nQGsA9ptNv~Sy8eeiHHyao~8ze3l~3pGkhm4jWJ9nCMp7LEvY6Q4psLL4MXYk2L3LVTob0HKGGxhkeGYyNwt4Qd1W3a1H1bhk9npwATCeADEpoH632-MXPj~a-JO~oSpW2Cmitr0T3k5BLb~zxx1JgLsZKAHOOzjUkKJvOZNissDakPrRSkOAbAfQg7F1DyHaGaCv2UcVCRsYKQZAHwJcMbMc5Lh5RzaexX~9hf~-7N-6b-Jw7p-71-5M-6w-3T8P83J8DXLt-ZCTW6i~*78455905ad6b82bd*1*1688023374",
                                        "https://tt.sf-converter.com/get?payload=tlZ1SNbuj0fBVw~AVDI9ao2Z4HNdsNMDBAG2HTSB58lnbP5inzsHcYxmILQu77rNrehg93f0F3yj0pz2rev3oU47bmye7c06ydsena~6WVXGyYE1DMl7WhRYOvUvbfNOVEfd4BhjhvUIzqAlB~kHsLVpUkUpU1Wp4jMt8ZWL-~C4N2HfHVHWuDZZ65HAPb6a2c2F8r~xX-9hlt4te8bKVbuPUOCzaPyut-HTDYs2TgBGXSz0pnAITqgkqtPQaOISJLN6-4NvpGG01eDaLkxToIj4gnesn1bCRPAY-AVkP2t3xrot7h1d1-5FMQP6aubicvkzuP~FGau13r0yau1P814imyedoUKInm5AV3q1MP8PXtvuC3puD8RsQzit0O9Zgvj8S3xdd4i4vvHOnKTBwpWCeZ9ikc0~Mo-eDm0C-XsEUNz5kLZt97iqjP5CNdCL6cXLN7suX5NHi20qZIIJ7fX4eSchxhJennmbnHE3fMo6C0~DfFcDQj5CHqZ1dF1HJsjs1rV-wQ0TgN6Uys~R-W9nQFboQntxnQHxSwmUSPw7aO5jwy0XcU6Vaz__*0d681b652a277393*1*1688023443",
                                        "https://tt.sf-converter.com/get?payload=tlZ1SNEuFSfRVw~AKtS8NISCCHXSoSCYYUDFo~VCtCQzCfvXFecceby97euWDrP7SW-V3mbp7u1gdQ2QplkJ87swU~UzL9Pdy~PEGDWgrrJDTkUNOeHYR8tGUOCDDIb6SagsrgylHMlZUjnqgk2HmmRFRbsFuLhNLU6AKM7z9X9LXpsEvPuRJV4d1CspLIG2c21qq4mnYI2wixw~TV-xJdtH8WuO~Wwk1iRwHiCBdzLsvZVFIpBirl3vUaPYNBCsvuVSnw8n0KEFKLSKZVFvcDi2sfnsG4s0lYaJLcjWTy1Gb5rKqyqi03TobebjpVa5DRfMA7T8qtUaDV-83xnGP85m3Idz8pCaFGeGIaPcjwfIIT7FJTg-be5Jbq6Uyhwdqvi1aXyyE5CzOdbGYNvJSm9~pTT78yDkWppJVGKHbhjGPj-0-myZw5hDk6cNwWfKLx7rhaYBvBgIqWNXFORHvGnyZvoqnRY79kKWFKJbsRr4hXvCKTgQFyAo5cYLkiJd86-uD~NRNLZg10G~1joWwqK2MMtw5AGwPLkSsUUDqAN8-ZCDXD9m*cbca72aa71b6947a*1*1688023493"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isPagingEnabled = true
        tableView.showsVerticalScrollIndicator = false
        view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        let blackView = UIView()
        blackView.backgroundColor = .black
        view.addSubview(blackView)
        blackView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(80)
        }
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        let btn1 = UIButton()
        btn1.setImage(UIImage(named: "Home"), for: .normal)
        
        let btn2 = UIButton()
        btn2.setImage(UIImage(named: "Discover"), for: .normal)
        
        let btn3 = UIButton()
        btn3.setImage(UIImage(named: "Button Shape"), for: .normal)
        
        let btn4 = UIButton()
        btn4.setImage(UIImage(named: "Inbox"), for: .normal)
        
        let btn5 = UIButton()
        btn5.setImage(UIImage(named: "Me"), for: .normal)
        
        stackView.addArrangedSubview(btn1)
        stackView.addArrangedSubview(btn2)
        stackView.addArrangedSubview(btn3)
        stackView.addArrangedSubview(btn4)
        stackView.addArrangedSubview(btn5)
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview().inset(15)
            make.height.equalTo(60)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoLinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return VideoTableViewCell(link: videoLinks[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height
    }
}

