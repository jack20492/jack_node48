import connect from "../../db.js";

const getUSers = async (req, res) => {
  try {
    const [data] = await connect.query(`SELECT * FROM users`);
    // response của query hay la excute là 1 list có 2 phần tử
    // phần tử 1: data
    // phần tử 2: metadata
    console.log({ data });
    return res.send(data);
  } catch (error) {
    return res.send(`error: ${error}`);
  }
};

// define controller create user
const createUser = async (req, res) => {
  try {
    const queryString = `INSERT INTO users (full_name, email, pass_word) VALUES (?, ?, ?)`;
    let body = req.body;
    let { full_name, email, pass_word } = body; //destructuring
    // thực thi query
    const [data] = await connect.execute(queryString, [
      full_name,
      email,
      pass_word,
    ]);
    return res.send(data);
  } catch (error) {
    return res.send(`error: ${error}`);
  }
};

// nếu export 2 hàm trở lên thì dùng object
export { getUSers, createUser };
