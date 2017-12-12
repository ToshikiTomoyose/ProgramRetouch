package ec;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.BuyDataBeans;
import beans.ItemDataBeans;
import dao.BuyDAO;
import dao.BuyDetailDAO;

/**
 * 購入履歴画面
 * @author d-yamaguchi
 *
 */
@WebServlet("/UserBuyHistoryDetail")
public class UserBuyHistoryDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		try {
		// ログイン時に取得したユーザーIDをセッションから取得、そのセッションはユーザーIDに基づいた履歴を表示させるときにも使う
		String buyId = (String) request.getParameter("buy_id");
		int buyIdint = Integer.parseInt(buyId);

		BuyDataBeans bdb = BuyDAO.getBuyDataBeansByBuyId(buyIdint);
//		String id = request.getParameter("");
		session.setAttribute("bdb",bdb);
		ArrayList<ItemDataBeans> bddb = BuyDetailDAO.getItemDataBeansListByBuyId(buyIdint);
		session.setAttribute("bddb", bddb);


		request.getRequestDispatcher(EcHelper.USER_BUY_HISTORY_DETAIL_PAGE).forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("errorMessage", e.toString());
			response.sendRedirect("Error");
		}
	}
}
