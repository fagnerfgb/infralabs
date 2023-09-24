Update-LapsADSchema
Set-LapsADComputerSelfPermission -Identity "Computers"


Configure LAPS Group Policies

To configure LAPS we will need to create a new Group Policy.

    Open the Group Policy Management on the domain controller
    Create a new Computer Policy (CPO_LAPS) in your computer OU
    Edit the new policy and navigate to Computer Configuration > Policies > Administrative Templates > System > LAPS
