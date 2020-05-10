import javax.swing.*;
import java.awt.*;

public class Gui {
    JFrame mainFrame = new JFrame();
    JPanel colorPane = new JPanel();
    Gui(){
        mainFrame.setResizable(false);
        mainFrame.setLocationRelativeTo(null);
        mainFrame.setLocation(new Point(mainFrame.getLocation().x-(1280/2),mainFrame.getLocation().y-(720/2)));
        mainFrame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        mainFrame.setSize(1280,720);
        mainFrame.add(colorPane);
        colorPane.setBackground(Color.black);
        mainFrame.setVisible(true);
    }

    public void cChange(int r, int g, int b){
        colorPane.setBackground(new Color(r,g,b,255));
    }
}
