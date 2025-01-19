//import thư viện expressJS
import express from "express";
import connect from "./db.js";
import rootRoutes from "./src/routes/rootRoutes.js";
//khởi tạo ứng dụng express
const app = express();

// Middleware để parse JSON từ request body
app.use(express.json());

// import rootRoutes
app.use(rootRoutes);

//tạo API
//param1: path của API
//param2: callback function
app.get("/welcome", (req, res) => {
  //trả dữ liệu về cho client
  //dùng res
  return res.send("Hello World");
});

// lấy info từ request (header, body, params, query)
//1.params
app.get("/users/:id/:hoTen", (req, res) => {
  //lấy giá trị id từ params
  //   const id = req.params.id;
  // lưu ý: define bao nhiêu params thì phải truyền đúng số params đó vào url
  // define tên params nào thì phải lấy đúng tên đó
  //VD: /users/:id/ => const id = req.params.id
  const { id } = req.params; //destructuring
  //debug log
  //=> dùng console.log
  const params = req.params;
  console.log({ params });
  return res.send(`User ID: ${id}`); // trả về dạng string
});

// 2.query
// URL: /users?id=1&hoTen=NguyenVanA
app.get("/get-query", (req, res) => {
  //lấy giá trị từ query
  // lưu ý: method GET và DELETE sẽ không có body
  const query = req.query;

  return res.send({ query }); // trả về dạng JSON
});

// 3. lấy information từ header request
// header giúp bảo vệ api
app.get("/get-headers", (req, res) => {
  //lấy giá trị từ header từ request
  const headers = req.headers;
  return res.send({ headers }); // trả về dạng JSON
});

// 4. lấy information từ body request
// method POST, PUT mới có body

app.post("/get-body", (req, res) => {
  //lấy giá trị body từ request
  // body sẽ có dạng JSON
  const body = req.body;
  return res.send({ body }); // trả về dạng JSON
});

// viết API kết nối đến database
// app.get("/get-users", async (req, res) => {
//   try {
//     const [data] = await connect.query(`SELECT * FROM users`);
//     // response của query hay la excute là 1 list có 2 phần tử
//     // phần tử 1: data
//     // phần tử 2: metadata
//     return res.send(data);
//   } catch (error) {
//     return res.send(`error: ${error}`);
//   }
// });

// viết API create user
app.post("/create-user", async (req, res) => {
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
});

//URL mặc định của BE: http://localhost:3000
//khai báo port mà BE sẽ lắng nghe
const port = 3000;
//param1: port
//param2: callback function
//(first) => { second }: style define function theo kiểu ES6
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
