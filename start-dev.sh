#!/bin/bash

# Bash script yo gukoresha serivisi zose mu development (Linux/Mac)

echo "Starting Calculator Microservices in Development Mode..."
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "ERROR: Node.js is not installed!"
    echo "Please install Node.js from https://nodejs.org/"
    exit 1
fi

# Function to start a service
start_service() {
    local service_name=$1
    local service_path=$2
    local port=$3
    
    echo "Starting $service_name..."
    cd "$service_path"
    npm install
    npm run start:dev &
    cd - > /dev/null
    sleep 2
}

# Start all services
echo "Installing dependencies and starting services..."
echo ""

ROOT_PATH=$(pwd)

# Start Addition Service
start_service "Addition Service" "$ROOT_PATH/addition-service" 3001

# Start Subtraction Service
start_service "Subtraction Service" "$ROOT_PATH/subtraction-service" 3002

# Start Result Service
start_service "Result Service" "$ROOT_PATH/result-service" 3003

# Wait a bit before starting API Gateway
sleep 3

# Start API Gateway
start_service "API Gateway" "$ROOT_PATH/api-gateway" 3000

echo ""
echo "========================================"
echo "All services are starting!"
echo "========================================"
echo ""
echo "API Gateway: http://localhost:3000"
echo "Addition Service: Port 3001"
echo "Subtraction Service: Port 3002"
echo "Result Service: Port 3003"
echo ""
echo "Test endpoints:"
echo "  Addition: http://localhost:3000/calculator/add?a=5&b=3"
echo "  Subtraction: http://localhost:3000/calculator/subtract?a=10&b=4"
echo ""
echo "Press Ctrl+C to stop all services"
echo ""

# Keep script running
wait
