package com.countout.vo;

/**
 * 【节点过滤器】
 * @author Mr.tang
 */
public interface NodeFilter<T> {
	/**
	 * 判断树中是否应含有该节点
	 * @param entity 节点代表的的对象
	 * @param depth 节点在树中所在的层次
	 * @return 如果树中不包含该节点，则返回true，否则返回false。
	 */
	public boolean accept(T entity, int depth, boolean leaf);
}
