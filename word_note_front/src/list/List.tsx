import word from "../type/model/word.ts";
import Word from "./components/Word.tsx";

export default function List(prop: { wordList: word[] }) {
  return prop.wordList.map((word) => Word({ word: word }));
}
