#This script forces recalibration of the SkyGuide/SkyGuard/SkySurveyor guiding alogrithm. This can for instance be used after changing camera rotation in an automatic NINA sequence

#API Endpoint definition, we Start guider Calibration and we force use of the angle as it can be slight off at times depending on the angle at which we point the telescope. 
#It is possible to take away this paramtere and calibrate somewhere towards the celestial equator each time, but this take quite awhile. Being slight off worksf or my setup.
$apiUrl = "http://localhost:18700/SKSS_StartGuiderCalibration?useCalibrationAngleAnyway=true"

#Issue the request, the 0 and 1 output is used by Nina to evaluate wheter it successfully executed




  try {
        $response = Invoke-RestMethod -Uri $apiUrl -Method Get

        #Evaluate response status
        if ($response.status -eq "success") {
          Write-Output "1"
          exit 1
        } else {
          Write-Output "0"
          exit 0
        }
} catch {
  Write-Output "0"
  exit 0
}

#Yet to be added: check if application is currently running and that the endpoint is up.
