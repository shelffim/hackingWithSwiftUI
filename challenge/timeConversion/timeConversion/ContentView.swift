//
//  ContentView.swift
//  timeConversion
//
//  Created by 박현준 on 7/18/25.
//

import SwiftUI

struct ContentView: View {
    @State private var inputTime: Double = 0
    @State private var choseTime: String = "second"
    
    @FocusState private var isFocused: Bool
    
    let timeUnits = ["Seconds", "Minutes", "Hours", "Days"]
    
    var secTime: Double {
        if choseTime == "Minutes" {
            return inputTime * 60
        } else if choseTime == "Hours" {
            return inputTime * 60 * 60
        } else if choseTime == "Days" {
            return inputTime * 60 * 60 * 24
        }
        return inputTime
    }
    var minTime: Double {
        let second = secTime
        let secToMin = second / 60
        return secToMin
    }
    var hourTime: Double {
        let second = secTime
        let secToHour = second / 60 / 60
        return secToHour
    }
    var dayTime: Double {
        let second = secTime
        let secToDay = second / 60 / 60 / 24
        return secToDay
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Enter the desired time type.") {
                    Picker("Chose Time", selection: $choseTime) {
                        ForEach(timeUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("Time", value:$inputTime, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    
                }
                
                Section("Seconds") {
                    Text(secTime, format: .number)
                }
                
                Section("Minutes") {
                    Text(minTime, format: .number)
                }
                
                Section("Hours") {
                    Text(hourTime, format: .number)
                }
                
                Section("Days") {
                    Text(dayTime, format: .number)
                }
                
            }
            .navigationTitle("Time Converter")
            .toolbar {
                if isFocused {
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
            
        }
    }
    
    func convertedTime(for unit: String) -> Double {
        switch unit {
        case "Seconds":
            return secTime
        case "Minutes":
            return minTime
        case "Hours":
            return hourTime
        case "Days":
            return dayTime
        default:
            return 0
        }
    }
    
}

#Preview {
    ContentView()
}

