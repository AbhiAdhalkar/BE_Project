package hardware;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import gnu.io.CommPortIdentifier; 
import gnu.io.SerialPort;
import gnu.io.SerialPortEvent; 
import gnu.io.SerialPortEventListener; 
import java.util.Enumeration;


import java.util.Properties;
import javax.sound.midi.MidiDevice.Info;
import Dbconnection.DBconnect;

public class ArduinoConnection implements SerialPortEventListener {
SerialPort serialPort;
    /** The port we're normally going to use. */
private static final String PORT_NAMES[] = {"/dev/tty.usbserial-A9007UX1", // Mac OS X
        "/dev/ttyUSB0", // Linux
        "COM3", // Windows
};

static String kitid;
static String temp;
static String hum;
static String mq135;
static String mq8;
static String mq4;
static String rfid;
static String addedDate;
static String addedTime;
static BufferedReader input;
private static OutputStream output;
private static final int TIME_OUT = 2000;
private static final int DATA_RATE = 9600;
Properties prop = new Properties();
public void initialize() {
	
    CommPortIdentifier portId = null;
    Enumeration portEnum = CommPortIdentifier.getPortIdentifiers();

    //First, Find an instance of serial port as set in PORT_NAMES.
    while (portEnum.hasMoreElements()) {
        CommPortIdentifier currPortId = (CommPortIdentifier) portEnum.nextElement();
        for (String portName : PORT_NAMES) {
            if (currPortId.getName().equals(portName)) {
                portId = currPortId;
                break;
            }
        }
    }
    if (portId == null) {
        System.out.println("Could not find COM port...");
        return;
    }

    try {
        serialPort = (SerialPort) portId.open(this.getClass().getName(),
                TIME_OUT);
        serialPort.setSerialPortParams(DATA_RATE,
                SerialPort.DATABITS_8,
                SerialPort.STOPBITS_1,
                SerialPort.PARITY_NONE);

        // open the streams
        input = new BufferedReader(new InputStreamReader(serialPort.getInputStream()));
        output = serialPort.getOutputStream();
//        output=serialPort.getOutputBufferSize();

        
       
        
        serialPort.addEventListener(this);
        serialPort.notifyOnDataAvailable(true);
        
        
    } catch (Exception e) {
        System.err.println(e.toString());
    }
}


public synchronized void close() {
    if (serialPort != null) {
        serialPort.removeEventListener();
        serialPort.close();
    }
}

public synchronized void serialEvent(SerialPortEvent oEvent) {
	
    if (oEvent.getEventType() == SerialPortEvent.DATA_AVAILABLE) {
    	
    	 try {
         
           if(input.ready())
       
           kitid=input.readLine();
           System.out.println("kit id = "+kitid);
           Thread.sleep(1000);
           
           temp=input.readLine();
           System.out.println("temperature = "+temp);
           Thread.sleep(1000);
           
           hum=input.readLine();
           System.out.println("humidity = "+hum);
           Thread.sleep(1000);
           
           mq135=input.readLine();
           System.out.println("mq135 = "+mq135);
           Thread.sleep(1000);
           
           mq8=input.readLine();
           System.out.println("mq8 = "+mq8);
           Thread.sleep(1000);
           
           mq4=input.readLine();
           System.out.println("mq4 = "+mq4);
           Thread.sleep(1000);
           
           rfid=input.readLine();
           System.out.println("rfid = "+rfid);
           Thread.sleep(1000);
        
       
        	Connection conn=DBconnect.getConnect();
	 	         
		      
        	PreparedStatement ps = conn.prepareStatement("UPDATE toilet_details SET temp=? , humidity=? , mq135=? , mq8=? , mq4=? where kitid=?");
 	 	      
 	 	        ps.setString(1,temp);
 	 	        ps.setString(2,hum);
 	 	        ps.setString(3,mq135);
 	 	        ps.setString(4,mq8);
 	 	        ps.setString(5,mq4);
 	 	        ps.setString(6,kitid);
 	 	
 	 	        ps.executeUpdate();
 	 	        
 	 	        
 	 	        
				
				
				if(!rfid.equals("0"))
				{
					DateTimeFormatter dtf1=DateTimeFormatter.ofPattern("yyyy-MM-dd");
					LocalDateTime now1=LocalDateTime.now();
					DateTimeFormatter dtf2=DateTimeFormatter.ofPattern("HH-mm-ss");
					LocalDateTime now2=LocalDateTime.now();
					addedDate=dtf1.format(now1);
					addedTime=dtf2.format(now2);
					
					PreparedStatement ps2 = conn.prepareStatement("insert into uncleanedlog values(?,?,?,?,?,?,?,?,?,?)");
		 	        ps2.setInt(1,0);
		 	        ps2.setString(2,rfid);
		 	        ps2.setString(3,kitid);
		 	        ps2.setString(4,mq135);
		 	        ps2.setString(5,mq8);
		 	        ps2.setString(6,mq4);
		 	        ps2.setString(7,temp);
		 	        ps2.setString(8,hum);
		 	        ps2.setString(9,addedDate);
		 	        ps2.setString(10,addedTime);
		 	
		 	       int i1 = ps2.executeUpdate();
		 	       if(i1>0)
		 	       {
		 	    	   System.out.println("Log Added..!!");
		 	       }
				}
        	 	
        }
    	 catch(Exception e)
    	 {
    		 System.err.println(e);
    		 e.printStackTrace();
    	 }
           
            
        }
   
    
    }
    

  
    // Ignore all the other eventTypes, but you should consider the other ones.


private Object open(String inputLine, String string) {
	
	// TODO Auto-generated method stub
	return null;
}
public static void main(String[] args) throws SQLException {
	 
	ArduinoConnection main = new ArduinoConnection();
 
    
   main.initialize();
  
        
    Thread t=new Thread() {
        public void run() {
            //the following line will keep this app alive for 1000    seconds,
            //waiting for events to occur and responding to them    (printing incoming messages to console).
            try {Thread.sleep(1000000);} catch (InterruptedException    ie) {}
        }
    };

    
    
   
 
          t.start();
    
    System.out.println("Server Started");
    
    
   
}
}

