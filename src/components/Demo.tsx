// api.js
import axios, { AxiosResponse } from "axios";
import { Platform } from "../hooks/useGames";
import { useEffect, useState } from "react";

export const api = axios.create({
  baseURL: "http://localhost:5000",
});

interface Game {
  id: number;
  name: string;
  background_image: string;
  parent_platforms: { platform: Platform }[];
  metacritic: number;
}
//const response = api.get<Game>("/games");
//await fetch(api + "/games"); //
const Demo = () => {
  const [data, setData] = useState<Game[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    // Fetch data from the backend API
    api
      .get<Game[]>("/genres") // Replace '/api/your-endpoint' with your actual backend API endpoint
      .then((response: AxiosResponse<Game[]>) => {
        setData(response.data);
        setLoading(false);
      })
      .catch((error) => {
        setError("Error fetching data.");
        setLoading(false);
      });
  }, []);
  return (
    <div>
      {data.map((item) => (
        <div key={item.id}>
          <p>{item.name}</p>
        </div>
      ))}
    </div>
  );
};

export default Demo;
