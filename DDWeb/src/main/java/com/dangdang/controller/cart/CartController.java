package com.dangdang.controller.cart;

import com.dangdang.commons.redis.RedisService;
import com.dangdang.commons.utils.CookieUtils;
import com.dangdang.commons.vo.Cart;
import com.dangdang.commons.vo.CartItem;
import com.dangdang.commons.vo.JsonType;
import com.dangdang.pojo.Product;
import com.dangdang.service.IProductService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-5-4
 * Time: 下午4:20
 */
@RequestMapping("/cart")
@Controller
public class CartController {
    private final static Logger logger = Logger.getLogger(CartController.class);

    private IProductService productService;
    private RedisService redisService;

    @RequestMapping("/toCart")
    public ModelAndView toCart(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("cart/shopping_cart");
        try {
            String email = CookieUtils.findCookie("loginEmail", request);
            Cart colls = (Cart) redisService.get(email + "_colls");
            Cart buys = (Cart) redisService.get(email + "_buys");
            mav.addObject("all_cost", calCost(buys));
            mav.addObject("cart_colls", colls);
            mav.addObject("cart_buys", buys);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mav;
    }

    @RequestMapping("/toCart/{productId}/{num}")
    public ModelAndView buyToCart(HttpServletRequest request, @PathVariable("productId") Integer productId, @PathVariable("num") Integer num) {
        ModelAndView mav = new ModelAndView("cart/shopping_cart");
        try {
            String email = CookieUtils.findCookie("loginEmail", request);
            Cart buys = (Cart) redisService.get(email + "_buys");
            if (buys == null) {
                buys = new Cart();
            }
            Product product = productService.getProductById(productId);
            CartItem cartItem = new CartItem();
            cartItem.setProduct(product);
            cartItem.setSum(num);
            if (!buys.getItems().contains(cartItem)) {
                buys.getItems().add(cartItem);
                redisService.set(email + "_buys", buys);
            }
            Cart colls = (Cart) redisService.get(email + "_colls");
            mav.addObject("all_cost", calCost(buys));
            mav.addObject("cart_colls", colls);
            mav.addObject("cart_buys", buys);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mav;
    }

    @RequestMapping("/add")
    @ResponseBody
    public JsonType addToCollection(@RequestParam("productId") Integer productId, HttpServletRequest request) {
        JsonType jsonType = new JsonType();
        Cart cart;
        String email = null;
        try {
            email = CookieUtils.findCookie("loginEmail", request);
            cart = (Cart) redisService.get(email + "_colls");
            if (cart == null) {
                cart = new Cart();
            }
            Product product = productService.getProductById(productId);
            CartItem cartItem = new CartItem();
            cartItem.setProduct(product);
            cartItem.setSum(1);
            cart.getItems().add(cartItem);
            redisService.set(email + "_colls", cart);
            jsonType.setStatus(1);
        } catch (Exception e) {
            jsonType.setDesc("加入收藏夹失败！");
            jsonType.setStatus(0);
            logger.info("加入收藏夹失败！email = " + email);
        }
        return jsonType;
    }

    @RequestMapping("/empty")
    public ModelAndView empytCart(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("cart/shopping_cart");
        try {
            String email = CookieUtils.findCookie("loginEmail", request);
            redisService.del(email + "_buys");
            Cart colls = (Cart) redisService.get(email + "_colls");
            mav.addObject("all_cost", "0.00");
            mav.addObject("cart_colls", colls);
            mav.addObject("cart_buys", null);
        } catch (UnsupportedEncodingException e) {

        }
        return mav;
    }

    //0 购物车到收藏夹  1 收藏夹到购物车
    @RequestMapping("/change/{productId}/{type}")
    public ModelAndView change(HttpServletRequest request,
                               @PathVariable("type") Integer type,
                               @PathVariable("productId") Integer productId) {
        ModelAndView mav = new ModelAndView("cart/shopping_cart");
        try {
            String email = CookieUtils.findCookie("loginEmail", request);
            Cart colls = (Cart) redisService.get(email + "_colls");
            Cart buys = (Cart) redisService.get(email + "_buys");
            // 从购物车添加到收藏夹
            if (type == 0) {
                CartItem cartItem = null;
                if (colls == null) {
                    colls = new Cart();
                }
                for (int i = 0; i < buys.getItems().size(); i++) {
                    if (buys.getItems().get(i).getProduct().getId().intValue() == productId.intValue()) {
                        cartItem = buys.getItems().remove(i);
                        colls.getItems().add(cartItem);
                    }
                }
            }
            // 从收藏夹移到购物车
            else if (type == 1) {
                CartItem cartItem = null;
                if (buys == null) {
                    buys = new Cart();
                }
                for (int i = 0; i < colls.getItems().size(); i++) {
                    if (colls.getItems().get(i).getProduct().getId().intValue() == productId.intValue()) {
                        cartItem = colls.getItems().remove(i);
                        buys.getItems().add(cartItem);
                    }
                }
            }
            redisService.set(email + "_colls", colls);
            redisService.set(email + "_buys", buys);
            mav.addObject("all_cost", calCost(buys));
            mav.addObject("cart_colls", colls);
            mav.addObject("cart_buys", buys);
        } catch (UnsupportedEncodingException e) {

        }
        return mav;
    }

    @RequestMapping("/del/{productId}/{type}")
    public ModelAndView del(HttpServletRequest request,
                            @PathVariable("productId") Integer productId,
                            @PathVariable("type") Integer type) {
        ModelAndView mav = new ModelAndView("cart/shopping_cart");
        try {
            String email = CookieUtils.findCookie("loginEmail", request);
            Cart colls = (Cart) redisService.get(email + "_colls");
            Cart buys = (Cart) redisService.get(email + "_buys");
            // 从购物车删除
            if (type == 0) {
                for (int i = 0; i < buys.getItems().size(); i++) {
                    if (buys.getItems().get(i).getProduct().getId().intValue() == productId.intValue()) {
                        buys.getItems().remove(i);
                    }
                }
                redisService.set(email + "_buys", buys);
            }
            // 从收藏夹删除
            else if (type == 1) {
                for (int i = 0; i < colls.getItems().size(); i++) {
                    if (colls.getItems().get(i).getProduct().getId().intValue() == productId.intValue()) {
                        colls.getItems().remove(i);
                    }
                }
                redisService.set(email + "_colls", colls);
            }
            mav.addObject("all_cost", calCost(buys));
            mav.addObject("cart_colls", colls);
            mav.addObject("cart_buys", buys);
        } catch (UnsupportedEncodingException e) {

        }
        return mav;
    }

    private double calCost(Cart buys) {
        double result = 0.0;
        for (int i = 0; i < buys.getItems().size(); i++) {
            result += buys.getItems().get(i).getProduct().getDangPrice() * buys.getItems().get(i).getSum();
        }
        return result;
    }

    @Autowired
    public void setProductService(IProductService productService) {
        this.productService = productService;
    }

    @Autowired
    public void setRedisService(RedisService redisService) {
        this.redisService = redisService;
    }
}
