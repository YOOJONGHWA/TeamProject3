package com.itwillbs.service;

import com.itwillbs.dao.OrderDAO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.OrderInfoDTO;
import com.itwillbs.domain.PointDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.sql.Timestamp;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Inject
	private OrderDAO orderDAO;
	
	@Override
	public void insertOrder(OrderDTO orderDTO) {
		orderDTO.setOrdDate(new Timestamp(System.currentTimeMillis()));
		orderDAO.insertOrder(orderDTO);
	}
	
	@Override
	public String createOrderCode(OrderDTO orderDTO) {
		
		return orderDTO.getOrdCode();
	}

	@Override
	public OrderDTO orderComplete(int ordNum) {
		return orderDAO.orderComplete(ordNum);
	}

	@Override
	public void insertUsedPoint(PointDTO pointDTO) {
		orderDAO.insertUsedPoint(pointDTO);
	}
	
	@Override
	public List<OrderInfoDTO> getOrderList(OrderDTO infoDto) {
		return orderDAO.getOrderList(infoDto);
		
	}

//	@Override
//	 public void deleteOrder(OrderDTO orderDTO) {
//       Order order = orderDAO.findById(order);
//       order.setStatus(OrderStatus.CANCELLED);
//       orderDAO.save(order);
//   }
	
}