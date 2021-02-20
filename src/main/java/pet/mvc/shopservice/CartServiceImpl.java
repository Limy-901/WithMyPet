package pet.mvc.shopservice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import pet.mvc.shopdomain.Cart;
import pet.mvc.shopdomain.Product;
import pet.mvc.shopmapper.CartMapper;
import pet.mvc.shopmapper.ProductMapper;


@Log4j
@Service("CartServiceImpl")
public class CartServiceImpl implements CartService {

	
	@Autowired
	private CartMapper cartMapper;
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private Cart cart;
	@Override
	public List<Cart> findCartProducts(long product_code) throws Exception {
		//���̺� �߰��ϱ� ���� ������ ��ǰ ��ȣ�� ������ ��ȸ
		log.info("listCart �߳���: "+product_code);
		List<Cart> c = cartMapper.selectCountInCart(product_code);
		if(c !=null) log.info("cart �ξƴ�:" +c);
		return cartMapper.selectCountInCart(product_code);
	}
	@Override
	public void addProductsInCart(Cart cart) throws Exception {//��ٱ��Ͽ� �߰��Ѵ�.
		cartMapper.insertProductsInCart(cart);
	}
}
