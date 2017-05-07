package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.config.systemproperties.HisuMngDataIdArgs;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.data.serivce.ShoppingCartService;
import com.alibaba.fastjson.JSON;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * Created by prototype on 2017/3/24.
 */
public abstract class HisuBaseControllerAdapter {
    protected final Log logger = LogFactory.getLog(this.getClass());
    protected JavaDataSet jds;
    protected JavaOperate javaOperate;



    protected JavaDataSet getJds() {
        return jds;
    }

    protected JavaOperate getJavaOperate(){
        return this.javaOperate;
    }


    protected  HisuBaseControllerAdapter(JavaDataSet jds,JavaOperate javaOperate){
        this.javaOperate = javaOperate;
        this.jds = jds;
    }

    protected void handleError(Model model,Errors errors){
        List<FieldError> fieldErrors = errors.getFieldErrors();
        Iterator<FieldError> it = fieldErrors.iterator();
        Map<String,String> errorMap = new HashMap<String,String>();
        while (it.hasNext()){
            FieldError fieldError = it.next();
            errorMap.put(fieldError.getField(), fieldError.getDefaultMessage());
        }
        model.addAttribute("errorMsg", errorMap);
    }


    protected void excute(Model model,Map<String,Object> map,HisuMngDataGroupAndId hisuMngDataGroupAndId){
        //获取groupID
        Set<String> set = hisuMngDataGroupAndId.getDataId().keySet();
        Iterator<String> iterator = set.iterator();
        while (iterator.hasNext()){
            String groupId = iterator.next();
            List<HisuMngDataIdArgs> list = hisuMngDataGroupAndId.getDataId().get(groupId);
            if (null != list && list.size()!=0){
                for (int i=0;i<list.size();i++){
                    StringBuffer condition = new StringBuffer();
                    for (int l=0;l<list.get(i).getArgs().size();l++){
                        //组装条件
                        condition.append(list.get(i).getArgs().get(l));
                        condition.append("=");
                        condition.append(map.get(list.get(i).getArgs().get(l)));
                        condition.append("|");
                    }
                    condition.deleteCharAt(condition.length()-1);
                    this.getJds().service(groupId,list.get(i).getId(),condition.toString());
                    model.addAttribute(list.get(i).getId(), JSON.parseArray(this.getJds().getDataList().toString()));
                }
            }
        }
    }

    protected void excuteOperate(Model model,Map<String,Object> map,HisuMngDataGroupAndId hisuMngDataGroupAndId){
        //获取groupID
        Set<String> set = hisuMngDataGroupAndId.getDataId().keySet();
        Iterator<String> iterator = set.iterator();
        while (iterator.hasNext()){
            String groupId = iterator.next();
            List<HisuMngDataIdArgs> list = hisuMngDataGroupAndId.getDataId().get(groupId);
            if (null != list && list.size()!=0){
                for (int i=0;i<list.size();i++){
                    StringBuffer condition = new StringBuffer();
                    for (int l=0;l<list.get(i).getArgs().size();l++){
                        //组装条件
                        condition.append(list.get(i).getArgs().get(l));
                        condition.append("=");
                        condition.append(map.get(list.get(i).getArgs().get(l)));
                        condition.append("|");
                    }
                    condition.deleteCharAt(condition.length()-1);
                    this.getJavaOperate().service(groupId, list.get(i).getId(), condition.toString());
                    model.addAttribute(list.get(i).getId(), JSON.parseObject(this.getJavaOperate().getResponseData().toString()));
                }
            }
        }
    }

    //初始化购物车
    protected void  initShoppingCart(String str,ShoppingCartService shoppingCartService) throws UnsupportedEncodingException {
        if (str == null){
            //cookie中不存在购物车
            shoppingCartService.getShoppingCart().initShoppingCart();
        }else {
            //cookie中存在购物车
            byte[] byteStr = Base64.getUrlDecoder().decode(str);
            shoppingCartService.getShoppingCart().initShoppingCart(new String(byteStr,"UTF-8"));
        }
    }

    //将购物车内商品条目写入cookie
    protected void writBuyerItemsToCookie(HttpServletResponse rsp,ShoppingCartService shoppingCartService) throws UnsupportedEncodingException {
        String base64Items = Base64.getUrlEncoder().encodeToString(JSON.toJSONString(shoppingCartService.getShoppingCart().getBuyerItemList()).getBytes("UTF-8"));
        Cookie cookie = new Cookie("SHOPPINGCART-ITEMS", base64Items);
        //设置path是可以共享cookie
        cookie.setPath("/");
        //设置Cookie过期时间: -1 表示关闭浏览器失效  0: 立即失效  >0: 单位是秒, 多少秒后失效
        cookie.setMaxAge(10*24*60*60);
        //5,Cookie写会浏览器
        rsp.addCookie(cookie);
    }

}
