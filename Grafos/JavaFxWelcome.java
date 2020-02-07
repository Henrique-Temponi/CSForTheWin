import javafx.application.Application;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Menu;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
 
public class JavaFxWelcome extends Application {
    
    @Override
    public void start(Stage primaryStage) {
        
        Button butaoParaTest = new Button("Test!"); 
        Button butaoParaOutra = new Button("TEST");
        Button pagina2 = new Button("pagina 2");
        Button pagina1 = new Button("pagina 1");

        VBox boxPagina1 = new VBox(20.0, butaoParaTest, pagina2);
        VBox boxPagina2 = new VBox(20.0, butaoParaOutra, pagina1);

        Scene rootPagina1 = new Scene(boxPagina1);
        Scene rootPagina2 = new Scene(boxPagina2);

        pagina1.setOnAction(e -> {
            primaryStage.setScene(rootPagina1);
            primaryStage.show();
        });
        pagina2.setOnAction(e ->{
            primaryStage.setScene(rootPagina2);
            primaryStage.show();
        });

        butaoParaTest.setOnAction(e -> System.out.println("ok"));


        primaryStage.setScene(rootPagina1);
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}