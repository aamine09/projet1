package controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import models.ProduitDAO;
import models.Produit;

/**
 * Servlet implementation class ProduitController
 */
public class ProduitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
        private ProduitDAO produitDAO;

        public void init() {
              produitDAO = new ProduitDAO();
         
       }

    /**
     * Default constructor. 
     */
    public ProduitController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
	

        switch (action) {
         case "new":
            showNewForm(request, response);
            break;
        case "delete":
            deleteProduit(request, response);
            break;
        case "edit":
            showEditForm(request, response);
            break;
         case "list":
            listProduits(request, response);
            break;
         
        	 
        }
        
      
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		switch (action) {
          
        case "insert":
        	insertProduit(request, response);
            break;
            
        case "update":
            updateProduit(request, response);
            break;
		
		}
	}
    private void listProduits(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        List<Produit> listProduits = produitDAO.findAll();
        request.setAttribute("listProduits", listProduits);
        RequestDispatcher dispatcher = request.getRequestDispatcher("produit.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("new-form.jsp");
        dispatcher.forward(request, response);
    }

    private void insertProduit(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String nom = request.getParameter("Nom");
        double prix = Double.parseDouble(request.getParameter("Prix"));
        int quantité = Integer.parseInt(request.getParameter("Quantité"));
       

        Produit newProduit = new Produit(nom,prix,quantité);
      
        produitDAO.create(newProduit);
        response.sendRedirect("ProduitController?action=list");
    }

    private void deleteProduit(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        produitDAO.delete(id);
        response.sendRedirect("ProduitController?action=list");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Produit existingProduit = produitDAO.findById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("edit-form.jsp");
        request.setAttribute("produit", existingProduit);
        dispatcher.forward(request, response);
    }

    private void updateProduit(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
    	int id = Integer.parseInt(request.getParameter("id"));
    	String nom = request.getParameter("Nom");
        double prix = Double.parseDouble(request.getParameter("Prix"));
        int quantité = Integer.parseInt(request.getParameter("Quantité"));

        Produit produitToUpdate = produitDAO.findById(id);
        produitToUpdate.setNom(nom);
        produitToUpdate.setPrix(prix);
        produitToUpdate.setQuantité(quantité);
        produitDAO.update(produitToUpdate);
        response.sendRedirect("ProduitController?action=list");
    }

   
}