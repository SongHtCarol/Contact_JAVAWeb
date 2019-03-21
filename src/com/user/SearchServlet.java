package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Lot.SearchLot;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
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
		//设置数据编码方式
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        //设置数据类型
        response.setContentType("text/plain");
        //设置禁用缓存
        response.setHeader("Cache-control","no-cache");

        //获取从页面传递的参数
        String search_lot_id = request.getParameter("search_lot_id");
       
        /*
        * 执行操作
        * */
        Map<String,String> lotInfo = new HashMap<String,String>();
        SearchLot instance = new SearchLot();
		lotInfo = instance.SearchLotInfo(search_lot_id);
		
		String lot_name = lotInfo.get("lotName");
		String year_time = lotInfo.get("yearTime");
		String post_time = lotInfo.get("postTime");
		String source_from = lotInfo.get("sourceFrom");
		String label = lotInfo.get("labelInfo");
		String size = lotInfo.get("sizeInfo");
		System.out.println(lot_name);
		
        //拼接返回的json数据
        StringBuilder jsonString = new StringBuilder();
        jsonString.append("{");
        jsonString.append("'size':1");

        jsonString.append(",'datas':[");

        jsonString.append("{");
        jsonString.append("'lot_name':'"
        		+lot_name+ "',");
        jsonString.append("'year_time':'"
        		+ year_time+"',");
        jsonString.append("'post_time':'"
        		+ post_time+"',");
        jsonString.append("'source_from':'"
        		+ source_from+"'");
        jsonString.append("'label':'"
        		+ label+"'");
        jsonString.append("'size':'"
        		+ size+"'");
        jsonString.append("}");


        jsonString.append("]");

        jsonString.append("}");

        //获取输出流
        PrintWriter out = response.getWriter();
        //将数据返回页面
        out.write(jsonString.toString());
        out.flush();
        out.close();
	}

}
