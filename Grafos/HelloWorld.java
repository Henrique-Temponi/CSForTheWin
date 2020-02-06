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
    //    Button btn = new Button();
    //    btn.setText("Say 'Hello World'");
    //    btn.setOnAction(new EventHandler<ActionEvent>() {
    //
    //        @Override
    //        public void handle(ActionEvent event) {
    //           System.out.println("Hello World!");
    //        }
    //    });
    //    
		StackPane root = new StackPane(); // comeca um novo paineu de formato de stack
    //   root.getChildren().add(btn);
    //
		Scene scene = new Scene(root, 300, 250, Color.RED); //Inicia a scene com as propriedades, e com root de guia
    //	
        primaryStage.setTitle("Hello World!"); // cria o titulo da janela
        primaryStage.setScene(scene); //settar a scene como a cena atual
        primaryStage.show(); // mostrar
		
		System.out.println("Hello");
		
		try {
			TimeUnit.SECONDS.sleep(5);
		} catch (Exception x) { }
		
		
    }
 public static void main(String[] args) {
        launch(args);
    }
}