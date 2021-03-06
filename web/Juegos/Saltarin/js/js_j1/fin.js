var boton;
var Fin = {
    
    preload: function(){
        juego.stage.backgroundColor = '#FFFFFF';
        juego.load.image('retry', 'Juegos/Saltarin/img/img_j1/retry.jpg');
    },
    
    create: function(){
        boton = this.add.button(juego.width/2,juego.height/2, 'retry',this.iniciarJuego, this);
        boton.anchor.setTo(0.5);
        boton.scale.setTo(0.5);
		
        var txtEtiqueta = juego.add.text(juego.width/2 -10, juego.height/2 -55, "Puntos:", 
                                        {font: "bold 24px sans-serif", fill:"black", aling:"center"});
                                        txtEtiqueta.anchor.setTo(0.5);
        var txtPuntosVal = juego.add.text(juego.width/2 +50, juego.height/2 -55, puntos.toString(), 
                                        {font: "bold 24px sans-serif", fill:"black", aling:"center"});
                                        txtPuntosVal.anchor.setTo(0.5);
        var txtTitulo = juego.add.text(juego.width/2, juego.height/2 -100, "GAME OVER", 
                                        {font: "bold 30px sans-serif", fill:"black", aling:"center"});
                                        txtTitulo.anchor.setTo(0.5);
        document.getElementById("puntaje").value = puntos.toString();
        document.getElementById("botonGuardarPuntuacion").style.display = "block";
    },
    
    iniciarJuego: function(){
        this.state.start('Juego');
    }
}