package DocuJapan.Controller.User;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import DocuJapan.Dto.CartDto;
import DocuJapan.Service.User.CartServiceImp;

@Controller
public class CartController extends BaseController{
	
	

	@RequestMapping(value= "gio-hang")
	
	public ModelAndView Index() {
		_mvShare.setViewName("user/cart/list_cart");
		return _mvShare;
	}
	
	@Autowired
	private CartServiceImp cartService=new CartServiceImp();
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

}
