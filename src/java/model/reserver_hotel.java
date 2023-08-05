
package model;

import java.sql.Date;
import java.sql.Timestamp;


public class reserver_hotel {
   
    String Visiteur;
    String hotel;
    int chambre;
    Timestamp date_res;
    Timestamp date_fin;

    public String getVisiteur() {
        return Visiteur;
    }

    public void setVisiteur(String Visiteur) {
        this.Visiteur = Visiteur;
    }

    public String getHotel() {
        return hotel;
    }

    public void setHotel(String hotel) {
        this.hotel = hotel;
    }

    public int getChambre() {
        return chambre;
    }

    public void setChambre(int chambre) {
        this.chambre = chambre;
    }
    
    public Timestamp getDate_res() {
        return date_res;
    }

    public void setDate_res(Timestamp date_res) {
        this.date_res = date_res;
    }

    public Timestamp getDate_fin() {
        return date_fin;
    }

    public void setDate_fin(Timestamp date_fin) {
        this.date_fin = date_fin;
    }
    
    
}
