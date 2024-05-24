
import Foundation
@MainActor
class UserData: ObservableObject {
    @Published var users: [User] = []
    init() {
        Task{
            await loadUsers()
        }
    }
    func loadUsers() async {
        do {
                let users = try await UserFetchingClient.getUSers()
                self.users = users
            }
            catch {
                print(error)
            }
        }
        
        
    }

