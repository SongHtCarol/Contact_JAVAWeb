package com.user;

import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Lot.LotInfo;
import com.Lot.SearchLot;
import com.contact.ContactInfo;
import com.customer.CustomerInfo;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 	response.setContentType("text/html");
	        request.setCharacterEncoding("UTF-8"); 
	        
	        String search_lot =  request.getParameter("search-lot");
	        String which_submit =  request.getParameter("which_submit");
	       
	        if(search_lot==null) search_lot = "0";
	        if(which_submit==null) which_submit = "0";
	        
	        System.out.println("search_lot: "+search_lot);
	        System.out.println("which_submit: "+which_submit);
	        
	        if(search_lot.equals("1")) {
	        	String user_id = (String)request.getSession().getAttribute("user_id");
	        	String lot_id = request.getParameter("search-lot-id");
	        	System.out.println("search  -> lot_id: "+lot_id);
	    		Map<String,String> lotInfo = new HashMap<String,String>();
	    		SearchLot instance = new SearchLot();
	    		lotInfo = instance.SearchLotInfo(lot_id);
	    		System.out.println("searchLot->situation = "+lotInfo.get("situation"));
	    		if(lotInfo.get("situation")==null) {
	    			request.getSession().setAttribute("situation", "2");
	    		}
	    		else if(lotInfo.get("situation").equals("未成交")&&lotInfo.get("situation")!=null) {
	    			String lot_name = lotInfo.get("lotName");
		    		String year_time = lotInfo.get("yearTime");
		    		String post_time = lotInfo.get("postTime");
		    		String source_from = lotInfo.get("sourceFrom");
		    		String label = lotInfo.get("labelInfo");
		    		String size = lotInfo.get("sizeInfo");
		    		System.out.println(lot_name);
		    		request.getSession().setAttribute("situation", "0");
		    		request.getSession().setAttribute("lotId", lot_id);
		    		request.getSession().setAttribute("lotName", lot_name);
		    		request.getSession().setAttribute("yearTime", year_time);
		    		request.getSession().setAttribute("postTime", post_time);
		    		request.getSession().setAttribute("sourceFrom", source_from);
		    		request.getSession().setAttribute("labelInfo", label);
		    		request.getSession().setAttribute("sizeInfo", size);
		    		request.getSession().setAttribute("userId", user_id);
	    		}else if(lotInfo.get("situation").equals("成交")&&lotInfo.get("situation")!=null){
	    			request.getSession().setAttribute("situation", "1");
	    		}
	    		
		        request.getRequestDispatcher("result.jsp?pid="+user_id).forward(request, response);
	        }
	        else if(which_submit.equals("1")) {

		        String star = request.getParameter("input_star");
		        System.out.println("star:"+star);
		        if(star.equals("0")) {
		        	star = "否";
		        }else if(star.equals("1")){
		        	star = "是";
		        }
		        String user_id = (String)request.getSession().getAttribute("user_id");
		        String lot_id = request.getParameter("lot_id");
		       // System.out.println("add star: "+star);
		       // System.out.println("add user_id: "+user_id);
		        //
		        String create_date = request.getParameter("create_date");
		        Date dNow = new Date();
		        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
		        String effective_date = ft.format(dNow);
		        //System.out.println(" servlet:create_date = "+create_date);
				//System.out.println(" servlet:effective_date = "+effective_date);
		        //
		        String cus_name = request.getParameter("customer_name");
		        String cus_phone = request.getParameter("customer_phone");
		        String cus_code = request.getParameter("customer_code");
		        //
		        String price = request.getParameter("price");
		        String pay_method = request.getParameter("pay_method");
		        String picker = request.getParameter("picker");
		        String pick_date = request.getParameter("pick_date");
		        String picker_email = request.getParameter("picker_email");
		        String picker_phone = request.getParameter("picker_phone");
		        
	
		        /**   **/
		        ContactInfo contact = new ContactInfo();
		        CustomerInfo cus = new CustomerInfo();
		        LotInfo lot = new LotInfo();
		        //System.out.println("servel:"+lot_id);
		        Integer LotId= Integer.parseInt(lot_id);
		        
		        contact.setCreateDate(create_date);
		        contact.setEffectiveDate(effective_date);
		        if(star.equals("1"))contact.setStar("是");
		        else contact.setStar("否");
		        
		        cus.setCustomerName(cus_name);
		        cus.setCustomerPhone(cus_phone);
		        cus.setCustomerCode(cus_code);
		        
		        lot.setLotId(LotId);
		        lot.setPayMethod(pay_method);
		        lot.setPicker(picker);
		        lot.setPrice(price);
		        lot.setPickerDate(pick_date);
		        lot.setPickerEmail(picker_email);
		        lot.setPickerPhone(picker_phone);
		        
		        boolean flag = AddDao.getInstance().addContact(contact,lot,cus,user_id, star); 
		        
		        if(flag){       
		           // request.getSession().setAttribute("userName", user.getUserName());
		        	String contact_id = request.getParameter("contact_id");
		    		response.sendRedirect("detail-contact.jsp?pid="+user_id+"&lot_id="+lot_id+"&contact_id="+contact_id);
		        	//System.out.println(cus.getCustomerName());
		        }else{     
		            //response.sendRedirect("errorpage.jsp");
		        }
	        }
		//doGet(request, response);
	}

}
