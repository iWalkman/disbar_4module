
//  Created by Konstantin Fomin on 12/06/16.
//  Copyright © 2016 Konstantin Fomin. All rights reserved.
//

import Foundation


import Cocoa



var module: Double = 14851
var a: Double = 6
var b: Double = -1
var P = [9738.0, 10118.0]


func podelit(one: Double, two: Double) -> Double
{
    var sec = 0.0
    
    for i in 0..<Int(module)
    {
        if ( Double(i) * two).vzatModule() == 1.0
        {
            sec = Double(i)
            break
        }
    }
    return Double((one*sec).vzatModule())
}



func +(one: [Double], two: [Double]) -> [Double]
{
    var x = 0.0
    var y = 0.0
    
    if one[0]==two[0]&&one[1]==two[1]
    {
        let s = podelit((3*pow(one[0], 2) + a).vzatModule(), two: (2*one[1]).vzatModule()).vzatModule()
        x = (pow(s, 2) - 2*two[0]).vzatModule()
        y = ((s*(one[0] - x)).vzatModule() - one[1]).vzatModule()
    }
    else if !(two[0] == one[0] && two[1] == (-one[1]).vzatModule())
    {
        let s = podelit((one[1] - two[1]).vzatModule(), two: (one[0] - two[0]).vzatModule()).vzatModule()
        
        x = (pow(s, 2).vzatModule() - one[0] - two[0]).vzatModule()
        y = (-one[1] + (s * (one[0] - x)).vzatModule()).vzatModule()
    }
    
    return [x,y]
}


func - (one: [Double], two: [Double]) -> [Double]
{
    return one + [two[0], (-two[1]).vzatModule()]
}


func *(one: [Double], two: Double) -> [Double]
{
    
    if two == 1
    {
        return one
    }
    else
    {
        var p = one + one
        
        for _ in 2..<Int(two)
        {
            if p == [0.0, 0.0]
            {
                p = one
            }
            else
            {
                p = p + one
            }
            
        }
        
        return p
    }
}


extension Double
{
    func vzatModule() -> Double
    {
        let module: Double = 14851
        return self%module >= 0 ? self%module : self%module + module
    }
}

var sum = P

var i = 1

print("[\(Int(P[0])),\(Int(P[1]))]")

while(true)
{
    i = i + 1
    sum = sum + P
    
    if i < 11
    {
        print((sum == [0.0, 0.0] ? "zero element" : "[\(Int((sum)[0]));\(Int((sum)[1]))]"))
    }
    if sum == [0.0, 0.0]
    {
        print("Poryadok \(i)")
        break
    }
    
}

var secretNumber = 42.0

var A = P * secretNumber

var k = 37.0

var M = [3875.0, 2745.0]

var B1 = P * k

var B2 = M + (A * k)

var temp = (B1 * secretNumber)

var Mresult = B2 - temp


print("Алиса выбирает секретное число a = \(Int(secretNumber)) и вычисляет A = [a]P = (\(Int((P*42)[0])),\(Int((P*42)[1]))) ")
print("Боб переводит свое сообщение в точку пространства 𝑀 ∈ 𝐸(𝐹𝑞) = (\(Int(M[0])),\(Int(M[1]))) и выбирает произвольное число 𝑘 = \(Int(k)), ")
print("Он вычисляет две точки 𝐵1 = [𝑘]𝑃 ∈ 𝐸(𝐹𝑞) = (\(Int(B1[0])),\(Int(B1[1]))) и 𝐵2 = 𝑀 + [𝑘]𝐴 ∈ 𝐸(𝐹𝑞) =  (\(Int(B2[0])),\(Int(B2[1]))).")
print("Алиса используя свой закрытый ключ a вычисляет 𝐵2 − [𝑎]𝐵1. Это значение совпадает со значением M, [𝑎]𝐵1 = (\(Int(temp[0])),\(Int(temp[1]))) , результат = (\(Int(Mresult[0])),\(Int(Mresult[1])))")