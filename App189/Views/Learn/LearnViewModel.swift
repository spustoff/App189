//
//  LearnViewModel.swift
//  App189
//
//  Created by IGOR on 11/09/2023.
//

import SwiftUI
import Alamofire

final class LearnViewModel: ObservableObject {
    
    @Published var cases: [String] = ["All", "Favorites"]
    @Published var current_case = "All"
    @AppStorage("video_watched") var video_watched: Int = 0
    @AppStorage("progress") var progress: Int = 0
    @AppStorage("level") var level: Int = 1

    @Published var isLoading: Bool = false
    
    @Published var lessons: [VideoItem] = []
    @Published var isFavs: Bool = false
    
    @Published var selectedLesson: VideoItem = VideoItem(id: 1, categoryId: 1, title: "", image: "", video: "", duration: 1)
    @Published var isDetail: Bool = false
    
    @AppStorage("video_saved") var video_saved: [String] = []
    
    func getItems() -> [VideoItem] {
        
        switch isFavs {
            
        case true:
            return lessons.filter{video_saved.contains($0.title ?? "")}
        case false:
            return lessons
        }
    }
    
    func getFilteredVideo() -> [VideoItem] {
        
        return lessons.filter{video_saved.contains($0.title ?? "")}
    }
    
    func favoritesManager(_ video: VideoItem) {
        
        guard let title = video.title else { return }
        
        if video_saved.contains(title) {
            
            if let indexer = video_saved.firstIndex(of: title) {
                
                video_saved.remove(at: indexer)
            }
            
        } else {
            
            video_saved.append(title)
        }
    }
    
    func isFavorited(_ video: VideoItem) -> Bool {
        
        guard let title = video.title else { return false }
        
        return video_saved.contains(title) ? true : false
    }
    
    func getCategories(category_id: String) {
        
        isLoading = true
        
        self.fetchCategories(category_id: category_id) { result in
            
            switch result {
                
            case .success(let success):
                
                self.lessons = success.rows
                
            case .failure(let failure):
                
                debugPrint("Parse error - \(failure)")
                
                self.isLoading = false
            }
        }
    }
    
    func fetchCategories(category_id: String, completion: @escaping (Result<LearnModel, Error>) -> Void ) {
        
        isLoading = true
        
        let params: Parameters = [
            
            "token": "1655d23e-9089-4fb7-87aa-c199758835c8",
            "category_id": category_id,
        ]
        
        let request = AF.request("https://miderast.space/api/v2/video", method: .get, parameters: params)
        
        request.responseDecodable(of: LearnModel.self) { response in
            
            guard let value = response.value else {
                
                self.isLoading = false
                return
            }
                           
            switch response.result{
                
            case .success(_):
                
                completion(.success(value))
                self.isLoading = false
                
            case .failure(_):
                
                completion(.failure(response.error.debugDescription as! Error))
                self.isLoading = false
            }
        }
    }
}
