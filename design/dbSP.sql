/* STORED PROCEDURES */


/* STORED PROCEDURE FOR Users */

/* ADD USER */
CREATE PROCEDURE addUser
  @_username VARCHAR(50),
  @_password VARCHAR(64)
AS
BEGIN
  INSERT INTO Users (username, password)
  VALUES(@_username, HASHBYTES('MD5', @_password))
END

/* SAMPLE QUERY */

/* EXEC addUser */
/* 	@_username = 'admin', */
/* 	@_password = 'admin' */

/* SELECT * FROM Users WHERE password=HASHBYTES('MD5','admin'); */


/* GET USER FOR LOGIN */
CREATE PROCEDURE loginUser
  @_username VARCHAR(50),
  @_password VARCHAR(64)
AS
BEGIN
  SELECT * FROM Users WHERE username=@_username AND password=HASHBYTES('MD5', @_password)
END

/* EXEC loginUser */
/* 	@_username = 'admin', */
/* 	@_password = 'admin' */




/* STORED PROCEDURE FOR PersonalInfo */

/* ADD PERSONAL INFO */

CREATE PROCEDURE addPersonalInfo
  @_userId INT,
   @_fName VARCHAR(50),
  @_mName VARCHAR(50) = NULL,
  @_lName VARCHAR(50),
  @_address VARCHAR(100),
  @_city VARCHAR(35),
  @_province VARCHAR(50),
  @_zipCode VARCHAR(20),
  @_contactNo VARCHAR(20),
  @_email VARCHAR(100),
  @_birthDate DATE,
  @_photoURL TEXT = 'https://iupac.org/wp-content/uploads/2018/05/default-avatar.png'
AS
BEGIN
  INSERT INTO PersonalInfo
  VALUES(@_userId,@_fName,@_mName,@_lName,@_address,@_city,@_province,@_zipCode,@_contactNo,@_email,@_birthDate,@_photoURL)
END

/* EXEC addPersonalInfo */
/* @_userId = 1, */
/* @_fName = 'Juan', */
/* @_lName = 'Pedro', */
/* @_address = '123123', */
/* @_city = 'QC', */
/* @_province = 'NCR', */
/* @_zipCode = '1121', */
/* @_contactNo = '09123456789', */
/* @_email = 'juanpedro@gmail.com', */
/* @_birthDate = '11-19-1999' */



/* UPDATE PERSONAL INFO */

CREATE PROCEDURE updatePersonalInfo
  @_personalInfoId INT,
   @_fName VARCHAR(50),
  @_mName VARCHAR(50) = NULL,
  @_lName VARCHAR(50),
  @_address VARCHAR(100),
  @_city VARCHAR(35),
  @_province VARCHAR(50),
  @_zipCode VARCHAR(20),
  @_contactNo VARCHAR(20),
  @_email VARCHAR(100),
  @_birthDate DATE,
  @_photoURL TEXT = 'https://iupac.org/wp-content/uploads/2018/05/default-avatar.png'
AS
BEGIN
  UPDATE PersonalInfo
  SET fName = @_fName, mName = @_mName, lName = @_lName, address = @_address, city = @_city, province = @_province, zipCode = @_zipCode, contactNo = @_contactNo, email = @_email, birthDate = @_birthDate, photoURL = @_photoURL
  WHERE personalInfoId = @_personalInfoId
END


/* EXEC updatePersonalInfo */
/* @_personalInfoId = 1, */
/* @_fName = 'Juan', */
/* @_mName = 'Tamad', */
/* @_lName = 'Pedro', */
/* @_address = '123123', */
/* @_city = 'QC', */
/* @_province = 'NCR', */
/* @_zipCode = '1121', */
/* @_contactNo = '09123456789', */
/* @_email = 'juanpedro@gmail.com', */
/* @_birthDate = '11-19-1999' */





/* STORED PROCEDURE FOR WorkHistory */

/* ADD WORK HISTORY */

CREATE PROCEDURE addWorkHistory
  @_userId INT,
  @_jobTitle VARCHAR(100),
  @_employer VARCHAR(100),
  @_startDate DATE,
  @_endDate DATE = NULL,
  @_location VARCHAR(100),
  @_jobDescription TEXT
AS
BEGIN
  INSERT INTO WorkHistory
  VALUES(@_userId, @_jobTitle, @_employer, @_startDate, @_endDate, @_location, @_jobDescription)
END


/* EXEC addWorkHistory */
/*   @_userId = 1, */
/*   @_jobTitle = 'Tambay', */
/*   @_employer = 'PH', */
/*   @_startDate = '01-01-1999', */
/*   @_location = 'QC', */
/*   @_jobDescription = 'Pambansang Tambay' */



/* UPDATE WORK HISTORY */

CREATE PROCEDURE updateWorkHistory
  @_workHistoryId INT,
  @_jobTitle VARCHAR(100),
  @_employer VARCHAR(100),
  @_startDate DATE,
  @_endDate DATE = NULL,
  @_location VARCHAR(100),
  @_jobDescription TEXT
AS
BEGIN
  UPDATE WorkHistory
  SET jobTitle = @_jobTitle,employer = @_employer,startDate = @_startDate,endDate = @_endDate,location = @_location,jobDescription = @_jobDescription
  WHERE workHistory = @_workHistoryId
END


/* EXEC updateWorkHistory */
/*   @_workHistoryId = 1, */
/*   @_jobTitle = 'Tambay', */
/*   @_employer = 'PH', */
/*   @_startDate = '01-01-1999', */
/*   @_endDate = '11-19-2016', */
/*   @_location = 'QC', */
/*   @_jobDescription = 'Pambansang Tambay' */




/* DELETE WORK HISTORY*/

CREATE PROCEDURE deleteWorkHistory
  @_workHistoryId INT
AS
BEGIN
  DELETE FROM WorkHistory
  WHERE workHistoryId = @_workHistoryId
END


/* EXEC deleteWorkHistory */
/*   @_workHistoryId = 2 */



/* STORED PROCEDURE FOR EducationBG */

/* ADD EDUCATIONAL BACKGROUND */

CREATE PROCEDURE addEducationBG
  @_userId INT,
  @_studyType VARCHAR(50),
  @_course VARCHAR(50) = NULL,
  @_institution VARCHAR(50),
  @_location VARCHAR(100),
  @_startDate DATE,
  @_endDate DATE = NULL
AS
BEGIN
  INSERT INTO EducationBG
  VALUES(@_userId, @_studyType, @_course, @_institution, @_location, @_startDate, @_endDate)
END


/* EXEC addEducationBG */
/*   @_userId = 1, */
/*   @_studyType = 'Secondary', */
/*   @_institution = 'CHS', */
/*   @_location = 'QC', */
/*   @_startDate = '03-01-2012', */
/*   @_endDate = '03-01-2016' */

/* UPDATE EDUCATIONAL BACKGROUND */

CREATE PROCEDURE updateEducationBG
  @_educationId INT,
  @_studyType VARCHAR(50),
  @_course VARCHAR(50) = NULL,
  @_institution VARCHAR(50),
  @_location VARCHAR(100),
  @_startDate DATE,
  @_endDate DATE = NULL
AS
BEGIN
  UPDATE EducationBG
  SET  studyType = @_studyType, course = @_course, institution = @_institution, location = @_location, startDate = @_startDate, endDate = @_endDate
  WHERE educationId = @_educationId
END


/* EXEC updateEducationBG */
/*   @_educationId = 1, */
/*   @_studyType = 'Secondary', */
/*   @_institution = 'CHS', */
/*   @_location = 'QC', */
/*   @_startDate = '03-01-2012', */
/*   @_endDate = '03-05-2016' */



/* DELETE EDUCATIONAL BACKGROUND */

CREATE PROCEDURE deleteEducationBG
  @_educationId INT
AS
BEGIN
  DELETE FROM EducationBG
  WHERE educationId = @_educationId
END


/* EXEC deleteEducationBG */
/*   @_educationId = 2 */





/* STORED PROCEDURE FOR CharacterRef */

/* ADD CHARACTER REFERENCES */

CREATE PROCEDURE addCharacterRef
  @_userId INT,
  @_name VARCHAR(100),
  @_jobTitle VARCHAR(100),
  @_contactNo VARCHAR(20),
  @_email VARCHAR(100)
AS
BEGIN
  INSERT INTO CharacterRef
  VALUES(@_userId, @_name, @_jobTitle, @_contactNo, @_email)
END


/* EXEC addCharacterRef */
/*   @_userId = 1, */
/*   @_name = 'Pedro Penduko', */
/*   @_jobTitle = 'Actor', */
/*   @_contactNo = '09', */
/*   @_email ='penduko@penduko.com' */


/* UPDATE CHARACTER REFERENCES */

CREATE PROCEDURE updateCharacterRef
  @_charRefId INT,
  @_name VARCHAR(100),
  @_jobTitle VARCHAR(100),
  @_contactNo VARCHAR(20),
  @_email VARCHAR(100)
AS
BEGIN
  UPDATE CharacterRef
  SET  name = @_name, jobTitle = @_jobTitle, contactNo = @_contactNo, email = @_email
  WHERE charRefId = @_charRefId
END


/* EXEC updateCharacterRef */
/*   @_charRefId = 1, */
/*   @_name = 'Pedro Penduko', */
/*   @_jobTitle = 'Actor', */
/*   @_contactNo = '09123', */
/*   @_email ='penduko@penduko.com' */


/* DELETE CHARACTER REFERENCES */

CREATE PROCEDURE deleteCharacterRef
  @_charRefId INT
AS
BEGIN
  DELETE FROM CharacterRef
  WHERE charRefId = @_charRefId
END


/* EXEC deleteCharacterRef */
/*   @_charRefId = 2 */




/* TODO */
/* CLARIFY RESUME TEMPLATE */
/* CLARIFY RESUME LINK */


/* STORED PROCEDURE FOR ResumeTemplate */

/* ADD RESUME TEMPLATE */

CREATE PROCEDURE addResumeTemplate
  @_title VARCHAR(100),
  @_description VARCHAR(100),
  @_design TEXT
AS
BEGIN
  INSERT INTO ResumeTemplate
  VALUES(@_title, @_description, @_design)
END

EXEC addResumeTemplate
  @_title = 'RESUME 1',
  @_description = 'NEW TEMPLATE',
  @_design = '<TEMPLATE1 />'

/* UPDATE RESUME TEMPLATE */

CREATE PROCEDURE updateResumeTemplate
  @_resumeId INT,
  @_title VARCHAR(100),
  @_description VARCHAR(100),
  @_design TEXT
AS
BEGIN
  UPDATE ResumeTemplate
  SET title = @_title, description = @_description, design = @_design
  WHERE resumeId = @_resumeId
END


/* DELETE RESUME TEMPLATE */

CREATE PROCEDURE deleteResumeTemplate
  @_resumeId INT
AS
BEGIN
  DELETE FROM ResumeTemplate
  WHERE resumeId = @_resumeId
END


/* EXEC deleteCharacterRef */
/*   @_charRefId = 2 */



/* STORED PROCEDURE FOR ResumeLink */

/* ADD RESUME LINK */

CREATE PROCEDURE addResumeLink
  @_userId INT,
AS
BEGIN
  INSERT INTO ResumeLink
  VALUES(@_userId)
END


/* EXEC addResumeLink */
/*   @_userId = 1 */


/* DELETE RESUME LINK */

CREATE PROCEDURE deleteResumeLink
  @_resumeId INT
AS
BEGIN
  DELETE FROM ResumeLink
  WHERE resumeId = @_resumeId
END


EXEC deleteResumeLink
  /* @_resumeId = 2 */
