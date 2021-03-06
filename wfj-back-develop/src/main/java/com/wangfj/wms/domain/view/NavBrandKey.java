/**
 * @Probject Name: shopin-back-demo
 * @Path: com.wangfj.wms.domain.viewNavBrandKey.java
 * @Create By chengsj
 * @Create In 2013-7-23 下午7:10:07
 * TODO
 */
package com.wangfj.wms.domain.view;

/**
 * @Class Name NavBrandKey
 * @Author chengsj
 * @Create In 2013-7-23
 */
public class NavBrandKey {

	private String sid;
	private String navSid;
	private String brandSid;
	private String brandName;
	private String brandPic;
	private String brandLink;
	private String isShow;
	private String seq;
	private String flag;

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getIsShow() {
		return isShow;
	}

	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getNavSid() {
		return navSid;
	}

	public void setNavSid(String navSid) {
		this.navSid = navSid;
	}

	public String getBrandSid() {
		return brandSid;
	}

	public void setBrandSid(String brandSid) {
		this.brandSid = brandSid;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getBrandPic() {
		return brandPic;
	}

	public void setBrandPic(String brandPic) {
		this.brandPic = brandPic;
	}

	public String getBrandLink() {
		return brandLink;
	}

	public void setBrandLink(String brandLink) {
		this.brandLink = brandLink;
	}

	@Override
	public String toString() {
		return "NavBrandKey [sid=" + sid + ", navSid=" + navSid + ", brandSid="
				+ brandSid + ", brandName=" + brandName + ", brandPic="
				+ brandPic + ", brandLink=" + brandLink + ", isShow=" + isShow
				+ ", seq=" + seq + ", flag=" + flag + "]";
	}

}
