/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase;

import GameScore.Juego;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author estudiantes
 */
public class GamesDataBase {
    
    ConectDataBase db;
    
    public GamesDataBase(){
        this.db=new ConectDataBase();
    }
    
    public void insertar_juego(Juego j){
        try{
            String sql="insert into juegos(nombreJuego,"
                    + "veces)"
                    + "values(?,?)";
            PreparedStatement pstm=db.getConexion().prepareStatement(sql);
            pstm.setString(1, j.getNomJuego());
            pstm.setInt(2, j.getVecesJugadas());
            
            pstm.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public void sumar_veces_jugadas(Juego j){
        try{
            String sql="select * from juegos where nombreJuego = ?";
            PreparedStatement pstm=db.getConexion().prepareStatement(sql);
            pstm.setString(1, j.getNomJuego());
            ResultSet res=pstm.executeQuery();
            if (res.next()){
                int suma = res.getInt("veces") + 1;
                sql="update juegos set veces = ? where nombreJuego = ?";
                pstm=db.getConexion().prepareStatement(sql);
                pstm.setInt(1, suma);
                pstm.setString(2, j.getNomJuego());
                pstm.executeUpdate();
            }
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public ResultSet obtener_juego(String juego) throws SQLException{
        String sql="select * from juegos where nombreJuego = ?";
        PreparedStatement pstm=db.getConexion().prepareStatement(sql);
        pstm.setString(1, juego);
        ResultSet res=pstm.executeQuery();
        return res;
    }
    
}
