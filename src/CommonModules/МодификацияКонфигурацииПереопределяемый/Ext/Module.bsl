﻿
&После("ПриСозданииНаСервере")
Процедура АпиЭ_ПриСозданииНаСервере(Форма, Отказ, СтандартнаяОбработка)
	Если Форма.ИмяФормы = "Документ.ЗаказКлиента.Форма.ФормаДокумента" Тогда	
		// Заполнение таблицы цен 
		ТаблицаЦен = ИнтерфейсАпиСервер.ЗаполнитьТаблицуЦенПоЗаказу(Форма.Объект.Ссылка);
		
//Заглушка - потом вынести в фоновое задание, если будет долго отвечать API.		
		РезультатЗаполнения = Обработки.ИнтерфейсAPIРусскийСвет.ЗаполнитьЦеныНоменклатурыВТаблице(ТаблицаЦен); 
		РезультатЗаполнения = ИнтерфейсАпиСервер; 
		
		Форма.ТаблицаЦенЗаказа.Загрузить(ТаблицаЦен);
		
		НовыйЭлемент = Форма.Элементы.Вставить("ЦенаПоставщика", Тип("ПолеФормы"),Форма.Элементы.Товары,Форма.Элементы.ТоварыЦена);
		НовыйЭлемент.Вид = ВидПоляФормы.ПолеВвода; 
		НовыйЭлемент.РежимВыбораИзСписка = Истина; 
		НовыйЭлемент.ОтображениеКнопкиВыбора = ОтображениеКнопкиВыбора.ОтображатьВПолеВвода; 
		НовыйЭлемент.Заголовок = "Цена поставщика";	
		НовыйЭлемент.ПутьКДанным = "Объект.Товары.ЦенаПоставщика";	
		НовыйЭлемент.УстановитьДействие("ПриИзменении", "ТоварыЦенаПоставщикаПриИзменении");
	КонецЕсли;
КонецПроцедуры
