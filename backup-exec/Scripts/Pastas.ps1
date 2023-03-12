<# Obter lista de todos os discos #> 
Get-Disk

<# Inicializar disco #>
Initialize-Disk -Number 1 -PartitionStyle MBR

<# Formatar e criar uma nova partição na unidade #>
New-Partition -DiskNumber 1 -UseMaximumSize | Format-Volume -FileSystem NTFS -NewFileSystemLabel Dados

<# Atribuir uma letra de unidade à unidade de disco #>
Get-Partition -DiskNumber 1 | Set-Partition -NewDriveLetter F

<# Instala Resource-Manager #>
Install-WindowsFeature -Name FS-Resource-Manager -IncludeManagementTools

<# Cria as pastas e compartilhamentos #>
Foreach($folder in Get-Content "C:\Scripts\04-file-server\folders.txt")
{
New-Item "F:\$folder" -ItemType directory
New-SMBShare –Name $folder –Path "F:\$folder" -ChangeAccess "Domain Users"
}
New-Item "F:\Home$" -ItemType directory
New-SMBShare –Name Home$ –Path "F:\Home$" -FullAccess "Domain Users"
<# Cria as permissões na pasta Aulas #>
(Get-ACL -Path "F:\Aulas").Access | Format-Table IdentityReference, FileSystemRights, AccessControlType, IsInherited, InheritanceFlags -AutoSize
$ACL = Get-ACL -Path "F:\Aulas"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Professores","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Aulas" -AclObject $ACL
$ACL = Get-ACL -Path "F:\Aulas"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Coordenadores","ReadAndExecute","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Aulas" -AclObject $ACL
$ACL = Get-ACL -Path "F:\Aulas"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Suporte","ReadAndExecute","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Aulas" -AclObject $ACL
$ACL = Get-ACL -Path "F:\Aulas"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Alunos","ReadAndExecute","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Aulas" -AclObject $ACL
<# Cria as permissões na pasta Provas #>
(Get-ACL -Path "F:\Provas").Access | Format-Table IdentityReference, FileSystemRights, AccessControlType, IsInherited, InheritanceFlags -AutoSize
$ACL = Get-ACL -Path "F:\Provas"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Professores","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Provas" -AclObject $ACL
$ACL = Get-ACL -Path "F:\Provas"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Coordenadores","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Provas" -AclObject $ACL
$ACL = Get-ACL -Path "F:\Provas"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Suporte","ReadAndExecute","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Provas" -AclObject $ACL
<# Cria as permissões na pasta Alunos #>
(Get-ACL -Path "F:\Alunos").Access | Format-Table IdentityReference, FileSystemRights, AccessControlType, IsInherited, InheritanceFlags -AutoSize
$ACL = Get-ACL -Path "F:\Alunos"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Professores","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Alunos" -AclObject $ACL
$ACL = Get-ACL -Path "F:\Alunos"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Coordenadores","ReadAndExecute","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Alunos" -AclObject $ACL
$ACL = Get-ACL -Path "F:\Alunos"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Suporte","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Alunos" -AclObject $ACL
$ACL = Get-ACL -Path "F:\Alunos"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Alunos","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Alunos" -AclObject $ACL
<# Cria as permissões na pasta Trabalhos #>
(Get-ACL -Path "F:\Trabalhos").Access | Format-Table IdentityReference, FileSystemRights, AccessControlType, IsInherited, InheritanceFlags -AutoSize
$ACL = Get-ACL -Path "F:\Trabalhos"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Professores","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Trabalhos" -AclObject $ACL
$ACL = Get-ACL -Path "F:\Trabalhos"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Coordenadores","ReadAndExecute","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Trabalhos" -AclObject $ACL
$ACL = Get-ACL -Path "F:\Trabalhos"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Suporte","ReadAndExecute","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Trabalhos" -AclObject $ACL
$ACL = Get-ACL -Path "F:\Trabalhos"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Alunos","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Trabalhos" -AclObject $ACL
<# Cria as permissões na pasta Coordenacao #>
(Get-ACL -Path "F:\Coordenacao").Access | Format-Table IdentityReference, FileSystemRights, AccessControlType, IsInherited, InheritanceFlags -AutoSize
$ACL = Get-ACL -Path "F:\Coordenacao"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Coordenadores","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Coordenacao" -AclObject $ACL
$ACL = Get-ACL -Path "F:\Coordenacao"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Suporte","ReadAndExecute","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Coordenacao" -AclObject $ACL
<# Cria as permissões na pasta Diretoria$ #>
(Get-ACL -Path "F:\Diretoria$").Access | Format-Table IdentityReference, FileSystemRights, AccessControlType, IsInherited, InheritanceFlags -AutoSize
$ACL = Get-ACL -Path "F:\Diretoria$"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Diretoria","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Diretoria$" -AclObject $ACL
<# Cria as permissões na pasta Suporte #>
(Get-ACL -Path "F:\Suporte").Access | Format-Table IdentityReference, FileSystemRights, AccessControlType, IsInherited, InheritanceFlags -AutoSize
$ACL = Get-ACL -Path "F:\Suporte"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Suporte","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Suporte" -AclObject $ACL
<# Cria as permissões na pasta Softwares$ #>
(Get-ACL -Path "F:\Softwares$").Access | Format-Table IdentityReference, FileSystemRights, AccessControlType, IsInherited, InheritanceFlags -AutoSize
$ACL = Get-ACL -Path "F:\Softwares$"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Suporte","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Softwares$" -AclObject $ACL
<# Cria as permissões na pasta Publica #>
(Get-ACL -Path "F:\Publica").Access | Format-Table IdentityReference, FileSystemRights, AccessControlType, IsInherited, InheritanceFlags -AutoSize
$ACL = Get-ACL -Path "F:\Publica"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Professores","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Publica" -AclObject $ACL
$ACL = Get-ACL -Path "F:\Publica"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Coordenadores","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Publica" -AclObject $ACL
$ACL = Get-ACL -Path "F:\Publica"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Suporte","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Publica" -AclObject $ACL
$ACL = Get-ACL -Path "F:\Publica"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Alunos","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Publica" -AclObject $ACL
$ACL = Get-ACL -Path "F:\Publica"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Diretoria","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Publica" -AclObject $ACL
<# Cria as permissões na pasta Turmas #>
(Get-ACL -Path "F:\Turmas").Access | Format-Table IdentityReference, FileSystemRights, AccessControlType, IsInherited, InheritanceFlags -AutoSize
$ACL = Get-ACL -Path "F:\Turmas"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Professores","ReadAndExecute","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Turmas" -AclObject $ACL
$ACL = Get-ACL -Path "F:\Turmas"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Coordenadores","ReadAndExecute","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Turmas" -AclObject $ACL
$ACL = Get-ACL -Path "F:\Turmas"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Suporte","ReadAndExecute","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Turmas" -AclObject $ACL
$ACL = Get-ACL -Path "F:\Turmas"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Alunos","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Turmas" -AclObject $ACL
<# Cria as permissões na pasta Ex-Alunos2 #>
(Get-ACL -Path "F:\Ex-Alunos2").Access | Format-Table IdentityReference, FileSystemRights, AccessControlType, IsInherited, InheritanceFlags -AutoSize
$ACL = Get-ACL -Path "F:\Ex-Alunos2"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Diretoria","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Ex-Alunos2" -AclObject $ACL
$ACL = Get-ACL -Path "F:\Ex-Alunos2"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Coordenadores","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Ex-Alunos2" -AclObject $ACL
<# Cria as permissões na pasta Projeto2 #>
(Get-ACL -Path "F:\Projeto2").Access | Format-Table IdentityReference, FileSystemRights, AccessControlType, IsInherited, InheritanceFlags -AutoSize
$ACL = Get-ACL -Path "F:\Projeto2"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Coordenadores","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Projeto2" -AclObject $ACL
<# Cria as permissões na pasta Financeiro2 #>
(Get-ACL -Path "F:\Financeiro2").Access | Format-Table IdentityReference, FileSystemRights, AccessControlType, IsInherited, InheritanceFlags -AutoSize
$ACL = Get-ACL -Path "F:\Financeiro2"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Coordenadores","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Financeiro2" -AclObject $ACL
$ACL = Get-ACL -Path "F:\Financeiro2"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Jefferson.Costa","Modify","ContainerInherit, ObjectInherit","None","Deny")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Financeiro2" -AclObject $ACL
<# Cria as permissões na pasta Relatorios2 #>
(Get-ACL -Path "F:\Relatorios2").Access | Format-Table IdentityReference, FileSystemRights, AccessControlType, IsInherited, InheritanceFlags -AutoSize
$ACL = Get-ACL -Path "F:\Relatorios2"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Professores","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Relatorios2" -AclObject $ACL
$ACL = Get-ACL -Path "F:\Relatorios2"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Kelly.Cristina","Modify","ContainerInherit, ObjectInherit","None","Deny")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Relatorios2" -AclObject $ACL
<# Cria as permissões na pasta Auditoria$ #>
(Get-ACL -Path "F:\Auditoria$").Access | Format-Table IdentityReference, FileSystemRights, AccessControlType, IsInherited, InheritanceFlags -AutoSize
$ACL = Get-ACL -Path "F:\Auditoria$"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Domain Users","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\Auditoria$" -AclObject $ACL
<# Cria as permissões na pasta NotasFinais #>
(Get-ACL -Path "F:\NotasFinais").Access | Format-Table IdentityReference, FileSystemRights, AccessControlType, IsInherited, InheritanceFlags -AutoSize
$ACL = Get-ACL -Path "F:\NotasFinais"
$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("Domain Users","Modify","ContainerInherit, ObjectInherit","None","Allow")
$ACL.SetAccessRule($ACE)
Set-Acl -Path "F:\NotasFinais" -AclObject $ACL