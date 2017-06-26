package com.common.tag;

import java.util.*;
import java.io.Serializable;

public class PageIterator implements Iterator, Serializable {
	// public final static List EMPTY = null;

	private int allCount = 0;
	private List modelList = new ArrayList();
	private int currentIndex = -1;
	private Object nextElement = null;

	int start = 0;
	int count = 10;
	boolean hasNext;

	public PageIterator(int allCount, List modelList, int start, int count, boolean hasNext) {
		this.allCount = allCount;
		this.modelList = modelList;
		this.start = start;
		this.count = count;
		this.hasNext = hasNext;
	}

	public PageIterator(List modelList, int start, boolean hasNext) {
		this.allCount = 0;
		this.modelList = modelList;
		this.start = start;
		this.hasNext = hasNext;
	}

	public PageIterator() {
		this.allCount = 0;
		this.start = 0;
		this.hasNext = false;
	}

	@Override
	public Object clone() {
		PageIterator pi = new PageIterator(0, this.modelList, this.start, this.count, this.hasNext);
		pi.setAllCount(this.allCount);
		return pi;
	}

	public int getStart() {
		return start;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getAllCount() {
		return allCount;
	}

	public void setAllCount(int allCount) {
		this.allCount = allCount;
	}

	public void reset() {
		currentIndex = -1;
		nextElement = null;

	}

	@Override
	public boolean hasNext() {
		if (currentIndex + 1 >= modelList.size() && nextElement == null) {
			return false;
		}
		if (nextElement == null) {
			nextElement = getNextElement();
			if (nextElement == null) {
				return false;
			}
		}
		return true;
	}

	@Override
	public Object next() throws java.util.NoSuchElementException {
		Object element = null;
		if (nextElement != null) {
			element = nextElement;
			nextElement = null;
		} else {
			element = getNextElement();
			if (element == null) {
				throw new java.util.NoSuchElementException();
			}
		}
		return element;
	}

	@Override
	public void remove() throws UnsupportedOperationException {
		throw new UnsupportedOperationException();
	}

	public Object getNextElement() {
		while (currentIndex + 1 < modelList.size()) {
			currentIndex++;
			Object element = modelList.get(currentIndex);
			if (element != null) {
				return element;
			}
		}
		return null;
	}

	public boolean isNextPageAvailable() {
		return hasNext;
	}

	public boolean isPreviousPageAvailable() {
		return start > 0;
	}

	public int getStartOfNextPage() {
		return start + modelList.size();
	}

	public int getStartOfPreviousPage() {
		return Math.max(start - modelList.size(), 0);
	}

	private Map param;

	public void setParameterMap(Map param) {
		this.param = param;
	}

	public void setParameterString(String key, String value) {
		if (this.param == null || this.param.size() < 1) {
			this.param = new HashMap();
		}
		this.param.put(key, value);
	}

	public Map getParameterMap() {
		return this.param;
	}

	public String getParameter(String str) {
		Object obj = this.param.get(str);
		if (obj != null) {
			return (String) obj;
		} else {
			return "";
		}
	}

	public int getPageNum() {
		return (this.allCount - 1) / this.count + 1;
	}

	public List getModelList() {
		return modelList;
	}

}
