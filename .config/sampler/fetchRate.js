const axios = require("axios");
const fs = require("fs");
console.log("started");

axios
  .get("https://api.ratesapi.io/api/latest?base=CNY")
  .then((res) => {
    fs.writeFile("rate", JSON.stringify(res.data), (err) => {
      if (err) {
        console.log("FUK");
        process.exit(1);
      } else {
        console.log("HORRAY, written success");
      }
    });
  })
  .catch(err => {
    console.log("Axios fuk you");
    console.log(err)
    process.exit(1);
  });
