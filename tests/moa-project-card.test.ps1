$ErrorActionPreference = "Stop"

$indexPath = Join-Path $PSScriptRoot "..\\index.html"
$indexContent = Get-Content -Raw -Encoding UTF8 $indexPath

$mainImagePath = Join-Path $PSScriptRoot "..\\assets\\images\\MOA\\moa-main.png"
$overviewImagePath = Join-Path $PSScriptRoot "..\\assets\\images\\MOA\\moa-overview.png"
$sketchGifPath = Join-Path $PSScriptRoot "..\\assets\\images\\MOA\\목표이미지 스케칭.gif"

$checks = @(
    @{
        Name = "MOA section title exists"
        Ok = $indexContent -match '<h3>MOA - '
    },
    @{
        Name = "MOA date exists"
        Ok = $indexContent -match '2026\.02 ~ 2026\.04'
    },
    @{
        Name = "MOA GitHub link exists"
        Ok = $indexContent -match 'https://github\.com/smj1513/MOA-Inference'
    },
    @{
        Name = "MOA HF link exists"
        Ok = $indexContent -match 'https://huggingface\.co/kakao1513/merchant-consumption-category-discriminator-v3'
    },
    @{
        Name = "MOA main image asset exists"
        Ok = Test-Path $mainImagePath
    },
    @{
        Name = "MOA overview image asset exists"
        Ok = Test-Path $overviewImagePath
    },
    @{
        Name = "MOA sketch gif asset exists"
        Ok = Test-Path $sketchGifPath
    },
    @{
        Name = "MOA main image is referenced"
        Ok = $indexContent -match 'assets/images/MOA/moa-main\.png'
    },
    @{
        Name = "MOA graph image uses Korean asset"
        Ok = $indexContent -match 'assets/images/MOA/지출그래프\.jpg'
    },
    @{
        Name = "MOA savings image uses Korean asset"
        Ok = $indexContent -match 'assets/images/MOA/저축이력\.jpg'
    },
    @{
        Name = "MOA AI coaching image uses Korean asset"
        Ok = $indexContent -match 'assets/images/MOA/AI코칭\.jpg'
    },
    @{
        Name = "MOA travel goal image uses Korean asset"
        Ok = $indexContent -match 'assets/images/MOA/여행 목표\.jpg'
    },
    @{
        Name = "MOA generated image uses Korean asset"
        Ok = $indexContent -match 'assets/images/MOA/목표이미지 생성\.jpg'
    },
    @{
        Name = "MOA sketch gif is referenced"
        Ok = $indexContent -match 'assets/images/MOA/목표이미지 스케칭\.gif'
    },
    @{
        Name = "MOA content section does not mention AI server repository"
        Ok = -not ($indexContent -match 'AI 서버 저장소인 <strong>MOA-Inference</strong>')
    },
    @{
        Name = "MOA content section stays service-focused"
        Ok = $indexContent -match '목표를 중심으로 소비와 저축의 흐름을 함께 보여주고'
    },
    @{
        Name = "MOA old English screenshot references are removed"
        Ok = -not ($indexContent -match 'Screenshot_20260401_150704_Gallery\.jpg|Screenshot_20260401_151120_Gallery\.jpg|Screenshot_20260401_151249_Gallery\.jpg')
    },
    @{
        Name = "MOA mobile strip layout exists"
        Ok = $indexContent -match 'class="moa-mobile-strip"'
    },
    @{
        Name = "MOA mobile shot cards exist"
        Ok = $indexContent -match 'class="moa-mobile-shot"'
    },
    @{
        Name = "MOA section does not use code tags"
        Ok = -not ($indexContent -match '<code>service_test f1_macro</code>|<code>MultiServerMCPClient</code>|<code>user_id</code>|<code>chatbot</code>|<code>merchant_classification</code>|<code>image_generation</code>|<code>app/core</code>')
    },
    @{
        Name = "Attention Pooling comparison exists"
        Ok = $indexContent -match 'Attention Pooling'
    },
    @{
        Name = "CLS Pooling comparison exists"
        Ok = $indexContent -match 'CLS Pooling'
    }
)

$failures = $checks | Where-Object { -not $_.Ok }

if ($failures.Count -gt 0) {
    Write-Host "FAIL: MOA project card checks failed:" -ForegroundColor Red
    $failures | ForEach-Object {
        Write-Host " - $($_.Name)" -ForegroundColor Red
    }
    exit 1
}

Write-Host "PASS: MOA project card checks passed." -ForegroundColor Green
