package model;

public class Cart {

	private int id, pid;
	private String un, sa, ba, q ;
	
	private Product product;
	

	@Override
	public String toString() {
		return "Cart [id=" + id + ", pid=" + pid + ", q=" + q + ",  product=" + product + ", un=" + un
				+ ", sa=" + sa + ", ba=" + ba + "]";
	}
	
	public Product getProduct(){
		return product;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getQ() {
		return q;
	}
	public void setQ(String q) {
		this.q = q;
	}
	public String getUn() {
		return un;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public void setUn(String un) {
		this.un = un;
	}
	public String getSa() {
		return sa;
	}
	public void setSa(String sa) {
		this.sa = sa;
	}
	public String getBa() {
		return ba;
	}
	public void setBa(String ba) {
		this.ba = ba;
	}
	

}
