package com.customer;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Lot.SearchLot;

/**
 * Servlet implementation class getVIPInfo
 */
@WebServlet("/getVIPInfo")
public class getVIPInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getVIPInfo() {
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
		//doGet(request, response);
		
		response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8"); 
        
        String cus_id =  request.getParameter("cusId");
        System.out.println("cus_id: "+cus_id);
        
        if(cus_id!=null) {
        	Map<String,String> cusInfo = new HashMap<String,String>();
        	CustomerDao instance = new CustomerDao();
        	cusInfo = instance.getCustomerInfo(cus_id);
        	
        	String cus_name = cusInfo.get("CustomerName");
        	String cus_rank = cusInfo.get("CustomerRank");
        	String cus_phone = cusInfo.get("CustomerPhone");
        	String cus_count = cusInfo.get("cus_count");
        	String cus_totalPrice = cusInfo.get("cus_totalPrice");
        	
        	request.getSession().setAttribute("cus_name", cus_name);
    		request.getSession().setAttribute("cus_rank", cus_rank);
    		request.getSession().setAttribute("cus_phone", cus_phone);
    		request.getSession().setAttribute("cus_count", cus_count);
    		request.getSession().setAttribute("cus_totalPrice", cus_totalPrice);
    		System.out.println("cus_name"+cus_name);
	        request.getRequestDispatcher("result2.jsp?pid="+cus_id).forward(request, response);
        }
        
	}

}
