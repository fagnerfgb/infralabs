Install-WindowsFeature ADCS-Cert-Authority -IncludeManagementTools
Install-ADcsCertificationAuthority -CAType StandaloneRootCa -CACommonName "srv-ca-root01" -CryptoProviderName "RSA#Microsoft Software Key Storage Provider" -KeyLength 2048 -HashAlgorithmName SHA2 -ValidityPeriod Years -ValidityPeriodUnits 5 -DatabaseDirectory "C:\windows\system32\certLog" -LogDirectory "c:\windows\system32\CertLog" -Force