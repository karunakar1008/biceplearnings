#Connect Azure Account
Connect-AzAccount

#Select Subscription
Select-AzSubscription -SubscriptionName "Your Subscription Name"

#Verify the selected Subscription
Get-AzContext

#Set the desired Subscription as default
Set-AzContext -SubscriptionName "Your Subscription Name" -Default

#Verify the default Subscription
Get-AzContext   
