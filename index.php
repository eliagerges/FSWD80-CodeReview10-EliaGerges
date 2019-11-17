<?php require_once 'actions/db_connect.php'; ?> 

<!DOCTYPE html>
<html>
<head>
   <title>Library Project </title>

   <style type="text/css">
        body{
          background-image: url("image/photo.jpg");
          height: 100%;
          background-attachment: fixed;
          background-repeat: no-repeat;
        }

        table {
          width: 100%;
          margin-top: 20px;
          background-color: white;
          opacity: 0.7; 
       }



   </style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<div class ="Library">   
   <table class="table">
       <thead>
           <tr>
               <th scope="col">ISBN</th>
               <th scope="col">Title</th>
               <th scope="col">Author</th>
               <th scope="col">Type</th>
               <th scope="col">Publisher</th>
               <th scope="col">Genre</th>
               <th scope="col">Publish Date</th>
           </tr>
       </thead>
       <tbody>

            <?php
           $sql = "SELECT  media.ISBN, media.media_name, media.media_description, media.media_type, media.media_status, media.publish_date, publisher.publisher_name, genre.genre, authors.author_firstName, authors.author_lastName FROM media 
             INNER JOIN publisher on media.publisher_id = publisher.publisher_id
             INNER JOIN genre ON media.genre_nr = genre.genre_nr
             INNER JOIN authors ON media.author_id = authors.author_id;";
           $result = $connect->query($sql);

            if($result->num_rows > 0){
                while($row = $result->fetch_assoc()) {
                   echo  "<tr>
                       <td>" .$row['ISBN']."</td>
                       <td>" .$row['media_name']."</td>
                       <td>" .$row['author_firstName']." ".$row['author_lastName' ]."</td>
                       <td>" .$row['media_type']."</td>
                       <td>" .$row['publisher_name']."</td>
                       <td>" .$row['genre']."</td>
                       <td>" .$row['publish_date']."</td>
                       <td>
                           <a href='update.php?ISBN=" .$row['ISBN']."'><button type='button'>Edit</button></a>
                           <a href='delete.php?ISBN=" .$row['ISBN']."'><button type='button'>Delete</button></a>
                           <a href='show.php?ISBN=" .$row['ISBN']."'><button type='button'>Show Media</button></a>
                       </td>
                   </tr>" ;
               }
           } else  {
               echo  "<tr><td colspan='5'><center>No Data Avaliable</center></td></tr>";
           }
            ?>

            
       </tbody>
   </table>
   <a href= "create.php"><button type="button">Create</button></a>

</div>


</body>
</html>