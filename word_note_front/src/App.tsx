import { useEffect, useState } from "react";
import reactLogo from "./assets/react.svg";
import viteLogo from "/vite.svg";
import "./App.css";
import List from "./list/List.tsx";
import word from "./type/model/word.ts";
import axios from "axios";

function App() {
  const [count, setCount] = useState(0);
  const [wordList, setWordList] = useState<word[]>([]);
  useEffect(() => {
    axios.get(`${import.meta.env.VITE_API_PREFIX}/words`, {
      headers: { "content-Type": "application/json" },
    }).then((res) => setWordList(res.data));
  }, []);
  return (
    <>
      <div>
        <a href="https://vitejs.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <List wordList={wordList} />
      <h1>Vite + React</h1>
      <div className="card">
        <button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </button>
        <p>
          Edit <code>src/App.tsx</code> and save to test HMR
        </p>
      </div>
      <p className="read-the-docs">
        Click on the Vite and React logos to learn more
      </p>
      <p>
        {import.meta.env.VITE_API_PREFIX}
      </p>
    </>
  );
}

export default App;
