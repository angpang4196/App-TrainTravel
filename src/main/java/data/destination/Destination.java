package data.destination;

public class Destination {
	String id;
	int views;
	String title;
	String contentTypeId;
	String areaCode;
	int likes;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContentTypeId() {
		return contentTypeId;
	}

	public void setContentTypeId(String contentTypeId) {
		this.contentTypeId = contentTypeId;
	}

	public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getId() {
		return id;
	}

	public int getViews() {
		return views;
	}

}
