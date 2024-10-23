const express = require('express');
const path = require('path');
const { pool1, pool2 } = require('./db'); // ตรวจสอบว่ามีการเชื่อมต่อกับฐานข้อมูลได้ถูกต้อง

const app = express();
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname)));

// เส้นทางหลัก (GET)
app.get('/', (req, res) => {
    res.render('login', { message: '' });
});

// เส้นทางสำหรับหน้า dashboard (GET)
app.get('/dashboard', async (req, res) => {
    try {
        const result = await pool2.query(`
            SELECT 
                s.std_id,
                p.prefix,
                s.first_name,
                s.last_name,
                s.date_of_birth,
                s.sex,
                c.curr_name_th,
                s.previod_school,
                s.address,
                s.telephone,
                s.email,
                s.line_id,
                s.status
            FROM student s
            JOIN prefix p ON p.pre_id = s.pre_id
            JOIN curriculom c ON c.curr_id = s.curri_id
            ORDER BY s.std_id
        `);

        res.render('dashboard', { data: result.rows });
    } catch (error) {
        console.error('Error executing query', error.stack);
        res.status(500).json({ message: 'Server error' });
    }
});

// เส้นทางสำหรับหน้า check-in (GET)
app.get('/check-in', async (req, res) => {
    try {
        const result = await pool2.query(`
            SELECT 
                s.std_id,
                p.prefix,
                s.first_name,
                s.last_name,
                s.date_of_birth,
                s.sex,
                c.curr_name_th,
                s.previod_school,
                s.address,
                s.telephone,
                s.email,
                s.line_id,
                s.status,
                sc.section
            FROM student s
            JOIN prefix p ON p.pre_id = s.pre_id
            JOIN curriculom c ON c.curr_id = s.curri_id
            JOIN section sc ON sc.sec_id = s.sec_id
            ORDER BY s.std_id;
        `);

        res.render('check-in', { data: result.rows });
    } catch (error) {
        console.error('Error executing query', error.stack);
        res.status(500).json({ message: 'Server error' });
    }
});

app.get('/data', async (req, res) => {
    try {
        const query = `
            SELECT 
    s.std_id,
    sl.active_date, 
    p.prefix,
    s.first_name, 
    s.last_name, 
    c.curr_name_th, 
    sc.section,
    sl.status
FROM 
    student_list sl
JOIN 
    student s ON s.std_id = CAST(sl.std_id AS INTEGER) -- Cast sl.std_id to INTEGER
JOIN 
    prefix p ON p.pre_id = s.pre_id
JOIN 
    curriculom c ON c.curr_id = s.curri_id
JOIN 
    section sc ON sc.sec_id = s.sec_id
ORDER BY 
    sl.active_date DESC,  -- เรียงตาม active_date ในลำดับจากใหม่ไปเก่า
    s.std_id ASC;         -- เรียงตาม std_id ในลำดับจากน้อยไปมาก
        `;
        const result = await pool2.query(query);
        
        // Debug: ตรวจสอบผลลัพธ์ของการ query
        console.log(result.rows);

        res.render('data', { data: result.rows });
    } catch (err) {
        console.error('Error fetching data:', err);
        res.status(500).send('Server error');
    }
});


const moment = require('moment-timezone');

app.post('/api/save-attendance', async (req, res) => {
    const attendanceData = req.body;

    // กำหนดวันที่ให้ตรงกับ timezone ของไทย
    const active_date = moment.tz('Asia/Bangkok').format('YYYY-MM-DD'); // วันปัจจุบัน

    try {
        const client = await pool2.connect();

        // ตรวจสอบว่ามีการบันทึกในวันที่ต้องการแล้วหรือไม่
        const result = await client.query(
            'SELECT COUNT(*) FROM student_list WHERE active_date = $1',
            [active_date]
        );

        console.log('Active Date:', active_date); // แสดง active_date
        console.log('Count of records:', result.rows[0].count); // แสดงจำนวนข้อมูลใน active_date

        // ถ้ามีข้อมูลแล้ว จะ return กลับทันที
        if (result.rows[0].count > 0) {
            client.release();
            return res.status(400).json({ message: 'บันทึกผลการเข้าเรียนได้แค่วันละครั้ง' });
        }

        // ถ้ายังไม่มีการบันทึกในวันนั้น ก็ทำการบันทึก
        await Promise.all(attendanceData.map(async (attendance) => {
            const { std_id, status } = attendance;

            await client.query(
                'INSERT INTO student_list (std_id, active_date, status) VALUES ($1, $2, $3)',
                [std_id, active_date, status]
            );
        }));

        client.release();
        res.json({ message: 'บันทึกผลการเข้าเรียนเรียบร้อยแล้ว' });
    } catch (error) {
        console.error('Error saving attendance:', error.message);
        res.status(500).json({ message: 'เกิดข้อผิดพลาดในการบันทึกผล', error: error.message });
    }
});







// เส้นทางสำหรับล็อกอิน (POST)
app.post('/api/login', async (req, res) => {
    const { username, password } = req.body;

    try {
        const result = await pool1.query('SELECT * FROM users WHERE username = $1 AND password = $2', [username, password]);
        
        if (result.rows.length > 0) {
            res.redirect('/dashboard');
        } else {
            res.render('login', { message: 'Invalid username or password' });
        }
    } catch (error) {
        console.error('Error executing query', error.stack);
        res.status(500).json({ message: 'Server error' });
    }
});

// เริ่มเซิร์ฟเวอร์
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
