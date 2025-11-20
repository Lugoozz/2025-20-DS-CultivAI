package vista;

import control.Controlador_HU022_ActualizarPerfil;
import javax.swing.ImageIcon;


public class HU022_ActualizarPerfil extends javax.swing.JFrame {
    private int idUsuarioBD;
    private String tipoUsuarioBD;
    private boolean passwordVisible = false;
    private final String placeholder = "";
    private boolean mostrandoPlaceholder = true;
    private Controlador_HU022_ActualizarPerfil controlador;

    
    public HU022_ActualizarPerfil(int idUsuarioBD,String tipoUsuarioBD) {
        initComponents();
        this.idUsuarioBD = idUsuarioBD;
        this.tipoUsuarioBD = tipoUsuarioBD;
        this.setLocationRelativeTo(null);
        
        controlador = new Controlador_HU022_ActualizarPerfil(this, idUsuarioBD, tipoUsuarioBD);
        
        
        

    }
    
    public HU022_ActualizarPerfil() {
        initComponents();
       
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jPanel3 = new javax.swing.JPanel();
        lblActualizarPerfil = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        txtNombreAct = new javax.swing.JTextField();
        txtApellidosAct = new javax.swing.JTextField();
        txtDniAct = new javax.swing.JTextField();
        txtCorreoAct = new javax.swing.JTextField();
        txtTelefonoAct = new javax.swing.JTextField();
        txtContrasenaAct = new javax.swing.JPasswordField();
        lblVerContrasena = new javax.swing.JLabel();
        jPanel2 = new javax.swing.JPanel();
        jLabel5 = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel3.setBackground(new java.awt.Color(204, 255, 204));
        jPanel3.setPreferredSize(new java.awt.Dimension(70, 20));

        lblActualizarPerfil.setForeground(new java.awt.Color(0, 0, 0));
        lblActualizarPerfil.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        lblActualizarPerfil.setText("Actualizar");
        lblActualizarPerfil.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        lblActualizarPerfil.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                lblActualizarPerfilMouseClicked(evt);
            }
        });

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(lblActualizarPerfil, javax.swing.GroupLayout.DEFAULT_SIZE, 100, Short.MAX_VALUE)
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(lblActualizarPerfil, javax.swing.GroupLayout.DEFAULT_SIZE, 30, Short.MAX_VALUE)
        );

        jPanel1.add(jPanel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(290, 280, 100, 30));

        jLabel3.setText("Telefono:");
        jPanel1.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 190, -1, 20));

        jLabel2.setFont(new java.awt.Font("Segoe UI Black", 1, 24)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(153, 153, 153));
        jLabel2.setText("ACTUALIZAR INFORMACIÓN");
        jPanel1.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(160, 10, -1, -1));

        jLabel4.setText("Contraseña:");
        jPanel1.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 220, -1, 20));

        jLabel8.setText("DNI:");
        jPanel1.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 130, -1, 20));

        jLabel9.setText("Apellidos:");
        jPanel1.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 100, -1, 20));

        jLabel10.setText("Correo:");
        jPanel1.add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 160, -1, 20));

        jLabel11.setText("Nombre:");
        jPanel1.add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 70, -1, 20));
        jPanel1.add(txtNombreAct, new org.netbeans.lib.awtextra.AbsoluteConstraints(250, 70, 200, -1));
        jPanel1.add(txtApellidosAct, new org.netbeans.lib.awtextra.AbsoluteConstraints(250, 100, 200, -1));
        jPanel1.add(txtDniAct, new org.netbeans.lib.awtextra.AbsoluteConstraints(250, 130, 200, -1));
        jPanel1.add(txtCorreoAct, new org.netbeans.lib.awtextra.AbsoluteConstraints(250, 160, 200, -1));
        jPanel1.add(txtTelefonoAct, new org.netbeans.lib.awtextra.AbsoluteConstraints(250, 190, 200, -1));

        txtContrasenaAct.setText("jPasswordField1");
        txtContrasenaAct.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                txtContrasenaActFocusLost(evt);
            }
        });
        txtContrasenaAct.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                txtContrasenaActMousePressed(evt);
            }
        });
        jPanel1.add(txtContrasenaAct, new org.netbeans.lib.awtextra.AbsoluteConstraints(250, 220, 200, -1));

        lblVerContrasena.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/ojo_cerrado.png"))); // NOI18N
        lblVerContrasena.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        lblVerContrasena.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                lblVerContrasenaMouseClicked(evt);
            }
        });
        jPanel1.add(lblVerContrasena, new org.netbeans.lib.awtextra.AbsoluteConstraints(460, 220, -1, -1));

        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 40, 640, 360));

        jLabel5.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel5.setText("Volver");
        jLabel5.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jLabel5.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel5MouseClicked(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel5, javax.swing.GroupLayout.DEFAULT_SIZE, 50, Short.MAX_VALUE)
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel5, javax.swing.GroupLayout.DEFAULT_SIZE, 30, Short.MAX_VALUE)
        );

        getContentPane().add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 10, 50, 30));

        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/login.jpg"))); // NOI18N
        jLabel1.setText("jLabel1");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 1860, 1170));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void lblActualizarPerfilMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_lblActualizarPerfilMouseClicked
        controlador.actualizarPerfil();
    }//GEN-LAST:event_lblActualizarPerfilMouseClicked

    private void jLabel5MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel5MouseClicked
        controlador.regresarPerfil();
    }//GEN-LAST:event_jLabel5MouseClicked

    private void lblVerContrasenaMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_lblVerContrasenaMouseClicked
      
        controlador.togglePasswordVisibility();
    }//GEN-LAST:event_lblVerContrasenaMouseClicked

    private void txtContrasenaActMousePressed(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_txtContrasenaActMousePressed
            
            
        if (mostrandoPlaceholder) {
           txtContrasenaAct.setText("");
           txtContrasenaAct.setEchoChar('*');
           mostrandoPlaceholder = false;
       }
    }//GEN-LAST:event_txtContrasenaActMousePressed

    private void txtContrasenaActFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtContrasenaActFocusLost
            
        if (txtContrasenaAct.getPassword().length == 0) {
            txtContrasenaAct.setText(placeholder);
            txtContrasenaAct.setEchoChar((char)0);
            mostrandoPlaceholder = true;
        }
    }//GEN-LAST:event_txtContrasenaActFocusLost
    
       

        // ====== MÉTODOS GET ======
    public String getTxtNombreAct() { return txtNombreAct.getText(); }
    public String getTxtApellidosAct() { return txtApellidosAct.getText(); }
    public String getTxtDniAct() { return txtDniAct.getText(); }
    public String getTxtCorreoAct() { return txtCorreoAct.getText(); }
    public String getTxtTelefonoAct() { return txtTelefonoAct.getText(); }
    public String getTxtContrasenaAct() { return new String(txtContrasenaAct.getPassword()); }

    // ====== MÉTODOS SET ======
    public void setTxtNombreAct(String nombre) { txtNombreAct.setText(nombre); }
    public void setTxtApellidosAct(String apellidos) { txtApellidosAct.setText(apellidos); }
    public void setTxtDniAct(String dni) { txtDniAct.setText(dni); }
    public void setTxtCorreoAct(String correo) { txtCorreoAct.setText(correo); }
    public void setTxtTelefonoAct(String telefono) { txtTelefonoAct.setText(telefono); }
    public void setTxtContrasenaAct(String contrasena) { 
    txtContrasenaAct.setText(contrasena);
    txtContrasenaAct.setEchoChar('*');
    mostrandoPlaceholder = false;
}

    // ====== MÉTODOS AUXILIARES ======
    public void mostrarContrasena(boolean visible) {
        if (visible) {
            txtContrasenaAct.setEchoChar((char) 0);
            lblVerContrasena.setIcon(new ImageIcon(getClass().getResource("/img/ojo_abierto.png")));
        } else {
            txtContrasenaAct.setEchoChar('*');
            lblVerContrasena.setIcon(new ImageIcon(getClass().getResource("/img/ojo_cerrado.png")));
        }
    }

    public void mostrarOjoCerrado() {
        lblVerContrasena.setIcon(new ImageIcon(getClass().getResource("/img/ojo_cerrado.png")));
    }

    public void limpiarCampos() {
        txtNombreAct.setText("");
        txtApellidosAct.setText("");
        txtDniAct.setText("");
        txtCorreoAct.setText("");
        txtTelefonoAct.setText("");
        txtContrasenaAct.setText("");
    }


    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(HU022_ActualizarPerfil.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(HU022_ActualizarPerfil.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(HU022_ActualizarPerfil.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(HU022_ActualizarPerfil.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new HU022_ActualizarPerfil().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JLabel lblActualizarPerfil;
    private javax.swing.JLabel lblVerContrasena;
    private javax.swing.JTextField txtApellidosAct;
    private javax.swing.JPasswordField txtContrasenaAct;
    private javax.swing.JTextField txtCorreoAct;
    private javax.swing.JTextField txtDniAct;
    private javax.swing.JTextField txtNombreAct;
    private javax.swing.JTextField txtTelefonoAct;
    // End of variables declaration//GEN-END:variables
}
