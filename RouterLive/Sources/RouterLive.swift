import ChatListFeature
import CommentFeature
import DetailFeature
import ExpandedCommentFeature
import ExploreFeature
import HomeFeature
import ProfileFeature
import Router
import SwiftUI
import TabContainerFeature

extension Router {
  public static let liveValue: Router = .init { route in
    AnyView(RouteView(route: route))
  }
}

struct RouteView: View {
  let route: Route

  var body: some View {
    switch self.route {
    case .tabContainer:
      TabContainerView()
    case .home(.root):
      HomeView()
    case let .home(
      .detail(.root(navPath, title))
    ):
      DetailView(navPath: navPath, title: title)
    case let .home(.detail(.comment(.root(navPath)))):
      CommentView(navPath: navPath)
    case let .home(.detail(.comment(.expandedComment(.root(navPath))))):
      ExpandedCommentView(navPath: navPath)
    case .explore(.root):
      ExploreView()
    case .explore:
      EmptyView()
    case .chat(.root):
      ChatListView()
    case .chat(.detail(_)):
      EmptyView()
    case .profile(.root):
      ProfileView()
    }
  }
}
