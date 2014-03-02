@echo off
sc stop PcapDNSProxyService
sc delete PcapDNSProxyService
sc create PcapDNSProxyService binPath= "%~dp0Pcap_DNSProxy.exe" start= auto
sc description PcapDNSProxyService "A local DNS server program base on WinPcap."
reg add HKLM\SYSTEM\CurrentControlSet\Services\PcapDNSProxyService\Parameters /v Application /d "%~dp0Pcap_DNSProxy.exe" /f
reg add HKLM\SYSTEM\CurrentControlSet\Services\PcapDNSProxyService\Parameters /v AppDirectory /d "%~dp0" /f
Pcap_DNSProxy
@echo.
@echo Done. Please confirm the PcapDNSProxyService service had been installed.
@echo.
@pause