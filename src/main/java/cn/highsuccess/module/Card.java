package cn.highsuccess.module;

import javax.validation.constraints.NotNull;

/**
 * Created by prototype on 2017/5/18.
 */
public class Card {

    //卡号
    @NotNull
    private String cardNo;
    //卡密码
    @NotNull
    private String cardPinCiperUnderZPK;

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getCardPinCiperUnderZPK() {
        return cardPinCiperUnderZPK;
    }

    public void setCardPinCiperUnderZPK(String cardPinCiperUnderZPK) {
        this.cardPinCiperUnderZPK = cardPinCiperUnderZPK;
    }
}
