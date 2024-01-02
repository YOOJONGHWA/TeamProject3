package com.itwillbs.dao;

import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.OrderInfoDTO;
import com.itwillbs.domain.PointDTO;

import java.util.List;

public interface OrderDAO {
	public void insertOrder(OrderDTO orderDTO);
	
	// ordCode 생성 => 주문 완료보다 결제완료가 먼저 진행되기 때문에 외부서비스(결제)에서는
	// 			 	 주문번호를 알 수 없기 때문.
	public String createOrderCode(OrderDTO orderDTO);

	public OrderDTO orderComplete(int ordNum);

	public void insertUsedPoint(PointDTO pointDTO);

	public List<OrderInfoDTO> getOrderList(OrderDTO infoDto);

//	public void deleteOrder(OrderDTO orderDTO);

	
	
}
