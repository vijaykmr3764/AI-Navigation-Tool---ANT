const express = require("express");
const app = express();
const PORT = process.env.PORT || 3000;

const versionInfo = {
  latest_version: "1.0.1",
  changelog: "✨ Added new AI Agents category + 10 tools",
  update_url: "https://yourcdn.com/ant-latest.apk"
};

app.get("/api/version", (req, res) => {
  res.json(versionInfo);
});

app.listen(PORT, () => {
  console.log(`ANT API running at http://localhost:${PORT}`);
});
