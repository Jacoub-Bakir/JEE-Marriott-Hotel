
package model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import javax.transaction.Transaction;


public class Database {
    
    public Connection connection;
    
    public Database(){
       connection = Myconnection.getConnection();
       
    }
    
    public void commitTransaction(Database connection) throws SQLException{
        connection.connection.commit();
        connection.connection.commit();
    }
    
    public void rollbackTransaction(Database connection) throws SQLException{
        connection.connection.rollback();
      
    }
    
    public void insertVisiteur(visiteur visiteur){
        String requete;
        PreparedStatement stmt;

        

        try {

                requete = "INSERT INTO `visiteur` (`nomVisiteur`, `Adresse`, `tel`) VALUES(?,?,?);";			
                stmt = connection.prepareStatement(requete);
                stmt.setString(1,visiteur.getNomVisiteur());
                stmt.setString(2,visiteur.getAdress());
                stmt.setInt(3,visiteur.getTel());
               
                
                stmt.executeUpdate();
                stmt.close();

                System.out.println("Inserted !");
        } catch (SQLException e) {
                System.out.println(e);
        }
    }
    
    public void insertHotel(hotel hotel){
        String requete;
        PreparedStatement stmt;


        try {

                requete = "INSERT INTO `hotel` (`nom`, `adresse`, `codepostal`, `ville`, `etoiles`, `capacite`, `disponible`) VALUES (?, ?, ?, ?,?, ?, ?);";			
                stmt = connection.prepareStatement(requete);
                stmt.setString(1,hotel.getNom());
                stmt.setString(2,hotel.getAdresse());
                stmt.setString(3,hotel.getCodePostal());
                stmt.setString(4,hotel.getVille());
                stmt.setInt(5,hotel.getEtoiles());
                stmt.setInt(6,hotel.getCapacite());
                stmt.setInt(7,hotel.getDisponible());
                
                stmt.executeUpdate();
                stmt.close();

                System.out.println("Inserted !");
        } catch (SQLException e) {
                System.out.println(e);
        }
    }
    
    public void insertChambre(chambre chambre){
        String requete;
        PreparedStatement stmt;


        try {

                requete = "INSERT INTO `chambre` (`numero`, `hotel`, `description`, `prix`, `nmbrPersonne`) VALUES (?, ?, ?, ?,?);";			
                stmt = connection.prepareStatement(requete);
                stmt.setInt(1,chambre.getNumero());
                stmt.setString(2,chambre.getHotel());
                stmt.setString(3,chambre.getDecription());
                stmt.setFloat(4,chambre.getPrix());
                stmt.setInt(5,chambre.getNmbrPersonne());
              
                
                stmt.executeUpdate();
                stmt.close();

                System.out.println("Inserted !");
        } catch (SQLException e) {
                System.out.println(e.getMessage());
        }
    }
    
    public chambre getRoom(int nmbrRoom,String hotel){
        String requete;
        PreparedStatement statement;

        chambre chambre = null;
        
        try {
                //this.connection.setAutoCommit(false);
            
                //READ_SERIALIZABLE = 8  ; READ_REPEATABLE_READ = 4 ; READ_COMMITTED = 2 ; READ_UNCOMMITTED = 1
                //this.connection.setTransactionIsolation(isolationLevel);

                requete = "SELECT * FROM chambre WHERE hotel = ? AND numero = ? ";
                statement = connection.prepareStatement(requete);
                statement.setString(1, hotel);
                statement.setInt(2, nmbrRoom);
                ResultSet result = statement.executeQuery();			

        while (result.next()) {
	        	
            chambre = new chambre();
            chambre.setNumero(result.getInt("numero"));
            chambre.setHotel(result.getString("hotel"));
            chambre.setDecription(result.getString("description"));
            chambre.setNmbrPersonne(result.getInt("nmbrPersonne"));
            chambre.setPrix(result.getFloat("prix"));

        }

                statement.close();

        } catch (SQLException e) {
                System.out.println(e);
        }

        return chambre;
    }
    
    public void editRoom(chambre chambre,int isolationLevel) {
        

        String requete;
	PreparedStatement stmt;
	
	
	try {   
            
                this.connection.setAutoCommit(false);
                //READ_SERIALIZABLE = 8  ; READ_REPEATABLE_READ = 4 ; READ_COMMITTED = 2 ; READ_UNCOMMITTED = 1
                this.connection.setTransactionIsolation(isolationLevel);
                
                requete = "UPDATE chambre SET description = ?, nmbrPersonne =  ?, prix = ?  WHERE numero = ? AND hotel = ?";

                stmt = connection.prepareStatement(requete);
                stmt.setString(1, chambre.getDecription());
                stmt.setInt(2, chambre.getNmbrPersonne());
                stmt.setFloat(3, chambre.getPrix());
                stmt.setInt(4, chambre.getNumero());
                stmt.setString(5, chambre.getHotel());
		stmt.executeUpdate();
                
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
    }
    
    public ArrayList<hotel> getHotels(){
        String requete;
        PreparedStatement statement;

        hotel hotel = null;
        ArrayList<hotel> hotelList = new ArrayList<hotel>();

        try {
                this.connection.setAutoCommit(true);

                requete = "SELECT * FROM hotel  ";
                statement = connection.prepareStatement(requete);


                ResultSet result = statement.executeQuery();			

        while (result.next()) {
	        	
            hotel = new hotel();
            hotel.setNom(result.getString("nom"));
            hotel.setAdresse(result.getString("adresse"));
            hotel.setCodePostal(result.getString("codepostal"));
            hotel.setVille(result.getString("ville"));
            hotel.setEtoiles(result.getInt("etoiles"));
            hotel.setCapacite(result.getInt("capacite"));
            hotel.setDisponible(result.getInt("disponible"));


            hotelList.add(hotel);
        }

                statement.close();

        } catch (SQLException e) {
                System.out.println(e);
        }

        return hotelList;
    }
    
    public ArrayList<chambre> getHotelRooms(String hotel){
        String requete;
        PreparedStatement statement;

        chambre chambre = null;
        ArrayList<chambre> hotelRoomsList = new ArrayList<chambre>();

        try {
                this.connection.setAutoCommit(true);
            
                //READ_SERIALIZABLE = 8  ; READ_REPEATABLE_READ = 4 ; READ_COMMITTED = 2 ; READ_UNCOMMITTED = 1
                //this.connection.setTransactionIsolation(isolationLevel);

                requete = "SELECT * FROM chambre WHERE hotel = ?  ";
                statement = connection.prepareStatement(requete);
                statement.setString(1, hotel);

                ResultSet result = statement.executeQuery();			

        while (result.next()) {
	        	
            chambre = new chambre();
            chambre.setNumero(result.getInt("numero"));
            chambre.setHotel(result.getString("hotel"));
            chambre.setDecription(result.getString("description"));
            chambre.setNmbrPersonne(result.getInt("nmbrPersonne"));
            chambre.setPrix(result.getFloat("prix"));


            hotelRoomsList.add(chambre);
        }

                statement.close();

        } catch (SQLException e) {
                System.out.println(e);
        }

        return hotelRoomsList;
    }
    
    public ArrayList<visiteur> getVisitors(){
        String requete;
        PreparedStatement statement;

        visiteur visiteur = null;
        ArrayList<visiteur> visitorList = new ArrayList<visiteur>();

        try {


                requete = "SELECT * FROM visiteur  ";
                statement = connection.prepareStatement(requete);


                ResultSet result = statement.executeQuery();			

        while (result.next()) {
	        	
        	visiteur = new visiteur();
        	visiteur.setNomVisiteur(result.getString("nomVisiteur"));
        	visiteur.setAdress(result.getString("Adresse"));
        	visiteur.setTel(result.getInt("tel"));
            
            


        	visitorList.add(visiteur);
        }

                statement.close();

        } catch (SQLException e) {
                System.out.println(e);
        }

        return visitorList;
    }
    
    public ArrayList<reserver_hotel> getReservations(){
         String requete;
        PreparedStatement statement;

        reserver_hotel reservation = null;
        ArrayList<reserver_hotel> reservationList = new ArrayList<reserver_hotel>();

        try {


                requete = "SELECT * FROM reserver_hotel  ";
                statement = connection.prepareStatement(requete);


                ResultSet result = statement.executeQuery();			

        while (result.next()) {
	        	
            reservation = new reserver_hotel();
            reservation.setVisiteur(result.getString("Visiteur"));
            reservation.setHotel(result.getString("hotel"));
            reservation.setChambre(result.getInt("chambre"));
            reservation.setDate_res(result.getTimestamp("date_res"));
            reservation.setDate_fin(result.getTimestamp("date_fin"));
            


            reservationList.add(reservation);
        }

                statement.close();

        } catch (SQLException e) {
                System.out.println(e);
        }

        return reservationList;
    }
    
    public ArrayList<Annulation> getCanceledReservations(){
         String requete;
        PreparedStatement statement;

        Annulation canceledReservation = null;
        ArrayList<Annulation> canceledReservationList = new ArrayList<Annulation>();

        try {


                requete = "SELECT * FROM Annulation  ";
                statement = connection.prepareStatement(requete);


                ResultSet result = statement.executeQuery();			

        while (result.next()) {
	        	
            canceledReservation = new Annulation();
            canceledReservation.setVisiteur(result.getString("visiteur"));
            canceledReservation.setHotel(result.getString("hotel"));
            canceledReservation.setChambre(result.getInt("chambre"));
            canceledReservation.setDate_debut(result.getTimestamp("date_debut"));
            


            canceledReservationList.add(canceledReservation);
        }

                statement.close();

        } catch (SQLException e) {
                System.out.println(e);
        }

        return canceledReservationList;
        
    }
    
    public ArrayList<chambre> consulter_hotelsProcedure(Timestamp date_res,Timestamp date_fin,int isolationLevel){
       CallableStatement cs =null;
        ResultSet result = null;
        chambre chambre=null;
        ArrayList<chambre> chambreLists= new ArrayList<chambre>();;
        try {
                //this.connection.setAutoCommit(false);
            
                //READ_SERIALIZABLE = 8  ; READ_REPEATABLE_READ = 4 ; READ_COMMITTED = 2 ; READ_UNCOMMITTED = 1
                this.connection.setTransactionIsolation(isolationLevel);
                cs = connection.prepareCall("{call `consulter_hotels`(?,?)}");
                cs.setTimestamp(1, date_res);
                cs.setTimestamp(2, date_fin);
                
                result = cs.executeQuery();
                while(result.next()){
                    chambre = new chambre();
                    chambre.setNumero(result.getInt("numero"));
                    chambre.setHotel(result.getString("hotel"));
                    chambre.setDecription(result.getString("description"));
                    chambre.setNmbrPersonne(result.getInt("nmbrPersonne"));
                    chambre.setPrix(result.getFloat("prix"));
                    chambreLists.add(chambre);
                }
                result.close();
        } catch (SQLException e) {
        e.printStackTrace();
        }
        return chambreLists;
        
    }
    
    public String reserver_chambreProcedure(reserver_hotel reservation,int isolationLevel){
        
        CallableStatement cs =null;
        ResultSet r = null;
        String msg= null;
        try {   
                this.connection.setAutoCommit(false);
                //READ_SERIALIZABLE = 8  ; READ_REPEATABLE_READ = 4 ; READ_COMMITTED = 2 ; READ_UNCOMMITTED = 1
                this.connection.setTransactionIsolation(isolationLevel);
                
                cs = connection.prepareCall("{call `reserver_chambre`(?,? ,?, ?,?,?)}");
                
                cs.setString(1, reservation.getVisiteur());
                cs.setString(2, reservation.getHotel());
                cs.setInt(3, reservation.getChambre());
                cs.setTimestamp(4, reservation.getDate_res());
                cs.setTimestamp(5, reservation.getDate_fin());
                cs.registerOutParameter(6, java.sql.Types.VARCHAR);
               
                r = cs.executeQuery();
                msg = cs.getString(6);
                r.close();
        } catch (SQLException e) {
        e.printStackTrace();
        }
        return msg;
    }
    
    public String annuler_reservationProcedure(Annulation canceledReservation){
        CallableStatement cs =null;
        ResultSet r = null;
        String msg= null;
        try {
                
                cs = connection.prepareCall("{call `annuler_reservation`(?,? , ?,?,?)}");
                cs.setString(1, canceledReservation.getVisiteur());
                cs.setString(2, canceledReservation.getHotel());
                cs.setInt(3, canceledReservation.getChambre());
                cs.setTimestamp(4, canceledReservation.getDate_debut());
                cs.registerOutParameter(5, java.sql.Types.VARCHAR);
                r = cs.executeQuery();
                msg = cs.getString(5);
                r.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return msg;
    }

}
