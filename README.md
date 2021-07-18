# FPGA__ESP8266__Car__Control
We used FPGA to control the action of motor and used the ESP8266 NodeMCU to send the control signal from web page.
<br>
## WIFI control module
We used the ESP8266 NodeMUC wifi module and contructed the control interface with HTML code<br>
to control the electric car.<br>
<img src="https://github.com/tim8557/FPGA__ESP8266__Car__Control/blob/main/images/esp8266_nodemcu.jpg" width="200" ><br>

## User control interface
Here is the web page that we use to control the electic car.<br>
<br>
![image](https://github.com/tim8557/FPGA__ESP8266__Car__Control/blob/main/images/wifi_control_interface.JPG)<br>

## Use FPGA to control the motor
The pictire is the time sequence and state machine of FPGA. The sync_d0, sync_d1 and sync_d2<br>
are the signals from ESP8266. We use this three signals to make the motor action. For example, if the control<br>
signal is 3'b001, the motor will be acclerated. There are seven states in our project.<br>
<br>
**clk:** clock frequency of FPGA<br>
**rst:** reset signal<br>
**d0_sync:** the signal from ESP8226 to the syncornizer<br>
**d1_sync:** the signal from ESP8226 to the syncornizer<br>
**d2_sync:** the signal from ESP8226 to the syncornizer<br>
**state:** the state was used to control the action of motor.<br>
**pwm:** we used the duty cycle to control rotational speed of motor.<br>
**pwm2:** make the motor work at different rotational speed for turnig left or right.<br>
![image](https://github.com/tim8557/FPGA__ESP8266__Car__Control/blob/main/images/time_sequence.JPG)
<br>
We used L293D to control the direction of rotation.


https://www.youtube.com/watch?v=zgS9nRPCUMc
