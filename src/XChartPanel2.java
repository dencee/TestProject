package com.nordicid.testapplication;

import java.awt.Graphics;

import org.knowm.xchart.XChartPanel;
import org.knowm.xchart.internal.chartpart.Chart;

public class XChartPanel2<T extends Chart> extends XChartPanel<T> {
    private static final long serialVersionUID = 1L;
    
    public XChartPanel2(final T chart) {
        super( chart );
    }

//    @Override
//    public void paintComponent(Graphics g) {
//        super.paintComponent( g );
//        
//        g.drawString( "This is a string", 100, 100 );
//    }

}
