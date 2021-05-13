declare @columns varchar(max)='[0001MSO][001-FAZENDA][00-PRODUTO][02FA001][02FA002][02FA003][02FA004][02MP001][02-MP001]'
declare @campo varchar(15)
declare @xy integer, @cnt1 integer,  @posicaox integer, @posicaoy integer, @maior integer, @tam integer

set @xy=0
set @maior=0
print @columns
SELECT @cnt1=LEN(@columns) - LEN(REPLACE(@columns, '[', ''))

while (@cnt1>@xy)
begin	

	set @posicaox = (SELECT cast(CHARINDEX('[', @columns, @maior) as int))
	set @posicaoy = (SELECT cast(CHARINDEX(']', @columns, @maior) as int))
	set @tam = (@posicaoy-@posicaox)-1
	set @campo = (select substring(@columns, @posicaox+1, @tam))
	print @campo

	if @posicaoy > @maior 
			set @maior = @posicaoy+1
	
	set @xy=@xy+1
end