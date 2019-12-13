package days19.article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days19.article.service.ArticlePage;
import days19.article.service.ListArticleService;
import days18.mvc.command.CommandHandler;

public class ListArticleHandler implements CommandHandler {

	private ListArticleService listService = new ListArticleService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) 
			throws Exception {
		String pageNoVal = req.getParameter("pageNo");
		int pageNo = 1;
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		//
		ArticlePage articlePage = listService.getArticlePage(pageNo);
		
		req.setAttribute("articlePage", articlePage);
		
		return "/days18/article/listArticle";
	}

}
