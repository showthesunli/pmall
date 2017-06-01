package cn.highsuccess.module;

import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;
import java.lang.annotation.Native;


/**
 * Created by prototype on 2017/5/19.
 * 用户发票信息类
 */

/*       attr128LenValue1 as billTag,  //发票标签
       attr128LenValue2 as rcptTitle, //发票抬头
       intAttrValue1    as receiptType, //发票类型
       intAttrValue2    as rcptContent, //发票内容
       attr128LenValue3 as mobile, //收票人手机
       attr128LenValue4 as billReceiverMail, //收票人邮箱
       attr128LenValue5 as taxpayerID //公司纳税人识别号
*/
public class InvoiceInfoItem {
	private String billTag;
    private String rcptTitle;
    private int receiptType;
    private int rcptContent;
    private String mobile;
    private String billReceiverMail;
    private String taxpayerID;
	public String getBillTag() {
		return billTag;
	}
	public void setBillTag(String billTag) {
		this.billTag = billTag;
	}
	public String getRcptTitle() {
		return rcptTitle;
	}
	public void setRcptTitle(String rcptTitle) {
		this.rcptTitle = rcptTitle;
	}
	public int getReceiptType() {
		return receiptType;
	}
	public void setReceiptType(int receiptType) {
		this.receiptType = receiptType;
	}
	public int getRcptContent() {
		return rcptContent;
	}
	public void setRcptContent(int rcptContent) {
		this.rcptContent = rcptContent;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getBillReceiverMail() {
		return billReceiverMail;
	}
	public void setBillReceiverMail(String billReceiverMail) {
		this.billReceiverMail = billReceiverMail;
	}
	public String getTaxpayerID() {
		return taxpayerID;
	}
	public void setTaxpayerID(String taxpayerID) {
		this.taxpayerID = taxpayerID;
	}
}
