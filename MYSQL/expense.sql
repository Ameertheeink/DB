
SELECT * FROM finance.expense;
describe  finance.expense;
alter table finance.expense add category varchar(45);
INSERT INTO expense (expense_name, expense_amount, expense_date, category) VALUES
('Groceries', 75.50, '2024-11-05', 'Food'),
('Electricity Bill', 120.00, '2024-11-02', 'Utilities'),
('Internet Bill', 50.00, '2024-11-03', 'Utilities'),
('Dining Out', 35.75, '2024-11-04', 'Food'),
('Gym Membership', 25.00, '2024-11-02', 'Health'),
('Fuel', 60.00, '2024-11-06', 'Transportation'),
('Movie Tickets', 30.00, '2024-11-07', 'Entertainment'),
('Books', 40.00, '2024-11-01', 'Education'),
('Clothing', 150.00, '2024-11-02', 'Shopping'),
('Car parking', 200.00, '2024-11-10', 'Transportation');
select expense_date,sum(expense_amount) as total_amount  from expense group by expense_date order by expense_date;
select expense_date,sum(expense_amount) as total_amount  from expense group by expense_date;
select sum(expense_amount) as total_expense from expense ;



SELECT * FROM finance.expense;
describe finance.expense;
select * from finance.expense order by expense_amount desc;
select * from finance.expense where category='transportation';
select * from finance.expense where category='transportation' order by expense_date;
CREATE TABLE `expense` (
  `id` int NOT NULL AUTO_INCREMENT,
  `expense_name` varchar(45) DEFAULT NULL,
  `expense_amount` double DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


select * from finance.expense where expense_date between '01-11-2024' and '05-11-2024';
select * from finance.expense where expense_date between '2024-11-01' and '2024-11-02';

select *, sum(expense_amount) as total_expense from finance.expense ; 
SELECT e.*, (SELECT SUM(expense_amount) FROM finance.expense) AS total_amount 
FROM finance.expense e;
Select e.* ,(select sum(expense_amount) as total from finance.expense) as total from finance.expense e;
Select e.* ,(select sum(expense_amount) as total from finance.expense where category='food') as total from finance.expense e ;

SELECT 
    category, 
    SUM(expense_amount) AS total_amount 
FROM finance.expense 
GROUP BY category;

SELECT 
    e.*, 
    (SELECT SUM(expense_amount) 
     FROM finance.expense 
     WHERE category = 'food') AS total_expense_amount 
FROM finance.expense e
WHERE e.category = 'food';
select sum(expense_amount) as total from finance.expense where category='transportation';

select e.* ,(select sum(expense_amount)  from finance.expense where category='transportation') as total from finance.expense e where e.category='transportation';
select * ,(select sum(expense_amount) as total from finance.expense where expense_date between '2024-11-01' and '2024-11-02') as total from finance.expense e ;
CREATE TABLE expense (
    id INT NOT NULL AUTO_INCREMENT,
    expense_name VARCHAR(45) NOT NULL,
    expense_amount DECIMAL(10,2) NOT NULL,
    expense_date DATE NOT NULL,
    category_id INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE CASCADE,
    INDEX idx_expense_date (expense_date),
    INDEX idx_category_id (category_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
