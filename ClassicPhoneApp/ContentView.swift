//
//  ContentView.swift
//  ClassicPhoneApp
//
//  Created by Mohammed Alsaleh on 25/09/1443 AH.
//

import SwiftUI

struct ContentView: View {
    @State var Numbers:[[String]] = [
        ["1","2","3"],
        ["4","5","6"],
        ["7","8","9"],
        ["*","0","#"],
        ["add" , "Call" , "delete"]
    ]
    @State var text = ""
    var body: some View {
        VStack(spacing: 0.0) {
            ZStack {
                VStack(spacing: 0.0) {
                    LinearGradient(colors: [Color(#colorLiteral(red: 0.4696483016, green: 0.5539086461, blue: 0.6469049454, alpha: 1)),Color(#colorLiteral(red: 0.209054172, green: 0.3404863477, blue: 0.4800195098, alpha: 1))], startPoint: .top, endPoint: .bottom)
                    Color(#colorLiteral(red: 0.03572260588, green: 0.2203581929, blue: 0.404256165, alpha: 1))
                }
                Text(text)
                    .lineLimit(0)
                    .font(.system(size: 30,weight: .bold, design: .rounded))
                    .foregroundColor(.white)
            }
            ForEach(self.Numbers,id:\.self) { i in
                HStack(spacing: 0.0) {
                    ForEach(i,id:\.self) { num in
                        if num == "add" {
                            // add contact
                            ZStack {
                                LinearGradient(colors: [Color(#colorLiteral(red: 0.1137254902, green: 0.168627451, blue: 0.2549019608, alpha: 1)),Color(#colorLiteral(red: 0.1137254902, green: 0.168627451, blue: 0.2549019608, alpha: 1))], startPoint: .top, endPoint: .bottom)
                                Rectangle()
                                    .stroke(Color(#colorLiteral(red: 0.2919645607, green: 0.31613639, blue: 0.3665326238, alpha: 1)))
                                Image(systemName: "person.fill.badge.plus")
                                    .font(.system(size: 30,weight: .bold, design: .rounded))
                                    .foregroundColor(Color(#colorLiteral(red: 0.7058823529, green: 0.7411764706, blue: 0.7568627451, alpha: 1)))
                            }.frame(height:80).frame(maxWidth:.infinity).onTapGesture {
                                
                            }
                        } else if num == "Call" {
                            // call button
                            
                            ZStack {
                                LinearGradient(colors: [Color(#colorLiteral(red: 0.6784313725, green: 0.8352941176, blue: 0.6549019608, alpha: 1)),Color(#colorLiteral(red: 0.1333333333, green: 0.662745098, blue: 0.03921568627, alpha: 1))], startPoint: .top, endPoint: .bottom)
                                Rectangle()
                                    .stroke(Color(#colorLiteral(red: 0.2919645607, green: 0.31613639, blue: 0.3665326238, alpha: 1)))
                                Label(num, systemImage: "phone.fill")
                                    .font(.system(size: 30,weight: .bold, design: .rounded))
                            }.frame(height:80).frame(maxWidth:.infinity)
                                .onTapGesture {
                                    if self.text != "" {
                                        guard let url = URL(string: "tel://\(text)") else {
                                            return
                                        }
                                        UIApplication.shared.open(url)
                                    }
                                }
                        } else if num == "delete" {
                            // delete button
                            ZStack {
                                LinearGradient(colors: [Color(#colorLiteral(red: 0.1137254902, green: 0.168627451, blue: 0.2549019608, alpha: 1)),Color(#colorLiteral(red: 0.1137254902, green: 0.168627451, blue: 0.2549019608, alpha: 1))], startPoint: .top, endPoint: .bottom)
                                Rectangle()
                                    .stroke(Color(#colorLiteral(red: 0.2919645607, green: 0.31613639, blue: 0.3665326238, alpha: 1)))
                                Image(systemName: "delete.backward.fill")
                                    .font(.system(size: 30,weight: .bold, design: .rounded))
                                    .foregroundColor(Color(#colorLiteral(red: 0.7058823529, green: 0.7411764706, blue: 0.7568627451, alpha: 1)))
                                
                            }.frame(height:80).frame(maxWidth:.infinity)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        self.text = String(self.text.dropLast())
                                    }
                                }
                        } else {
                            //  Numbers
                            ZStack {
                                LinearGradient(colors: [Color(#colorLiteral(red: 0.1338843405, green: 0.1893442869, blue: 0.2467143834, alpha: 1)),Color(#colorLiteral(red: 0.08302808553, green: 0.1033023223, blue: 0.1570931375, alpha: 1))], startPoint: .top, endPoint: .bottom)
                                Rectangle()
                                    .stroke(Color(#colorLiteral(red: 0.2919645607, green: 0.31613639, blue: 0.3665326238, alpha: 1)))
                                Text(num)
                                    .foregroundColor(.white)
                                    .font(.system(size: 30, design: .rounded))
                                    .bold()
                            }.frame(height:80).frame(maxWidth:.infinity)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        self.text += num
                                    }
                                }
                        }
                    }
                }
            }
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

