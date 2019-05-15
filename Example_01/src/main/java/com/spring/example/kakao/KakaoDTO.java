package com.spring.example.kakao;

public class KakaoDTO {
	private String id;
	private String nickname;
	private String profile_image;
	private String thumbnail_image;
	private String email;
	private Boolean has_email;
	private Boolean email_needs_agreement;
	private Boolean is_email_valid;
	private Boolean is_email_verified;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getProfile_image() {
		return profile_image;
	}
	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}
	public String getThumbnail_image() {
		return thumbnail_image;
	}
	public void setThumbnail_image(String thumbnail_image) {
		this.thumbnail_image = thumbnail_image;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public Boolean getHas_email() {
		return has_email;
	}
	public void setHas_email(Boolean has_email) {
		this.has_email = has_email;
	}
	public Boolean getEmail_needs_agreement() {
		return email_needs_agreement;
	}
	public void setEmail_needs_agreement(Boolean email_needs_agreement) {
		this.email_needs_agreement = email_needs_agreement;
	}
	public Boolean getIs_email_valid() {
		return is_email_valid;
	}
	public void setIs_email_valid(Boolean is_email_valid) {
		this.is_email_valid = is_email_valid;
	}
	public Boolean getIs_email_verified() {
		return is_email_verified;
	}
	public void setIs_email_verified(Boolean is_email_verified) {
		this.is_email_verified = is_email_verified;
	}
}
