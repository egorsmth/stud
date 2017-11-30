package g;

import main.Main;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class Gui extends JDialog {
    private JPanel contentPane;
    private JButton buttonOK;
    private JButton buttonCancel;

    private JLabel total_package_count;
    private JLabel success_package_count;
    private JLabel destroyed_package_count;
    private JLabel resource_time_count;


    public Gui() {
        setContentPane(contentPane);
        setModal(true);
        getRootPane().setDefaultButton(buttonOK);


        buttonOK.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                onOK();
            }
        });

        buttonCancel.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                onCancel();
            }
        });

        // call onCancel() when cross is clicked
        setDefaultCloseOperation(DO_NOTHING_ON_CLOSE);
        addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                onCancel();
            }
        });

        // call onCancel() on ESCAPE
        contentPane.registerKeyboardAction(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                onCancel();
            }
        }, KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0), JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
    }

    private void onOK() {
        Main m = new Main();
        m.start();
        this.total_package_count.setText(Integer.toString(m.all));
        this.destroyed_package_count.setText(Integer.toString(m.fault));
        this.success_package_count.setText(Integer.toString(m.success));
        this.resource_time_count.setText(Integer.toString(m.resource));
    }

    private void onCancel() {
        // add your code here if necessary
        dispose();
    }

    public static void main(String[] args) {
        Gui dialog = new Gui();
        dialog.setPreferredSize(new Dimension(300,300));
        dialog.pack();
        dialog.setVisible(true);
        System.exit(0);
    }

}
