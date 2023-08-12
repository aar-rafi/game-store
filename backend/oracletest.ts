import oracledb from "oracledb";
oracledb.outFormat = oracledb.OUT_FORMAT_OBJECT;

async function run() {
  const connection = await oracledb.getConnection({
    user: "GAME_SITE",
    password: "132671",
    connectString: "localhost:1521/XEPDB1",
  });

  const result = await connection.execute("SELECT name FROM game");
  console.log(result.rows);
  await connection.close();
}

run();
