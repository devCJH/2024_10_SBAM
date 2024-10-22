package com.example.demo.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.example.demo.dto.Article;

@Component
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

	public Article getArticleById(int id) {
		for (Article article : articles) {
			if (article.getId() == id) {
				return article;
			}
		}
		return null;
	}

	public void modifyArticle(Article foundArticle, String title, String body) {
		foundArticle.setTitle(title);
		foundArticle.setBody(body);
	}

	public void deleteArticle(Article foundArticle) {
		articles.remove(foundArticle);
	}

}
