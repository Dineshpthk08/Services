# This is demo for creating ecommerce servce using microservices architecure using .NetCore 3.1. 
# Service uses API composition pattern to aggregate data from different other microservice such as ProductService, OrderService, CustomerService
# Service has implemented Auto-Retry pattern to add resilience for transient HTTP services using Polly.
# Service supports docker containerization