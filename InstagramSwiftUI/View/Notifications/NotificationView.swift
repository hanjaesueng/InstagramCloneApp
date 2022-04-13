//
//  NotificationView.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/03/13.
//

import SwiftUI

struct NotificationView: View {
    @ObservedObject var viewModel = NotificationsViewModel()
    var body: some View {
        ScrollView {
            LazyVStack(spacing : 20) {
                ForEach(viewModel.notifications) { notification in
                    NotificationCell(viewModel: NotificationCellViewModel(notificaiton: notification))
                        .padding(.top)
                }
            }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
