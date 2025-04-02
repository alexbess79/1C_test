﻿// Заполняет РегистрСведений.АпиЭ_СоответствиеЗначенийРеквизитов 
// найденными реквизитами и их значениями при разборе XML 
// чтобы можно было сопоставить их со значениями в базе
//
//
// Параметры:
//  FeatureETIMDetails  - ОбъектXDTO - Содержит реквизиты номенклатуры для добавления в регистр
//                 
Процедура ДобавитьРеквизитыНоменклатурыРС(FeatureETIMDetails)

	 	//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	АпиЭ_СоответствиеЗначенийРеквизитов.СсылкаНаСвойство КАК СсылкаНаСвойство,
		|	АпиЭ_СоответствиеЗначенийРеквизитов.СсылкаНаЗначение КАК СсылкаНаЗначение
		|ИЗ
		|	РегистрСведений.АпиЭ_СоответствиеЗначенийРеквизитов КАК АпиЭ_СоответствиеЗначенийРеквизитов
		|ГДЕ
		|	АпиЭ_СоответствиеЗначенийРеквизитов.FeatureCode = ""EF001792""
		|	И АпиЭ_СоответствиеЗначенийРеквизитов.FeatureValue = ""3""";
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		// Вставить обработку выборки ВыборкаДетальныеЗаписи
	КонецЦикла;
	

КонецПроцедуры // ДобавитьРеквизитНоменклатурыРС()
