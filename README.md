# D-Link-DCS-5000L-Streamer
Reverse engineering the streaming from a D-Link DC-S5000L (and perhaps other old D-Link cameras)

Basically the applet (that of course no longer works in todays browsers) basically just opens the url
    http://<ip-address>/mjpeg.cgi

(or possibly also http://<ip-address>/dgvideo.cgi)

While sending following headers:
    User-Agent: user
    Authorization: Basic <DeviceSerialNo>

The <DeviceSerialNo> can be fetched by surfing to the "Live Video" page, click in Java and save the page. Search the HTML for
for the string "DeviceSerialNo", the value field is the <DeviceSerialNo>.
This string is then actually a base64 encoded string for: admin:<password>

The first 4 lines of the result is HTTP-headers like:

Content-length: 42050\r\n
Date: 03-28-2025 12:32:19 AM IO_00000000_PT_191_010\r\n
Content-type: image/jpeg\r\n
\r\n

Then follows 42050 + 2 bytes of mpg (in the above example)

Then ending with:
\r\n
\r\n
--video boundary--
\r\n

After this comes next header and chunk:

Content-length: 42110\r\n
Date: 03-28-2025 12:44:58 AM IO_00000000_PT_191_010\r\n
Content-type: image/jpeg\r\n

