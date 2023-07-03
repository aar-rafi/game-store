import axios from "axios";

export default axios.create({
  baseURL: "https://api.rawg.io/api",
  params: {
    key: "a53a68e7a76c4f8cb8f5a220be4cd4d3",
  },
});
