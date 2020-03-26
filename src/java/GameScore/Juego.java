/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GameScore;

/**
 *
 * @author estudiantes
 */
public class Juego {
    
    private String nomJuego;
    private int vecesJugadas;
    
    public Juego(){
        this.nomJuego = "";
        this.vecesJugadas = 0;
    }

    public String getNomJuego() {
        return nomJuego;
    }

    public void setNomJuego(String nomJuego) {
        this.nomJuego = nomJuego;
    }

    public int getVecesJugadas() {
        return vecesJugadas;
    }

    public void setVecesJugadas(int vecesJugadas) {
        this.vecesJugadas = vecesJugadas;
    }
    
}
