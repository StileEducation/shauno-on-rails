"use strict";

/**
 * The following JSON template shows what is sent as the payload:
{
    "serialNumber": "GXXXXXXXXXXXXXXXXX",
    "batteryVoltage": "xxmV",
    "clickType": "SINGLE" | "DOUBLE" | "LONG"
}
 *
 * A "LONG" clickType is sent if the first press lasts longer than 1.5 seconds.
 * "SINGLE" and "DOUBLE" clickType payloads are sent for short clicks.
 *
 * For more documentation, follow the link below.
 * http://docs.aws.amazon.com/iot/latest/developerguide/iot-lambda-rule.html
 */

const http = require("http");

function sendRequest(authToken, serialNum) {
  // need to construct the form data with the auth token and a event obj??
  let form_data = {
    authenticity_token: authToken,
    event: { uuid: serialNum },
  };

  const options = {
    hostname: "13.210.69.76",
    port: 80,
    path: `/events`,
    method: "POST",
    headers: {
      ContentType: "application/x-www-form-urlencoded",
      ContentLength: Object.keys(form_data).length,
    },
  };

  const req = http.request(options, (res) => {
    console.log(`statusCode: ${res.statusCode}`);

    res.on("data", (d) => {
      process.stdout.write(d); //if response sent data back it gets printed
    });
  });

  req.on("error", (error) => {
    console.error(error);
  });

  // req.write(`uuid=${serialNum}`);
  req.end();
}

exports.handler = (event, context, callback) => {
  console.log("Received event:", event.serialNumber);

  // need to make an http request to the server to get the cookie containing the authentication token
  const options1 = {
    hostname: "13.210.69.76",
    port: 80,
    path: `/events/new`,
    method: "GET",
  };

  let auth_token;

  const req1 = http.request(options1, (res) => {
    console.log(`statusCode: ${res.statusCode}`);

    // res.on("data", (d) => {
    //   process.stdout.write(d); //if response sent data back it gets printed
    //   const lines = d.toString().split("\n");
    //   for (let line of lines) {
    //     if (line.includes("csrf-token")) {
    //       auth_token = line.match(/content="(.*)"/)[1];
    //     }
    //   }
    // });

    res.on("data", (d) => {
      process.stdout.write(d); //if response sent data back it gets printed
      const lines = d.toString().split("\n");
      for (let line of lines) {
        if (line.includes("authenticity_token")) {
          auth_token = line.match(/value="(.*)"/)[1];
        }
      }
    });

    res.on("end", function () {
      console.log("auth_token: ", auth_token);
      sendRequest(auth_token, event.serialNumber);
    });
  });

  req1.end();

  // sendRequest(event.serialNumber);
};

// {
//   "serialNumber": "P5SJVQ2003H558W6"
// }
