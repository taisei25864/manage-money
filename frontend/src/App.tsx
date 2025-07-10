import React, { useEffect, useState } from "react";
import axios from "axios";
import './App.css'

type Pokemon = {
  name: string;
  height: number;
  weight: number;
  base_experience: number;
  types: string[];
}

function App() {
  const [pokemon, setPokemon] = useState<Pokemon>();
  const url = "http://localhost:3000/api/pokemon?name=Venusaur"

  useEffect(() => {
    axios.get(url).then((response) => {
      setPokemon(response.data); // APIのレスポンスをgreetに詰める
    });
  }, []); // 第二引数の配列に入れた変数が更新されるたび、第一引数の内容が再実行される。今回は再実行の必要は無いので空

  if (pokemon == null) {
    // greetが空の場合はぐるぐるローディング画面を流す
    return (
      <div className="loading">
        <h1>error</h1>
      </div>
    );
  }

  return (
    <div className="greet">
      <div className="pokemon-name">
        <h1>{pokemon.name}</h1>
      </div>
      <div className="pokemon-height">
        <h1>{pokemon.height}</h1>
      </div>
      <div className="pokemon-types">
        <h1>{pokemon.types}</h1>
      </div>
    </div>
  );
}

export default App
