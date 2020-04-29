const render = ({ output }) => {
  if (typeof output === "undefined") return null;
  const status = output.status;
  const ssid = output.ssid;
  const pingTime = Math.round(output.pingTime);
  if (status === "inactive") return <div>􀙈</div>;
  return <div>􀙇 {output.ssid} ({pingTime}ms)</div>;
};

export default render;
