{
  lib,
  bluetooth-data-tools,
  bluetooth-sensor-state-data,
  buildPythonPackage,
  fetchFromGitHub,
  home-assistant-bluetooth,
  poetry-core,
  pytest-cov-stub,
  pytestCheckHook,
  pythonOlder,
  sensor-state-data,
}:

buildPythonPackage rec {
  pname = "inkbird-ble";
  version = "1.0.0";
  pyproject = true;

  disabled = pythonOlder "3.11";

  src = fetchFromGitHub {
    owner = "Bluetooth-Devices";
    repo = "inkbird-ble";
    tag = "v${version}";
    hash = "sha256-J3BT4KZ5Kzoc8vwbsXbhZJ+qkeggYomGE0JedxNTPaQ=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    bluetooth-data-tools
    bluetooth-sensor-state-data
    home-assistant-bluetooth
    sensor-state-data
  ];

  nativeCheckInputs = [
    pytest-cov-stub
    pytestCheckHook
  ];

  pythonImportsCheck = [ "inkbird_ble" ];

  meta = with lib; {
    description = "Library for Inkbird BLE devices";
    homepage = "https://github.com/Bluetooth-Devices/inkbird-ble";
    changelog = "https://github.com/Bluetooth-Devices/inkbird-ble/blob/${src.tag}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ fab ];
  };
}
