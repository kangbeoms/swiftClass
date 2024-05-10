//
//  EditDelegate.swift
//  Navigaton
//
//  Created by TJ on 2024/05/01.
//
    //프로토콜에서 내가 주고받을 정보를 정의해준다.
protocol EditDelegate{
    func didMessageEditDown(_ controller:EditViewController,message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
}
