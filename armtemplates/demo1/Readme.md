 
 Connect-AzAccount -TenantId <> -DeviceCode

 Connect-AzAccount -Tenant 'xxxx-xxxx-xxxx-xxxx' -SubscriptionId 'yyyy-yyyy-yyyy-yyyy'

 New-AzDeployment -Location eastus -templatefile ./01-rg.json
 
 Note: If you are not able to run these commands using cloud shell/azure cli then use Deploy a c Custom Template feature in azure portal

New-AzResourceGroupDeployment
    -ResourceGroupName rg-test
    -TemplateFile .\02-storage.json



