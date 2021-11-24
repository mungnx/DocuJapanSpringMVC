package DocuJapan.Controller.Admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import DocuJapan.Entity.Bills;
import DocuJapan.Service.User.BillService;
import DocuJapan.Service.User.OderService;

@Controller
public class OderController extends AdminController{

	@Autowired
	private BillService billService=new BillService();
	@Autowired
	private OderService oderService=new OderService();
	
	@RequestMapping(value="/admin/oder-manager",method=RequestMethod.GET)
	public ModelAndView GetOder() {
		_mvShare.addObject("oders",billService.GetBills());
		_mvShare.setViewName("/admin/order/oder_form");
		_mvShare.addObject("oder",new Bills());
		return _mvShare;
		
	}
	
	
	@RequestMapping(value="/admin/invoice-manager/{id}",method=RequestMethod.GET)
	public ModelAndView GetInvoice(@PathVariable int id) {
		_mvShare.addObject("invoice",billService.GetBills(id));
		_mvShare.addObject("invoices",oderService.GetOderById(id));
		_mvShare.setViewName("/admin/order/invoice");
		//_mvShare.addObject("oder",new Bills());
		return _mvShare;
		
	}
		
	@RequestMapping(value="/admin/del-oder/{id}",method=RequestMethod.GET)
	public String DeleteOder(@PathVariable int id) { 
		
		try {
			int result = billService.DeleteOder(id);
			if (result != 0) {
				_mvShare.addObject("delstatus", "Da hoan thanh!");
			}
		} catch (Exception e) {
			_mvShare.addObject("delstatus", "Khong the xoa!");
		}
		return "redirect:/admin/oder-manager";	
	}
}
