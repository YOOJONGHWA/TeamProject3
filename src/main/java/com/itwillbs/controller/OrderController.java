package com.itwillbs.controller;

import com.itwillbs.api.IamportApi;
import com.itwillbs.domain.*;
import com.itwillbs.service.ActivityService;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.OrderService;
import com.itwillbs.service.PointService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
		
	@Controller
	public class OrderController {
		
		@Inject
		private OrderService orderService;
		
		@Inject
		private PointService pointService;
		
		@Inject
		private MemberService memberService;
		
		@Inject
		private ActivityService activityService;
		
		@Inject
		private IamportApi api;
		
//		public OrderController() {
//		      // REST API 키와 REST API secret 입력
//		      this.api = new IamportApi("6872874776268842", "3gady1pSHIpG3BrYi2ZJl6XONosiYXI2Ct1v5UhBRHAfhXXy3NiLFaJU6YQjaeepDG2sl1TCizMxMry9");
//		}   
		
		@RequestMapping(value = "/order/orderDetail", method = RequestMethod.POST)
		public String order(HttpServletRequest request, Model model, HttpSession session,
						 @ModelAttribute ActivityDTO activityDTO, @ModelAttribute PointDTO pointDTO, 
						 @ModelAttribute OrderDTO infoDTO) {
			
			String userId = (String) session.getAttribute("userId");
			int actNum = Integer.parseInt(request.getParameter("actNum"));
			int actPrice = activityDTO.getActPrice();
			int ordQuantity = infoDTO.getOrdQuantity();
			int total = actPrice * ordQuantity;
			
			infoDTO.getOrdNum();
			
			MemberDTO memberDTO = memberService.userGetMember(userId);
			PointDTO pointDTO2 = pointService.getMember(userId);
			
			model.addAttribute("memberDTO", memberDTO);
			model.addAttribute("total", total);
			model.addAttribute("pointDTO2", pointDTO2);
			model.addAttribute("ordquantity", ordQuantity);

			return "order/orderDetail";
		}

		// 결제완료
		   @RequestMapping(value="/order/payments", method = RequestMethod.POST)
		   public String payments(HttpSession session, HttpServletRequest request, OrderDTO orderDTO){
		      
			  orderDTO.getUserId();
//		      ordMap.put("pointDate", ("yyyy-MM-dd HH:mm:ss"));
//		      ordMap.put("pointNow", request.getParameter("pointNow"));
//		      ordMap.put("pointUsed", request.getParameter("pointUsed"));

//		      System.out.println(ordMap);
//		      orderService.insertOrder();
//		      pointService.insertUsePoint(ordMap);

//		      System.out.println(session.getAttribute("userId"));

//		    	 orderService.insertOrderList(ordMap);
//		    	 orderService.updateQuantity(ordMap);
//		      	 orderService.insertUsedPoint(ordMap);
//		      	 orderService.cancelOrder(ordMap);
		      	 
		      return "redirect:/order/complete";
		 }
		 
		 // 마이페이지 주문내역List
		@RequestMapping(value = "/order/orderList", method = RequestMethod.GET)
		public String orderList(MemberDTO memberDTO, HttpSession session, OrderDTO infoDto
				, HttpServletRequest request) {
			
			String userId = (String) session.getAttribute("userId");
			List<OrderInfoDTO> orderList = orderService.getOrderList(infoDto);
			OrderInfoDTO infoDTO = new OrderInfoDTO();
			
			return "member/mypage";
		}
		 
		// 메인
//		@RequestMapping(value = "/main/main", method = RequestMethod.GET)
//		public String main2() {
//
//			return "main/main";
//		}
		 
//		// 주문취소
//		 @PostMapping("/order/cancel")
//		    public String cancelOrder(@PathVariable("id") Long id) {
//		        orderService.cancelOrder(id);
//		        return "redirect:/orders/{id}";
//		    }
		
}//
		
		
		
		
