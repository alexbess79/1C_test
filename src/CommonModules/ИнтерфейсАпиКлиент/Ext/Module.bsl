﻿// <Описание процедуры>
//
// Параметры:
//  ТаблицаЦенЗаказа  - ТаблицаЗначений - Реквизит формы содержащий список цен поставщиков
//                 
//  НоменклатураКУдалению  - СправочникСсылка.Номенклатура 
//                 Номенклатуру которую надо удалить
//
Процедура УдалитьНоменклатуруИзТаблицыЦен(ТаблицаЦенЗаказа,НоменклатураКУдалению)  Экспорт

	Отбор = Новый Структура();
	Отбор.Вставить("Номенклатура",НоменклатураКУдалению);
	СтрокиТаблицы = ТаблицаЦенЗаказа.НайтиСтроки(Отбор);
	
	Для каждого СтрокаТаблицы Из СтрокиТаблицы Цикл
		
		ТаблицаЦенЗаказа.Удалить(СтрокаТаблицы);
		
	КонецЦикла;

КонецПроцедуры // УдалитьНоменклатуруИзТаблицыЦен()
