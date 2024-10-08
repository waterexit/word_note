import { useEffect, useState } from "react";
import "./App.css";
import List from "./list/List.tsx";
import word from "./type/model/word.ts";
import axios from "axios";

function App() {
  const [wordList, setWordList] = useState<word[]>([]);
  useEffect(() => {
    axios.get(`${import.meta.env.VITE_API_PREFIX}/words`, {
      headers: { "content-Type": "application/json" },
    }).then((res) => {
      setWordList(res.data);
    });
  }, []);
  return (
    <>
      <List wordList={wordList} />
      <h1>Vite + React</h1>
      <div className="card">
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
