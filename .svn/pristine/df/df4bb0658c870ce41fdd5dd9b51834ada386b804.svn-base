package com.scbd.common.utl;





import org.geotools.geometry.jts.JTSFactoryFinder;

import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.LineString;
import com.vividsolutions.jts.geom.MultiLineString;
import com.vividsolutions.jts.io.ParseException;
import com.vividsolutions.jts.io.WKTReader;
import com.vividsolutions.jts.operation.buffer.BufferOp;

public class GeoUtl {

	private static GeometryFactory geometryFactory = JTSFactoryFinder.getGeometryFactory( null );
	
	public static Geometry getGeo(String geo) throws ParseException{  
        WKTReader reader = new WKTReader( geometryFactory );  
        Geometry geometry1 = (Geometry) reader.read(geo); 
        return geometry1;  
    }
	
	public static Geometry getBuffer(Geometry geo,double interval) throws ParseException{  
		BufferOp bufOp = new BufferOp(geo);		
		Geometry bg1 = bufOp.getResultGeometry(interval);
        return bg1;  
    }  
	
	
	
	
	public static void main(String[] args) {
		try {
			/*MultiLineString a1=(MultiLineString)GeoUtl.getGeo("MultiLineString((121 30,120 30,-180 90))");
			a1.setSRID(4326);
			
			Geometry a2=(Geometry)GeoUtl.getGeo("Polygon((-180 -90,180 -90,180 90,-180 90,-180 -90))");
			a1.setSRID(4326);
			a2.setSRID(4326);
			
			Geometry finalG=a2.intersection(a1);
			
			System.out.println(finalG.toString());*/
			/*Geometry a1=GeoUtl.getGeo("MultiLineString((121 30,120 30),(122 40,122 41))");
			
			for(int i=0;i<a1.getNumGeometries();i++){
				System.out.println(a1.getGeometryN(i).toString());
			}*/
			Geometry a1=GeoUtl.getGeo("linestring(120 30,121 30)");
			Geometry a2=GeoUtl.getBuffer(a1, 0.1);
			System.out.println(a2);
			
		} catch (ParseException e) {			
			e.printStackTrace();
		}

	}

}
