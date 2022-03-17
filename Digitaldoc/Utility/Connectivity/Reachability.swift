//
//  Reachability.swift
//  Digitaldoc
//
//  Created by Manoj on 11/03/22.
//

import Foundation
import UIKit
import SystemConfiguration

public class Reachability {
    
    class func isConnectedToNetwork() ->Bool {
        
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }) else {
            return false
        }
        
        var flags = SCNetworkReachabilityFlags.connectionAutomatic
        if SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) == false {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let result = (isReachable && !needsConnection)
        return result
    }
    
    
    
    class func isConnectedToNetworkOfType() -> ReachabilityType {
        
        switch Networking.networkInterfaceType {
        case .Ethernet:
            return .WWAN
            
        case .Wifi:
            return .WiFi
        default:
            return .NotConnected
        }
        
    }
    
    struct Networking {
        
        enum NetworkInterfaceType: String, CustomStringConvertible {
            case Ethernet = "en0"
            case Wifi = "en1"
            case Unknown = ""
            
            var description: String {
                switch self {
                case .Ethernet:
                    return "Ethernet"
                case .Wifi:
                    return "Wifi"
                case .Unknown:
                    return "Unknown"
                }
            }
        }
        
        static var networkInterfaceType: NetworkInterfaceType {
            if let name = Networking().getInterfaces().first?.name, let type = NetworkInterfaceType(rawValue: name) {
                return type
            }
            
            return .Unknown
        }
        
        static var isConnectedByEthernet: Bool {
            let networking = Networking()
            for addr in networking.getInterfaces() {
                if addr.name == NetworkInterfaceType.Ethernet.rawValue {
                    return true
                }
            }
            return false
        }
        
        static var isConnectedByWiFi: Bool {
            let networking = Networking()
            for addr in networking.getInterfaces() {
                if addr.name == NetworkInterfaceType.Wifi.rawValue {
                    return true
                }
            }
            return false
        }
        
        // New Swift 3 implementation needed upated to replace unsafepointer calls with .withMemoryRebound
        func getInterfaces() -> [(name : String, addr: String, mac : String)] {
            
            var addresses = [(name : String, addr: String, mac : String)]()
            var nameToMac = [ String: String ]()
            
            // Get list of all interfaces on the local machine:
            var ifaddr : UnsafeMutablePointer<ifaddrs>?
            guard getifaddrs(&ifaddr) == 0 else { return [] }
            guard let firstAddr = ifaddr else { return [] }
            
            // For each interface ...
            for ptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
                let flags = Int32(ptr.pointee.ifa_flags)
                if var addr = ptr.pointee.ifa_addr {
                    let name = String(cString: ptr.pointee.ifa_name)
                    
                    // Check for running IPv4, IPv6 interfaces. Skip the loopback interface.
                    if (flags & (IFF_UP|IFF_RUNNING|IFF_LOOPBACK)) == (IFF_UP|IFF_RUNNING) {
                        switch Int32(addr.pointee.sa_family) {
                        case AF_LINK:
                            nameToMac[name] = withUnsafePointer(to: &addr) { unsafeAddr in
                                unsafeAddr.withMemoryRebound(to: sockaddr_dl.self, capacity: 1) { dl in
                                    dl.withMemoryRebound(to: Int8.self, capacity: 1) { dll in
                                        let lladdr = UnsafeRawBufferPointer(start: dll + 8 + Int(dl.pointee.sdl_nlen), count: Int(dl.pointee.sdl_alen))
                                        
                                        if lladdr.count == 6 {
                                            return lladdr.map { String(format:"%02hhx", $0)}.joined(separator: ":")
                                        } else {
                                            return nil
                                        }
                                    }
                                }
                            }
                            
                        case AF_INET, AF_INET6:
                            // Convert interface address to a human readable string:
                            var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                            if (getnameinfo(addr, socklen_t(addr.pointee.sa_len),
                                            &hostname, socklen_t(hostname.count),
                                            nil, socklen_t(0), NI_NUMERICHOST) == 0) {
                                let address = String(cString: hostname)
                                addresses.append( (name: name, addr: address, mac : "") )
                            }
                        default:
                            break
                        }
                    }
                }
            }
            
            freeifaddrs(ifaddr)
            
            // Now add the mac address to the tuples:
            for (i, addr) in addresses.enumerated() {
                if let mac = nameToMac[addr.name] {
                    addresses[i] = (name: addr.name, addr: addr.addr, mac : mac)
                }
            }
            return addresses
        }
    }
}

