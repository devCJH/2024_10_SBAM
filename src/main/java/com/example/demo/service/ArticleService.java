package com.example.demo.service;

import java.util.List;

import com.example.demo.dao.ArticleDao;
import com.example.demo.dto.Article;

public class ArticleService {
	
	private ArticleDao articleDao;
	
	public ArticleService() {
		this.articleDao = new ArticleDao();
	}
	
	public Article writeArticle(int id, String title, String body) {
		return articleDao.writeArticle(id, title, body);
	}

	public List<Article> getArticles() {
		return articleDao.getArticles();
	}
}
