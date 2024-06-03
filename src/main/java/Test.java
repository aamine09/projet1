import java.util.List;

import models.Produit;
import models.ProduitDAO;

public class Test {

	public static void main(String[] args) {
		ProduitDAO pd=new ProduitDAO();
		
		pd.create(new Produit("hp",3000.0,10));
		pd.create(new Produit("DELL",5000.0,20));
		pd.create(new Produit("Lenonovo",2500.0,30));
		pd.create(new Produit("mac",12000.0,10));
	
	      
		


	}

}
