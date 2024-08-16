import translation from "./translation";

type word = {
  id: number;
  word: string;
  phonetic: string;
  translations: translation[];
};
export default word;
