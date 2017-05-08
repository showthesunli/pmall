package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.data.serivce.ShoppingCartService;
import cn.highsuccess.module.BuyerItem;
import com.alibaba.fastjson.JSON;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * Created by prototype on 2017/5/6.
 * 购物车控制器
 */
@Controller
@RequestMapping(value = "/shoppingCart")
public class ShoppingCartController extends HisuBaseControllerAdapter {
    @Autowired
    @Qualifier(value = "findPrdNameBuPrdNo")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    private ShoppingCartService shoppingCartService;

    @Autowired
    protected ShoppingCartController(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    //显示购物车
    @RequestMapping(value = "")
    public String showCart(HttpServletRequest req,
                           HttpServletResponse rsp,
                           Model model,
                           @CookieValue(value = "SHOPPINGCART-ITEMS",required = false)String shoppingCartStr) throws UnsupportedEncodingException {
        //初始化shoppingCart
        this.initShoppingCart(shoppingCartStr,this.shoppingCartService);
//        model.addAttribute(shoppingCartService.getShoppingCart());

        //根据产品编号查询产品名称
        StringBuilder sb = new StringBuilder();
        for (BuyerItem item : shoppingCartService.getShoppingCart().getBuyerItemList()){
            sb.append(item.getPrdNo()+",");
        }
        sb.deleteCharAt(sb.length()-1);
        this.getJds().service("jf_mainPage","queryPhyPrdInfoByPrdNoList","keyWordsFld="+sb.toString());
        JSONArray arr = this.getJds().getDataList();
        for (BuyerItem item : shoppingCartService.getShoppingCart().getBuyerItemList()){
            for (int i=0;i<arr.length();i++){
                if (arr.optJSONObject(i).optString("prdNo").equals(item.getPrdNo())){
                    item.setPrdName(arr.optJSONObject(i).optString("productInfo"));
                    item.setFileName(arr.optJSONObject(i).optString("iconFileName"));
                }
            }
        }

        model.addAttribute(shoppingCartService.getShoppingCart().getBuyerItemList());
        model.addAttribute(shoppingCartService.countProMoney());
        model.addAttribute(shoppingCartService.countProNum());
        //将购物车商品条目重新写入cookie
        this.writBuyerItemsToCookie(rsp,this.shoppingCartService);

        return "/shoppingCart";
    }

    //添加商品进入购物车
    @RequestMapping(value = "/addCart")
    public String addItemtoCart(HttpServletRequest req,
                                HttpServletResponse rsp,
                                Model model,
                                @CookieValue(value = "SHOPPINGCART-ITEMS",required = false)String shoppingCartStr,
                                BuyerItem buyerItem) throws UnsupportedEncodingException {
        //初始化shoppingCart
        this.initShoppingCart(shoppingCartStr,this.shoppingCartService);

        //添加商品进入购物车
        this.shoppingCartService.addProduct(buyerItem);


        //根据产品编号查询产品名称
        StringBuilder sb = new StringBuilder();
        for (BuyerItem item : shoppingCartService.getShoppingCart().getBuyerItemList()){
            sb.append(item.getPrdNo()+",");
        }
        sb.deleteCharAt(sb.length()-1);
        this.getJds().service("jf_mainPage","queryPhyPrdInfoByPrdNoList","keyWordsFld="+sb.toString());
        JSONArray arr = this.getJds().getDataList();
        for (BuyerItem item : shoppingCartService.getShoppingCart().getBuyerItemList()){
            for (int i=0;i<arr.length();i++){
                if (arr.optJSONObject(i).optString("prdNo").equals(item.getPrdNo())){
                    item.setPrdName(arr.optJSONObject(i).optString("productInfo"));
                    item.setFileName(arr.optJSONObject(i).optString("iconFileName"));
                }
            }
        }

        model.addAttribute(shoppingCartService.getShoppingCart().getBuyerItemList());
        model.addAttribute(shoppingCartService.countProMoney());
        model.addAttribute(shoppingCartService.countProNum());

        //将购物车商品条目重新写入cookie
        this.writBuyerItemsToCookie(rsp,this.shoppingCartService);

        return "/shoppingCart";
    }

}
