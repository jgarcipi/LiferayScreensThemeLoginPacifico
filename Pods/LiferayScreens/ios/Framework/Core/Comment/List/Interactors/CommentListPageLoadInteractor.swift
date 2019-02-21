/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
import UIKit

open class CommentListPageLoadInteractor: BaseListPageLoadInteractor {

	let className: String

	let classPK: Int64

	// MARK: Initializers

	public init(
			screenlet: BaseListScreenlet,
			page: Int,
			computeRowCount: Bool,
			className: String,
			classPK: Int64) {
		self.className = className
		self.classPK = classPK

		super.init(screenlet: screenlet, page: page, computeRowCount: computeRowCount)
	}

	// MARK: BaseListPageLoadInteractor

	override open func createListPageConnector() -> PaginationLiferayConnector {
		let pager = (self.screenlet as! BaseListScreenlet).firstRowForPage

		return LiferayServerContext.connectorFactory.createCommentListPageConnector(
			className: className,
			classPK: classPK,
			startRow: pager(self.page),
			endRow: pager(self.page + 1),
			computeRowCount: self.computeRowCount)!
	}

	override open func convertResult(_ serverResult: [String: AnyObject]) -> AnyObject {
		return Comment(attributes: serverResult)
	}

	override open func cacheKey(_ op: PaginationLiferayConnector) -> String {
		return "COMMENTS_\(classPK)_\(className)"
	}

}
