This BASH scripts are mainly to spot IPs that are making login attempts (possible attacks).

The scripts are used on a Centos 7 system. Basically we play with <code>iptables</code> using /var/log/secure to spot suspicious IPs.

The idea is to follow this procedure:
<ol>
    <li>Execute <code>ips.sh</code>: it scans latests failed attempts and compares them with the current blocked IPs that <code>iptables</code> reports. The output will be the list of all IPs that register failed login attempts and an indication if it's currently blocked or not.</li>
    <li>Then we check the actual log file to see what exactly the suspicious IPs are doing:<br />
        <code>sudo cat /var/log/secure | grep $IP</code>
    </li>
    <li>Now we use <code>whois $IP</code> before actually blocking the IP since it could be our own and we'd be locked out afterwards!</li>
    <li>If the IP is suspicious enough, we block it <code>blockIP.sh $IP</code></li>
</ol>
