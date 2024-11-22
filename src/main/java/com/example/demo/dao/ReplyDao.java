package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.dto.Reply;

@Mapper
public interface ReplyDao {
	
	@Insert("""
			INSERT INTO reply
				SET regDate = NOW()
					, updateDate = NOW()
					, memberId = #{loginedMemberId}
					, relTypeCode = #{relTypeCode}
					, relId = #{relId}
					, `body` = #{body}
			""")
	public void writeReply(int loginedMemberId, String relTypeCode, int relId, String body);

	@Select("""
			SELECT r.*, m.loginId
				FROM reply AS r
				INNER JOIN `member` AS m
				ON r.memberId = m.id
				WHERE relTypeCode = #{relTypeCode}
				AND relId = #{relId}
			""")
	public List<Reply> getReplies(String relTypeCode, int relId);
}
