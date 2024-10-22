package com.example.demo.dao;

import java.util.ArrayList;
import java.util.List;

import com.example.demo.dto.Article;

public class ArticleDao {
	
	private List<Article> articles;
	
	public ArticleDao() {
		this.articles = new ArrayList<>();
		makeTestData();
	}

	public void makeTestData() {
		for (int i = 1; i <= 3; i++) {
			writeArticle(i, "제목" + i, "내용" + i);
		}
	}
	
	public Article writeArticle(int id, String title, String body) {
		Article article = new Article(id, title, body);
		articles.add(article);
		return article;
	}

	public List<Article> getArticles() {
		return articles;
	}

}
