package com.itwillbs.service;

import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.OrderInfoDTO;
import com.itwillbs.domain.PointDTO;

import java.util.List;

public interface OrderService {
	
	public void insertOrder(OrderDTO orderDTO);
	
	public String createOrderCode(OrderDTO orderDTO);

	public OrderDTO orderComplete(int ordNum);
	
	public void insertUsedPoint(PointDTO pointDTO);
	
	public List<OrderInfoDTO> getOrderList(OrderDTO infoDto);
		 
//    public void deleteOrder(OrderDTO orderDTO);
	 

}
