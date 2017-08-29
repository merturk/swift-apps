//
//  Parser.swift
//  SwPcap
//
//  Created by Mehmet Ali Erturk on 28/08/2017.
//
//

import Foundation
import Cpcap


struct RadioTapHeader {
    var version: UInt8
    var pad: UInt8
    var len: UInt16
    var fields: UInt32
    }


final class IEEE80211Parser {
    
    private init() {}
    
    static let sharedInstance = IEEE80211Parser()
    
    public func parse_pcap_file(_ filePath: String, err:UnsafeMutablePointer<Int8>!) {
    
        let desc = pcap_open_offline(UnsafePointer<Int8>!(file), error)
        
        if desc == nil {
            print("Error opening file .... ", error.debugDescription)
        }
        
        pcap_loop(desc, 0, { (userData: UnsafeMutablePointer<u_char>?, pktHdr: UnsafePointer<pcap_pkthdr>?, packet: UnsafePointer<u_char>?) in
            packet?.withMemoryRebound(to: RadioTapHeader.self, capacity: MemoryLayout<RadioTapHeader>.size, { (ptr:UnsafePointer<RadioTapHeader>) in
                
                let rtHeader = ptr.pointee
                print("Radio Tap Header version:  \(rtHeader.version)  len:  \(rtHeader.len) ")
                
            })
            
        }, nil)

    }
}
