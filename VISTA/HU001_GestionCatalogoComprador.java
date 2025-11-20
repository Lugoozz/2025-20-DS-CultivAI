package vista;

import javax.swing.JOptionPane;

import control.Controlador_HU001_GestionCatalogoProductos;


public class HU001_GestionCatalogoComprador extends javax.swing.JFrame {
    private int idUsuarioBD;
    private Controlador_HU001_GestionCatalogoProductos controlador = new Controlador_HU001_GestionCatalogoProductos();


    
    public HU001_GestionCatalogoComprador(int idUsuarioBD) {
        initComponents();
        this.idUsuarioBD = idUsuarioBD;
        System.out.println("ID del usuario comprador: " + idUsuarioBD);
        cargarTodosLosProductos();
        this.setLocationRelativeTo(null);
    }


    public HU001_GestionCatalogoComprador() {
        initComponents();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        buttonGroup1 = new javax.swing.ButtonGroup();
        Background = new javax.swing.JPanel();
        MenuDeOpciones = new javax.swing.JPanel();
        jPanel4 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jPanel6 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jPanel5 = new javax.swing.JPanel();
        jLabel4 = new javax.swing.JLabel();
        jPanel10 = new javax.swing.JPanel();
        jLabel7 = new javax.swing.JLabel();
        jPanel11 = new javax.swing.JPanel();
        jLabel8 = new javax.swing.JLabel();
        jPanel2 = new javax.swing.JPanel();
        jLabel16 = new javax.swing.JLabel();
        jPanel18 = new javax.swing.JPanel();
        jLabel21 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jLabel22 = new javax.swing.JLabel();
        jLabel17 = new javax.swing.JLabel();
        txtCantidadProducto = new javax.swing.JPanel();
        jPanel12 = new javax.swing.JPanel();
        txtBuscar = new javax.swing.JTextField();
        jLabel14 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tablaProductos = new javax.swing.JTable();
        jPanel1 = new javax.swing.JPanel();
        jLabel13 = new javax.swing.JLabel();
        txtCantidadComprar = new javax.swing.JTextField();
        jPanel17 = new javax.swing.JPanel();
        lblAgregarAlCarrito = new javax.swing.JLabel();
        lblBuscarProductos = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        Background.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        MenuDeOpciones.setBackground(new java.awt.Color(0, 90, 71));
        MenuDeOpciones.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel2.setText("CultivAI");

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel2, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 44, Short.MAX_VALUE)
        );

        MenuDeOpciones.add(jPanel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 170, -1));

        jPanel6.setBackground(new java.awt.Color(0, 90, 71));

        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("Inicio");
        jLabel1.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jLabel1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel1MouseClicked(evt);
            }
        });

        javax.swing.GroupLayout jPanel6Layout = new javax.swing.GroupLayout(jPanel6);
        jPanel6.setLayout(jPanel6Layout);
        jPanel6Layout.setHorizontalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        jPanel6Layout.setVerticalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, 37, Short.MAX_VALUE)
        );

        MenuDeOpciones.add(jPanel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 62, 120, -1));

        jPanel5.setBackground(new java.awt.Color(0, 90, 71));

        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText("Catálogo");
        jLabel4.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));

        javax.swing.GroupLayout jPanel5Layout = new javax.swing.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel4, javax.swing.GroupLayout.DEFAULT_SIZE, 120, Short.MAX_VALUE)
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel4, javax.swing.GroupLayout.DEFAULT_SIZE, 38, Short.MAX_VALUE)
        );

        MenuDeOpciones.add(jPanel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 117, -1, -1));

        jPanel10.setBackground(new java.awt.Color(0, 90, 71));

        jLabel7.setForeground(new java.awt.Color(255, 255, 255));
        jLabel7.setText("Mi Perfil");
        jLabel7.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jLabel7.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel7MouseClicked(evt);
            }
        });

        javax.swing.GroupLayout jPanel10Layout = new javax.swing.GroupLayout(jPanel10);
        jPanel10.setLayout(jPanel10Layout);
        jPanel10Layout.setHorizontalGroup(
            jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel7, javax.swing.GroupLayout.DEFAULT_SIZE, 56, Short.MAX_VALUE)
        );
        jPanel10Layout.setVerticalGroup(
            jPanel10Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel7, javax.swing.GroupLayout.DEFAULT_SIZE, 35, Short.MAX_VALUE)
        );

        MenuDeOpciones.add(jPanel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 375, -1, -1));

        jPanel11.setBackground(new java.awt.Color(0, 90, 71));

        jLabel8.setForeground(new java.awt.Color(255, 255, 255));
        jLabel8.setText("Cerrar Sesión");
        jLabel8.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jLabel8.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel8MouseClicked(evt);
            }
        });

        javax.swing.GroupLayout jPanel11Layout = new javax.swing.GroupLayout(jPanel11);
        jPanel11.setLayout(jPanel11Layout);
        jPanel11Layout.setHorizontalGroup(
            jPanel11Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel8, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 77, Short.MAX_VALUE)
        );
        jPanel11Layout.setVerticalGroup(
            jPanel11Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel8, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 35, Short.MAX_VALUE)
        );

        MenuDeOpciones.add(jPanel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 416, -1, -1));

        jPanel2.setBackground(new java.awt.Color(0, 90, 71));
        jPanel2.setMaximumSize(new java.awt.Dimension(32, 16));
        jPanel2.setMinimumSize(new java.awt.Dimension(32, 16));
        jPanel2.setPreferredSize(new java.awt.Dimension(120, 36));

        jLabel16.setForeground(new java.awt.Color(255, 255, 255));
        jLabel16.setText("Carrito");
        jLabel16.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jLabel16.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel16MouseClicked(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel16, javax.swing.GroupLayout.DEFAULT_SIZE, 120, Short.MAX_VALUE)
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel16, javax.swing.GroupLayout.DEFAULT_SIZE, 36, Short.MAX_VALUE)
        );

        MenuDeOpciones.add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 220, -1, -1));

        jPanel18.setBackground(new java.awt.Color(0, 90, 71));

        jLabel21.setForeground(new java.awt.Color(255, 255, 255));
        jLabel21.setText("Pagos");
        jLabel21.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jLabel21.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel21MouseClicked(evt);
            }
        });

        javax.swing.GroupLayout jPanel18Layout = new javax.swing.GroupLayout(jPanel18);
        jPanel18.setLayout(jPanel18Layout);
        jPanel18Layout.setHorizontalGroup(
            jPanel18Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel21, javax.swing.GroupLayout.DEFAULT_SIZE, 120, Short.MAX_VALUE)
        );
        jPanel18Layout.setVerticalGroup(
            jPanel18Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel21, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 36, Short.MAX_VALUE)
        );

        MenuDeOpciones.add(jPanel18, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 170, -1, -1));

        jLabel3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/home.png"))); // NOI18N
        MenuDeOpciones.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(6, 62, -1, 37));

        jLabel9.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/salir.png"))); // NOI18N
        jLabel9.setText(" ");
        MenuDeOpciones.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(6, 416, 23, 35));

        jLabel10.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/user.png"))); // NOI18N
        MenuDeOpciones.add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(6, 375, -1, 35));

        jLabel11.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/catalogo.png"))); // NOI18N
        MenuDeOpciones.add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(6, 117, -1, 38));

        jLabel22.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/Pagos.png"))); // NOI18N
        MenuDeOpciones.add(jLabel22, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 170, -1, 36));

        jLabel17.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/carrito.png"))); // NOI18N
        MenuDeOpciones.add(jLabel17, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 220, 30, 40));

        Background.add(MenuDeOpciones, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 170, 470));

        txtCantidadProducto.setBackground(new java.awt.Color(255, 255, 255));

        jPanel12.setBackground(new java.awt.Color(204, 204, 204));
        jPanel12.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());
        jPanel12.add(txtBuscar, new org.netbeans.lib.awtextra.AbsoluteConstraints(110, 50, 110, -1));

        jLabel14.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        jLabel14.setForeground(new java.awt.Color(0, 0, 0));
        jLabel14.setText("CATÁLOGO DE PRODUCTOS");
        jPanel12.add(jLabel14, new org.netbeans.lib.awtextra.AbsoluteConstraints(350, 10, -1, -1));

        jLabel5.setForeground(new java.awt.Color(0, 0, 0));
        jLabel5.setText("Buscar:");
        jPanel12.add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 50, -1, 20));

        tablaProductos.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Nombre", "Precio", "Stock", "Unidad"
            }
        ));
        jScrollPane1.setViewportView(tablaProductos);

        jPanel12.add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 90, 520, 330));

        jPanel1.setBackground(new java.awt.Color(204, 255, 204));
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel13.setForeground(new java.awt.Color(0, 0, 0));
        jLabel13.setText("Cantidad:");
        jPanel1.add(jLabel13, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 40, -1, 20));
        jPanel1.add(txtCantidadComprar, new org.netbeans.lib.awtextra.AbsoluteConstraints(110, 40, 90, -1));

        jPanel17.setBackground(new java.awt.Color(102, 255, 102));

        lblAgregarAlCarrito.setForeground(new java.awt.Color(0, 0, 0));
        lblAgregarAlCarrito.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        lblAgregarAlCarrito.setText("Agregar al carrito");
        lblAgregarAlCarrito.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        lblAgregarAlCarrito.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                lblAgregarAlCarritoMouseClicked(evt);
            }
        });

        javax.swing.GroupLayout jPanel17Layout = new javax.swing.GroupLayout(jPanel17);
        jPanel17.setLayout(jPanel17Layout);
        jPanel17Layout.setHorizontalGroup(
            jPanel17Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel17Layout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addComponent(lblAgregarAlCarrito, javax.swing.GroupLayout.PREFERRED_SIZE, 110, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        jPanel17Layout.setVerticalGroup(
            jPanel17Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel17Layout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addComponent(lblAgregarAlCarrito, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        jPanel1.add(jPanel17, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 100, -1, -1));

        jPanel12.add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(620, 140, 250, 160));

        lblBuscarProductos.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/buscar.png"))); // NOI18N
        lblBuscarProductos.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        lblBuscarProductos.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                lblBuscarProductosMouseClicked(evt);
            }
        });
        jPanel12.add(lblBuscarProductos, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 50, -1, -1));

        javax.swing.GroupLayout txtCantidadProductoLayout = new javax.swing.GroupLayout(txtCantidadProducto);
        txtCantidadProducto.setLayout(txtCantidadProductoLayout);
        txtCantidadProductoLayout.setHorizontalGroup(
            txtCantidadProductoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel12, javax.swing.GroupLayout.DEFAULT_SIZE, 920, Short.MAX_VALUE)
        );
        txtCantidadProductoLayout.setVerticalGroup(
            txtCantidadProductoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel12, javax.swing.GroupLayout.DEFAULT_SIZE, 470, Short.MAX_VALUE)
        );

        Background.add(txtCantidadProducto, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 0, 920, 470));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(Background, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(Background, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void lblBuscarProductosMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_lblBuscarProductosMouseClicked
        String texto = txtBuscar.getText().trim();
        tablaProductos.setModel(controlador.buscarProductos(texto));
        tablaProductos.getColumnModel().getColumn(0).setMinWidth(0);
        tablaProductos.getColumnModel().getColumn(0).setMaxWidth(0);
    }//GEN-LAST:event_lblBuscarProductosMouseClicked

    private void jLabel1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel1MouseClicked
        HU024_InicioComprador formIA = new HU024_InicioComprador(idUsuarioBD);
        formIA.setVisible(true);
        this.dispose();
    }//GEN-LAST:event_jLabel1MouseClicked

    private void jLabel21MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel21MouseClicked
        HU003_GestionPagosComprador GPC =  new HU003_GestionPagosComprador (idUsuarioBD);
        GPC.setVisible(true);
        this.dispose();
    }//GEN-LAST:event_jLabel21MouseClicked

    private void jLabel16MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel16MouseClicked
        HU023_GestionCarrito car = new HU023_GestionCarrito(idUsuarioBD);
        car.setVisible(true);
        this.dispose();
    }//GEN-LAST:event_jLabel16MouseClicked

    private void lblAgregarAlCarritoMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_lblAgregarAlCarritoMouseClicked
            
        int fila = tablaProductos.getSelectedRow();
        if (fila == -1) {
            JOptionPane.showMessageDialog(this, "Seleccione un producto.");
            return;
        }

        int idProducto = Integer.parseInt(tablaProductos.getValueAt(fila, 0).toString());
        double stock = Double.parseDouble(tablaProductos.getValueAt(fila, 3).toString());
        int cantidad = Integer.parseInt(txtCantidadComprar.getText());

        controlador.agregarAlCarrito(idUsuarioBD, idProducto, cantidad, stock);

    }//GEN-LAST:event_lblAgregarAlCarritoMouseClicked

    private void jLabel8MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel8MouseClicked
        HU004_AutenticacionUsuario AU = new HU004_AutenticacionUsuario();
        AU.setVisible(true);
        this.dispose();
    }//GEN-LAST:event_jLabel8MouseClicked

    private void jLabel7MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel7MouseClicked
        HU020_GestionPerfilComprador GPC = new HU020_GestionPerfilComprador(idUsuarioBD);
        GPC.setVisible(true);
        this.dispose();
    }//GEN-LAST:event_jLabel7MouseClicked
           
    private void cargarTodosLosProductos() {
        tablaProductos.setModel(controlador.buscarProductos(""));
        tablaProductos.getColumnModel().getColumn(0).setMinWidth(0);
        tablaProductos.getColumnModel().getColumn(0).setMaxWidth(0); // Ocultar ID
    }


    /**
     * @param args the command line arguments
     */
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
            java.util.logging.Logger.getLogger(HU001_GestionCatalogoComprador.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(HU001_GestionCatalogoComprador.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(HU001_GestionCatalogoComprador.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(HU001_GestionCatalogoComprador.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
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
                new HU001_GestionCatalogoComprador().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel Background;
    private javax.swing.JPanel MenuDeOpciones;
    private javax.swing.ButtonGroup buttonGroup1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel16;
    private javax.swing.JLabel jLabel17;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel21;
    private javax.swing.JLabel jLabel22;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel10;
    private javax.swing.JPanel jPanel11;
    private javax.swing.JPanel jPanel12;
    private javax.swing.JPanel jPanel17;
    private javax.swing.JPanel jPanel18;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JLabel lblAgregarAlCarrito;
    private javax.swing.JLabel lblBuscarProductos;
    private javax.swing.JTable tablaProductos;
    private javax.swing.JTextField txtBuscar;
    private javax.swing.JTextField txtCantidadComprar;
    private javax.swing.JPanel txtCantidadProducto;
    // End of variables declaration//GEN-END:variables
}
