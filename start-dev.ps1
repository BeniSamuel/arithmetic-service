# PowerShell script yo gukoresha serivisi zose mu development

Write-Host "Starting Calculator Microservices in Development Mode..." -ForegroundColor Green
Write-Host ""

# Check if Node.js is installed
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: Node.js is not installed!" -ForegroundColor Red
    Write-Host "Please install Node.js from https://nodejs.org/" -ForegroundColor Yellow
    exit 1
}

# Function to start a service
function Start-Service {
    param(
        [string]$ServiceName,
        [string]$ServicePath,
        [int]$Port
    )
    
    Write-Host "Starting $ServiceName..." -ForegroundColor Cyan
    
    $serviceProcess = Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$ServicePath'; Write-Host 'Starting $ServiceName on port $Port...' -ForegroundColor Green; npm install; npm run start:dev" -PassThru
    
    Start-Sleep -Seconds 2
    return $serviceProcess
}

# Start all services
Write-Host "Installing dependencies and starting services..." -ForegroundColor Yellow
Write-Host ""

$rootPath = $PSScriptRoot

# Start Addition Service
Start-Service -ServiceName "Addition Service" -ServicePath "$rootPath\addition-service" -Port 3001

# Start Subtraction Service  
Start-Service -ServiceName "Subtraction Service" -ServicePath "$rootPath\subtraction-service" -Port 3002

# Start Result Service
Start-Service -ServiceName "Result Service" -ServicePath "$rootPath\result-service" -Port 3003

# Wait a bit before starting API Gateway
Start-Sleep -Seconds 3

# Start API Gateway
Start-Service -ServiceName "API Gateway" -ServicePath "$rootPath\api-gateway" -Port 3000

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "All services are starting!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "API Gateway: http://localhost:3000" -ForegroundColor Yellow
Write-Host "Addition Service: Port 3001" -ForegroundColor Yellow
Write-Host "Subtraction Service: Port 3002" -ForegroundColor Yellow
Write-Host "Result Service: Port 3003" -ForegroundColor Yellow
Write-Host ""
Write-Host "Test endpoints:" -ForegroundColor Cyan
Write-Host "  Addition: http://localhost:3000/calculator/add?a=5&b=3" -ForegroundColor White
Write-Host "  Subtraction: http://localhost:3000/calculator/subtract?a=10&b=4" -ForegroundColor White
Write-Host ""
Write-Host "Press Ctrl+C to stop all services" -ForegroundColor Yellow
Write-Host ""

# Keep script running
try {
    while ($true) {
        Start-Sleep -Seconds 1
    }
} catch {
    Write-Host "Stopping services..." -ForegroundColor Red
}
