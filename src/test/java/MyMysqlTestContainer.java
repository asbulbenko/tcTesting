import org.junit.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.testcontainers.containers.MySQLContainer;
import org.testcontainers.containers.output.Slf4jLogConsumer;
import org.testcontainers.utility.DockerImageName;

import java.sql.*;

import static org.junit.Assert.assertEquals;

public class MyMysqlTestContainer {
    private static final Logger LOGGER = LoggerFactory.getLogger(MyMysqlTestContainer.class);

    public static MySQLContainer mySQLContainer;

    @BeforeClass
    public static void startUp() {
        mySQLContainer = (MySQLContainer) new MySQLContainer(DockerImageName.parse("mysql:8.0.25"))
                .withInitScript("initTestDB.sql")
                .withLogConsumer(new Slf4jLogConsumer(LOGGER));
        LOGGER.info("<< Init DB >>");

        LOGGER.info("start MYSQL container");
        mySQLContainer.start();
    }

    @AfterClass
    public static void tearDown() {
        LOGGER.info("Close MYSQL connections");
        mySQLContainer.close();
    }

    private Statement performQuery()  throws SQLException {
        Connection connection = DriverManager.getConnection(mySQLContainer.getJdbcUrl(),mySQLContainer.getUsername(),mySQLContainer.getPassword());
        LOGGER.info(">>> SQL Connection to database established!");
        return connection.createStatement();
    }

    @Test
    public void checkVersion() throws SQLException {
        ResultSet resultSet = performQuery().executeQuery("SELECT VERSION()");
        resultSet.next();
        assertEquals("Mysql container driver version 8.0.25 ", "8.0.25", resultSet.getString(1));
    }

    @Test
    public void checkCount() throws SQLException {
        ResultSet resultSet = performQuery().executeQuery("SELECT 1");
        if(resultSet.next()) {
            System.out.println(resultSet.getString(1));
        }
        assertEquals("A basic SELECT query succeed", 1 , resultSet.getInt(1));
    }

    @Test
    public void checkStudentsCount() throws SQLException {
        ResultSet resultSet = performQuery().executeQuery("select count(1) from test.students");
        resultSet.next();
        assertEquals("Students should be 13 ", 13 , resultSet.getInt(1));
    }

    @Test
    public void checkStudentExist() throws SQLException {
        ResultSet resultSet = performQuery().executeQuery("select fio from test.students where id = 1");
        resultSet.next();
        assertEquals("First student from list", "Bryant Smith", resultSet.getString(1));
    }

    @Test
    public void  check() throws SQLException {
        String chiefName = "Korolev S.I";
        ResultSet resultSet = performQuery().executeQuery("select department_chief from test.department where department_name ='Aeronautics'");
        resultSet.next();
        assertEquals("Department chief is not Korolev S.I.", chiefName,resultSet.getString(1));
        System.out.println(">> Start updating ");
        performQuery().executeUpdate("update test.department set department_chief = 'Korolev S.S.'");
        resultSet = performQuery().executeQuery("select department_chief from test.department where department_name ='Aeronautics'");
        resultSet.next();
        assertEquals("Department chief is not Korolev S.S.", "Korolev S.S.",resultSet.getString(1));
    }
}
