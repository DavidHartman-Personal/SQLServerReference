DECLARE @trancount INT;BEGIN TRANSACTION; SET NOCOUNT ON;
 DELETE FROM [DB].[owner].[PO_FC] WHERE TABLE in (-1,-2,-3,-4);
 set @trancount=@@rowcount
 IF @trancount = 4 OR @trancount = 0 
  BEGIN
   PRINT 'Deleted correct number of records:' + cast(@trancount as varchar(10))
   SET NOCOUNT OF
   COMMIT TRANSACTION;
  END
 ELSE 
  BEGIN
    PRINT 'Incorrect number of records deleted: ' + cast(@trancount as varchar(10))
	SET NOCOUNT OFF
	ROLLBACK TRANSACTION
  END;
