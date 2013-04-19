package beans;

public class UserBean implements java.io.Serializable {

    private String username;
    private String email;
    private int id;

    public UserBean() {
    }

    public void setUsername( String value )
    {
        username = value;
    }

    public void setEmail( String value )
    {
        email = value;
    }

    public void setId( int value )
    {
        id = value;
    }

    public String getUsername() { return username; }

    public String getEmail() { return email; }

    public int getId() { return id; }

}