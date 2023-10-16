This module creates an API Gateway that is used to route traffic from a domain to one or more applications.
To get started, create a block using this module and connect to a subdomain block that satisfies the contract.
The subdomain is a required connection and determines the url this API Gateway will be listening on.

### Routing Traffic
To route traffic from an API Gateway to your applications, you will need to add a capability to each of your applications.
The capability will configuration for determining which path will route to the application.
The capability will also have a connection to the API Gateway.

Nullstone provides the `nullstone/aws-api-gateway-mapping` module to provide this functionality.