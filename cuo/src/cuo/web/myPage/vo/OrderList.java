package cuo.web.myPage.vo;

public class OrderList {
	private String id;
	private String menuKey;
	private String menuName;
	private String messageMenu;
	private String messageQty;
	private String messageContent;
	private String messageCurrent;
	public String getMessageCurrent() {
		return messageCurrent;
	}
	public void setMessageCurrent(String messageCurrent) {
		this.messageCurrent = messageCurrent;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMenuKey() {
		return menuKey;
	}
	public void setMenuKey(String menuKey) {
		this.menuKey = menuKey;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMessageMenu() {
		return messageMenu;
	}
	public void setMessageMenu(String messageMenu) {
		this.messageMenu = messageMenu;
	}
	public String getMessageQty() {
		return messageQty;
	}
	public void setMessageQty(String messageQty) {
		this.messageQty = messageQty;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
}
