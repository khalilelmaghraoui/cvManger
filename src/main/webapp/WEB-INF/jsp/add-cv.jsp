<%--
  Created by IntelliJ IDEA.
  User: Kura Pika
  Date: 11/20/2022
  Time: 2:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>add cv</title>
  <script src="../static/app.js"></script>
</head>
<body>

<div id="readroot" style="display: none">

  <input type="button" value="Remove review"
         onclick="this.parentNode.parentNode.removeChild(this.parentNode);"
  /><br /><br />

  <label>
    <input name="cd" value="title" />
  </label>
  <div class="form-group mx-sm-3 mb-2">
  <label>
    <select name="nature" class="form-control form-control-sm">
      <option>Rating</option>
      <option value="excellent">Excellent</option>
      <option value="good">Good</option>
      <option value="ok">OK</option>
      <option value="poor">Poor</option>
      <option value="bad">Bad</option>
    </select>
  </label></div>
  <br /><br />

  <label>
    <textarea rows="5" cols="20" name="review">Short review</textarea>
  </label>
  <br />Radio buttons included to test them in Explorer:<br />
  <label>
    <input type="radio" name="something" value="test1" />
  </label>Test 1<br />
  <label>
    <input type="radio" name="something" value="test2" />
  </label>Test 2

</div>

<form method="post" action="/cgi-bin/show_params.cgi">

  <span id="writeroot"></span>

  <input type="button" onclick="moreFields()"  value="Give me more fields!" />
  <input type="submit" value="Send form" />

</form>

</body>
</html>
