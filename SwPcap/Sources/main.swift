
import Cpcap
//import Foundation


print("Hello, world!")



let file = "/Users/merturk/Downloads/mesh.pcap"
var error: UnsafeMutablePointer<Int8>!

var parser = IEEE80211Parser.sharedInstance

parser.parse_pcap_file(file, err: error)
