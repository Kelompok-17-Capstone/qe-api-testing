package starter.data;

public class User {
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRetype_password() {
        return retype_password;
    }

    public void setFullName(String retype_password) {
        this.retype_password = retype_password;
    }

    String email = "yari@yahoo.com";
    String password = "oxtkgjvcs";
    String retype_password = "oxtkgjvcs";

    public void setRetype_password(String retype_password) {
        this.retype_password = retype_password;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJlbWFpbCI6ImFkbWluIiwiZXhwIjoxNjg3MjE4MTE2LCJyb2xlIjoiYWRtaW4iLCJ1c2VyX2lkIjoxfQ.aBKePkWMa4j0CQa_MXoLuYrWcbGmBJlpTno54jymDZg";

    public String getToken1() {
        return token1;
    }

    public void setToken1(String token1) {
        this.token1 = token1;
    }

    String token1 = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJlbWFpbCI6InlhcmlAeWFob28uY29tIiwiZXhwIjoxNjg3MjA4NDc3LCJyb2xlIjoibWVtYmVyIiwidXNlcl9pZCI6NH0.0njR2brCge2cmRPQTU7mNxAdF84H5Wme1CZTqsJzJgg";
}
