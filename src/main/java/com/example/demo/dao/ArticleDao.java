package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.dto.Article;

@Mapper
public interface ArticleDao {
	
	public Article writeArticle(int id, String title, String body);

	@Select("""
			SELECT *
				FROM article
				ORDER BY id DESC
			""")
	public List<Article> getArticles();

	@Select("""
			SELECT *
				FROM article
				WHERE id = #{id}
			""")
	public Article getArticleById(int id);

	public void modifyArticle(Article foundArticle, String title, String body);

	public void deleteArticle(Article foundArticle);
}
