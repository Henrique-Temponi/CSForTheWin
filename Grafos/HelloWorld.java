import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;
import javafx.scene.paint.Color;
import java.util.concurrent.TimeUnit;
 
public class HelloWorld extends Application {
    
    @Override
    public void start(Stage primaryStage) {
        Button btn = new Button(); // fazer um novo butao 
        btn.setText("Say 'Hello World'"); //setar o que o butao vai falar
        btn.setOnAction(new EventHandler<ActionEvent>() { //quando o butao apertado fazer uma novo handler de evento
    
            @Override
            public void handle(ActionEvent event) { //provavelmente esse metodo deve ter apenas uma funcao, pego o event handler
               System.out.println("Hello World!");  //e quando for ativado e imprimir hello world no console
            }
        });
		
        
		StackPane root = new StackPane(); // comeca um novo paineu de formato de stack
		root.getChildren().add(btn);    
		Scene scene = new Scene(root, 300, 250, Color.RED); //Inicia a scene com as propriedades, e com root de guia
    	
        primaryStage.setTitle("Hello World!"); // cria o titulo da janela
        primaryStage.setScene(scene); //settar a scene como a cena atual
        primaryStage.show(); // mostrar
		
		System.out.println("Hello");
		
		//try {
		//	TimeUnit.SECONDS.sleep(5);
		//} catch (Exception x) { }
		
		
    }
 public static void main(String[] args) {
        launch(args);
    }
}