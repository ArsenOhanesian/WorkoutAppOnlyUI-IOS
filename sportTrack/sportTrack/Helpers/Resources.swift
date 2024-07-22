//
//  Resources.swift
//  sportTrack
//
//  Created by arsen on 21.07.2024.
//

import UIKit

enum R{
    enum Colors{
        static let active = UIColor(hexString: "#437BFE")
        static let inactive = UIColor(hexString: "#929DA5")
        
        static let separator = UIColor(hexString: "#E8ECEF")
        static let background = UIColor(hexString: "#F8F9F9")
        static let secondary = UIColor(hexString: "#F0F3FF")
        
        static let titleGray = UIColor(hexString: "#545C77")
        static let subtitleGray = UIColor(hexString: "#D8D8D8")
        
    }
    
    enum Strings{
        enum TabBar{
            static func title(for tab: Tabs) -> String{
                switch tab {
                case .overview: return "Overview"
                case .session: return "Session"
                case .progress: return "Progress"
                case .settings: return "Settings"
                }
            }
        }
        enum NavBar{
            static let overview = "Today"
            static let session = "High Intensity Cardio"
            static let progress = "Workout Progress"
            static let settings = "Settings"
        }
        
        enum Overview{
            static let allWorcoutsButton = "All Workouts"
        }
        
        enum Session{
            static let navBarStart = "Start    "
            static let navBarPaused = "Pause"
            static let navBarFinished = "Finish"
            
            static let elapsedTime = "Elapsed Time"
            static let remainingTime = "Remaining Time"
            static let completedTitle = "COMPLETED"
            static let remainingTitle = "REMAINING"
            
            static let workoutStats = "Workout stats"
            static let stepsCounter = "Steps Counter"

            static let avaragePace = "Avarage pace"
            static let heartRate = "Heart rate"
            static let totalSteps = "Total distance"
            static let totalDistance = "Total steps"
                
                
            }
        
        enum Progress{
            static let navBarLeft = "Export"
            static let navBarRight = "Details"
            
            static let dailyPerfomance = "Daily perfomance"
            static let last7Days = "Last 7 days"
            
            static let monthlyPerformance = "Monthly performance"
            static let last10Month = "Last 10 month"
        }
        
        enum Settings{}
    }
    
    enum Images{
        enum TabBar{
            static func icon(for tab: Tabs) -> UIImage?{
                switch tab {
                case .overview: return UIImage(named: "overview_tab")
                case .session: return UIImage(named: "session_tab")
                case .progress: return UIImage(named: "progress_tab")
                case .settings: return UIImage(named: "settings_tab")
                }
            }
        }
        
        enum Session{
            enum Stats{
                static let avaragePace = UIImage(named: "stats_avaragePace")!
                static let heartRate = UIImage(named: "stats_heartRate")!
                static let totalSteps = UIImage(named: "stats_totalSteps")!
                static let totalDistance = UIImage(named: "stats_totalDistance")!
            }
        }
        
        enum Overview{
            static let checkmarkDone = UIImage(named: "checkmark_done")
            static let checkmarkNotDone = UIImage(named: "checkmark_not_done")
            static let rightArrow = UIImage(named: "right_arrow")
           
        }
        
        enum Common{
            static let downArrow = UIImage(named: "down_arrow")
            static let add = UIImage(named: "add_button")
        }
    }
    
    enum Fonts{
        static func helvelticaRegular(with size: CGFloat) -> UIFont{
            UIFont(name: "Helvetica", size: size) ?? .systemFont(ofSize: size)
        }
    }
}
