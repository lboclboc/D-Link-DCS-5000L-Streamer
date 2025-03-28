# D-Link-DCS-5000L-Streamer
Reverse engineering the streaming from a D-Link DC-S5000L (and perhaps other old D-Link cameras)

Basically the applet (that of course no longer works in todays browsers) basically just opens the url
    http://_IP-address_/mjpeg.cgi

(or possibly also http://_IP-address_/dgvideo.cgi)

While sending following headers:
    User-Agent: user
    Authorization: Basic &lt;DeviceSerialNo&gt;

The &lt;DeviceSerialNo&gt; string is actually a base64 encoded string for: admin:_password_

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


The camera is controlled with the url:

    GET /IOCONTROL.CGI HTTP/1.0\r\n
    User-Agent: user\r\n
    Authorization: Basic &lt;DeviceSerialNo&gt;\r\n
    \r\n
