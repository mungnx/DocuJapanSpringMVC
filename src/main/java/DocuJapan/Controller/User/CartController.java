package DocuJapan.Controller.User;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import DocuJapan.Dto.CartDto;
import DocuJapan.Entity.Bills;
import DocuJapan.Entity.Account;
import DocuJapan.Service.User.BillService;
import DocuJapan.Service.User.CartServiceImp;

@Controller
public class CartController extends BaseController{
	@Autowired
	BillService billService=new BillService();
	@Autowired
	private CartServiceImp cartService=new CartServiceImp();

	@RequestMapping(value= "gio-hang")
	
	public ModelAndView Index() {
		_mvShare.setViewName("user/cart/list_cart");
		return _mvShare;
	}
	
@RequestMapping(value= "thank-you")
	
	public ModelAndView Thank() {
		_mvShare.setViewName("user/bills/thanks");
		return _mvShare;
	}
	
	
	@RequestMapping(value="AddCart/{id}")
	
	public String AddCart(HttpServletRequest request,HttpSession session,@PathVariable int id) {
		HashMap<Integer, CartDto> cart=(HashMap<Integer, CartDto>)session.getAttribute("Cart");
		if (cart==null) {
			cart=new HashMap<Integer, CartDto>();
		}
		cart=cartService.AddCart(id, cart);
		session.setAttribute("Cart", cart);
		session.setAttribute("TotalQuantyCart", cartService.TotalQuanty(cart));
		session.setAttribute("TotalPriceCart", cartService.TotalPrice(cart));
		return "redirect:"+request.getHeader("Referer");
	}

	
	@RequestMapping(value="DeleteCart/{id}")
	public String DeleteCart(HttpServletRequest request,HttpSession session,@PathVariable int id) {
		HashMap<Integer, CartDto> cart=(HashMap<Integer, CartDto>)session.getAttribute("Cart");
		if (cart==null) {
			cart=new HashMap<Integer, CartDto>();
		}
		cart=cartService.DeleteCart(id, cart);
		session.setAttribute("Cart", cart);
		session.setAttribute("TotalQuantyCart", cartService.TotalQuanty(cart));
		session.setAttribute("TotalPriceCart", cartService.TotalPrice(cart));
		return "redirect:"+request.getHeader("Referer");
	}

	
	@RequestMapping(value="gio-hang/EditCart/{id}/{quanty}")
	public String DeleteCart(HttpServletRequest request,HttpSession session,@PathVariable int id, @PathVariable int quanty){
	HashMap<Integer, CartDto> cart=(HashMap<Integer, CartDto>)session.getAttribute("Cart");
		if (cart==null) {
			cart=new HashMap<Integer, CartDto>();
		}
		cart=cartService.EditCart(id,quanty,cart);
		session.setAttribute("Cart", cart);
		session.setAttribute("TotalQuantyCart", cartService.TotalQuanty(cart));
		session.setAttribute("TotalPriceCart", cartService.TotalPrice(cart));
		return "redirect:"+request.getHeader("Referer");
	}

@RequestMapping(value= "check-out",method=RequestMethod.GET)
	
	public ModelAndView CheckOut(HttpSession session) {
		
	    _mvShare.setViewName("user/bills/checkout");
	    
	    Bills bill=new Bills();
	    Account loginInfo=(Account) session.getAttribute("LoginInfo");
	    if(loginInfo!=null) {
	    	bill.setAddress(loginInfo.getAddress());
	    	bill.setEmail(loginInfo.getEmail());
	    	bill.setUsername(loginInfo.getUserName());
	    }
		_mvShare.addObject("bills", bill);
		return _mvShare;
	}

@RequestMapping(value= "check-out",method=RequestMethod.POST)

public String CheckOutBill(HttpSession session,@ModelAttribute("bills")Bills bill) {
	try {
	bill.setQuanty((Integer) session.getAttribute("TotalQuantyCart"));	
	bill.setTotal((Double) session.getAttribute("TotalPriceCart"));
	
	if(billService.AddBills(bill)>0) {
		
		HashMap<Integer, CartDto> carts=(HashMap<Integer, CartDto>)session.getAttribute("Cart");
		billService.AddBillDetail(carts);
	}	
	session.removeAttribute("Cart");
	session.removeAttribute("TotalQuantyCart");
	session.removeAttribute("TotalPriceCart");
	}catch(Exception e) {
	System.out.println("Null cart " +e);
	return "redirect:trang-chu";
	}
	return "redirect:thank-you";
}
}
