import React, { useEffect, useState } from "react";

const App = () => {
  return (
    <div>
      <h1>React gọi API từ Django</h1>
      {data ? <pre>{JSON.stringify(data, null, 2)}1111111111</pre> : <p>Đang tải dữ liệu...</p>}
    </div>
  );
};

export default App;
