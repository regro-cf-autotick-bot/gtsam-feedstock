mkdir build
cd build

cmake ^
    -GNinja ^
    -DGTSAM_BUILD_UNSTABLE:OPTION=ON ^
    -DGTSAM_BUILD_STATIC_LIBRARY=OFF ^
    -DGTSAM_BUILD_WITH_MARCH_NATIVE=OFF ^
    -DGTSAM_USE_SYSTEM_EIGEN=ON ^
    -DGTSAM_INSTALL_CPPUNITLITE=OFF ^
    -DGTSAM_BUILD_PYTHON=OFF ^
    -DGTSAM_USE_SYSTEM_METIS=ON ^
    -DBoost_USE_STATIC_LIBS=OFF ^
    -DBOOST_ROOT="%LIBRARY_PREFIX%" ^
    -DBoost_NO_SYSTEM_PATHS=ON ^
    -DGTSAM_CMAKE_CONFIGURATION_TYPES="Release" ^
    -DCMAKE_BUILD_TYPE="Release" ^
    -DBoost_NO_BOOST_CMAKE=ON ^
    -DPython3_EXECUTABLE=%PYTHON% ^
    -DPython_EXECUTABLE=%PYTHON% ^
    -DPYTHON_EXECUTABLE=%PYTHON% ^
    %SRC_DIR%

if errorlevel 1 exit 1

ninja install -j2
@rem ninja python-install

if errorlevel 1 exit 1

@rem ninja check
