//
//  WidgetView.swift
//  SwiftUI Widgets
//
//  Created by Akashlal Bathe on 16/07/20.
//

import SwiftUI
import WidgetKit

struct WidgetData{
    let weight: Measurement<UnitMass>
    let date: Date
}

extension WidgetData{
    static let previewData = WidgetData(weight: Measurement<UnitMass>(value: 66.99, unit: .kilograms), date: Date().advanced(by: (-60*29)))
}

struct WidgetView: View {
    let data: WidgetData
    @Environment(\.widgetFamily) var widgetFamily
    
    var body: some View {
        ZStack{
            Color(.yellow)
            HStack{
                VStack(alignment: .leading) {
                    WeightView(data: data)
                    Spacer()
                    LastUpdatedView(data: data)
                }
                .padding(.all)
                if widgetFamily == .systemMedium{
                    Image("weight").resizable()
                }
            }
        }
        
    }
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            WidgetView(data: .previewData).previewContext(WidgetPreviewContext(family: .systemSmall))
            WidgetView(data: .previewData).previewContext(WidgetPreviewContext(family: .systemMedium))
            WidgetView(data: .previewData).previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}



struct WeightView: View {
    var data: WidgetData
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Weight")
                    .font(.body)
                    .foregroundColor(.purple)
                    .bold()
                Spacer()
                Text(MeasurementFormatter().string(from: data.weight))
                    .font(.title)
                    .foregroundColor(.purple)
                    .bold()
                    .minimumScaleFactor(0.7)
            }
            Spacer()
        }
        .padding(.all, 8)
        .background(ContainerRelativeShape().fill(Color(.cyan)))
    }
}

struct LastUpdatedView: View {
    let data: WidgetData
    var body: some View {
        VStack(alignment: .leading){
            Text("Last Updated")
                .font(.body)
                .bold()
                .foregroundColor(.purple)
            Text("\(data.date, style: .relative) ago")
                .font(.caption)
                .foregroundColor(.purple)
                .minimumScaleFactor(0.7)
                
        }
    }
}
