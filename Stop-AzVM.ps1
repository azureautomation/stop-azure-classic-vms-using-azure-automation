<#
    Stops one or more Azure VMs.
#>

# Names of the Azure VMs to stop
# TODO: replace with your Azure VM / service names
$VMsToStop = @(
    @{
        Name = "SomeVMName"
        ServiceName = "SomeVMServiceName"
    },
    @{
        Name = "SomeVMName2"
        ServiceName = "SomeVMServiceName2"
    }
)

# Get creds to access Azure
$AzureCred = Get-AutomationPSCredential -Name "AzureCreds"

# Connect to Azure
Add-AzureAccount -Credential $AzureCred | Out-Null

# Stop the VMs, in parallel
ForEach ($VM in $VMsToStop) {
    Stop-AzureVM -Name $VM.Name -ServiceName $VM.ServiceName -Force
}