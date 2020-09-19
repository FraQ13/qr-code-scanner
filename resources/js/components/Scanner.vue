<template>
  <div class="scanner">
    <video id="qr-scanner"></video>

    <div class>
      Data:
      <span v-html="this.scanData"></span>
    </div>
  </div>
</template>

<script>
import QrScanner from "qr-scanner";
import QrScannerWorkerPath from "!!file-loader!./../../../node_modules/qr-scanner/qr-scanner-worker.min.js";

export default {
  data() {
    return {
      scanData: false
    }
  },
  mounted() {
    QrScanner.WORKER_PATH = QrScannerWorkerPath;
    const scanner = document.getElementById("qr-scanner");
    const qrScanner = new QrScanner(scanner, (result) => {
      console.log("decoded qr code:", result);
      this.scanData = result;
    });

    qrScanner.start();
  },
};
</script>
