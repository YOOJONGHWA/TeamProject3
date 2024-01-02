package com.itwillbs.dao;

import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.OrderInfoDTO;
import com.itwillbs.domain.PointDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.orderMapper";

	@Override
	public void insertOrder(OrderDTO orderDTO) {
		sqlSession.insert(namespace + ".insertOrder", orderDTO);		
	}

	@Override
	public String createOrderCode(OrderDTO orderDTO) {
		return sqlSession.selectOne(namespace+".createOrderCode");
	}
	
	@Override
	public OrderDTO orderComplete(int ordNum) {
		return sqlSession.selectOne(namespace+".orderComplete", ordNum);		
	}
	
	@Override
	public void insertUsedPoint(PointDTO pointDTO) {
		sqlSession.insert(namespace+".insertUsedPoint", pointDTO);	

	}
	
	@Override
	public List<OrderInfoDTO> getOrderList(OrderDTO infoDto) {
		sqlSession.selectList(namespace+".getOrderList", infoDto);
		
		return null;
	}

//	@Override
//	public void deleteOrder(OrderDTO orderDTO) {
//		System.out.println("deleteOrderDAO");
//		sqlSession.delete(namespace + ".deleteOrder", orderDTO);
//
//	}
	
}
