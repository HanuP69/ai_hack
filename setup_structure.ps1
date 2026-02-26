# NyayaFlow Project Structure Generator
# Run: .\setup_structure.ps1

$ErrorActionPreference = "SilentlyContinue"

$folders = @(
    "nyayaflow/config/prompts",
    "nyayaflow/core",
    "nyayaflow/graph",
    "nyayaflow/services",
    "nyayaflow/ui",
    "nyayaflow/tests",
    "nyayaflow/notebooks",
    "data/sample_chargesheets",
    "data/output",
    "scripts"
)

$files = @(
    # Config
    "nyayaflow/config/checklists.json",
    "nyayaflow/config/entity_patterns.yaml",
    "nyayaflow/config/prompts/extraction.txt",
    "nyayaflow/config/prompts/classification.txt",
    "nyayaflow/config/prompts/summary.txt",
    
    # Core
    "nyayaflow/core/__init__.py",
    "nyayaflow/core/document_engine.py",
    "nyayaflow/core/hindi_normalizer.py",
    "nyayaflow/core/pattern_matcher.py",
    "nyayaflow/core/entity_extractor.py",
    
    # Graph
    "nyayaflow/graph/__init__.py",
    "nyayaflow/graph/state.py",
    "nyayaflow/graph/nodes.py",
    "nyayaflow/graph/graph.py",
    "nyayaflow/graph/conditional_edges.py",
    "nyayaflow/graph/router.py",
    
    # Services
    "nyayaflow/services/__init__.py",
    "nyayaflow/services/embedding_service.py",
    "nyayaflow/services/report_generator.py",
    "nyayaflow/services/validator.py",
    
    # UI
    "nyayaflow/ui/__init__.py",
    "nyayaflow/ui/streamlit_app.py",
    "nyayaflow/ui/components.py",
    
    # Tests
    "nyayaflow/tests/__init__.py",
    "nyayaflow/tests/test_document_engine.py",
    "nyayaflow/tests/test_graph.py",
    "nyayaflow/tests/test_integration.py",
    
    # Root
    "nyayaflow/__init__.py",
    "nyayaflow/main.py",
    
    # Scripts
    "scripts/setup_env.ps1",
    "scripts/run_api.ps1",
    "scripts/run_ui.ps1",
    
    # Data placeholders
    "data/.gitkeep",
    "data/sample_chargesheets/.gitkeep",
    "data/output/.gitkeep",
    
    # Project root
    "requirements.txt",
    ".env.example",
    ".gitignore",
    "README.md",
    "Dockerfile",
    "docker-compose.yml",
    "setup.py"
)

# Create folders
foreach ($folder in $folders) {
    if (!(Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder -Force | Out-Null
        Write-Host "Created folder: $folder" -ForegroundColor Green
    } else {
        Write-Host "Skipped folder: $folder (exists)" -ForegroundColor Yellow
    }
}

# Create empty files
foreach ($file in $files) {
    if (!(Test-Path $file)) {
        New-Item -ItemType File -Path $file -Force | Out-Null
        Write-Host "Created file: $file" -ForegroundColor Cyan
    } else {
        Write-Host "Skipped file: $file (exists)" -ForegroundColor DarkYellow
    }
}

Write-Host "`nProject structure created successfully!" -ForegroundColor Magenta
Write-Host "Next steps:" -ForegroundColor White
Write-Host "  1. Copy checklists.json to nyayaflow/config/" -ForegroundColor Gray
Write-Host "  2. pip install -r requirements.txt" -ForegroundColor Gray
Write-Host "  3. copy .env.example .env and add your API keys" -ForegroundColor Gray