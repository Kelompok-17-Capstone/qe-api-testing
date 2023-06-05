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

    String email = "abimo@gmail.com";
    String password = "123123123";
    String retype_password = "123123123";

    public void setRetype_password(String retype_password) {
        this.retype_password = retype_password;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJlbWFpbCI6Imlvam5tbzk4bm5kdGdkQGdtYWlsLmNvbSIsImV4cCI6MTY4NjAxNjQzNiwicm9sZSI6InJlZ3VsZXIiLCJ1c2VyX2lkIjo0fQ.u57JQg1vPgRb8YwgzQPVT1JwhVNolFP0-UWmzEIC-HY";

}
