package data;

import java.sql.Date;

public class Review {
	String content;
	String id;
	String writer;
	Date writed;
	String contentId;

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public void setWrited(Date writed) {
		this.writed = writed;
	}

	public void setContentId(String contentId) {
		this.contentId = contentId;
	}

	public String getWriter() {
		return writer;
	}

	public Date getWrited() {
		return writed;
	}

	public String getContentId() {
		return contentId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
