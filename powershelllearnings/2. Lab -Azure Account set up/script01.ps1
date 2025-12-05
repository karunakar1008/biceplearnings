#Connect Azure Account
Connect-AzAccount

#Select Subscription
Select-AzSubscription -SubscriptionName "Your Subscription Name"

#Verify the selected Subscription
Get-AzContext

#Set the desired Subscription as default
Set-AzContext -SubscriptionName "Your Subscription Name" -Default

Set-AzContext -Subscription "Your Subscription ID"

#Verify the default Subscription
Get-AzContext   

#Get all subscriptions and output as table
Get-AzSubscription | Format-Table

