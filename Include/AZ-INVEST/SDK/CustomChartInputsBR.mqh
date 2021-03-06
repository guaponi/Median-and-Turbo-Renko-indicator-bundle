#property copyright "Copyright 2018-2020, Level Up Software"
#property link      "http://www.az-invest.eu"

#ifdef SHOW_INDICATOR_INPUTS
         
   #ifdef USE_CUSTOM_SYMBOL
   
      input string                     customChartName = "";                        // Substituir o nome do gráfico personalizado (custom) por
      input string                     applyTemplate = "default";                   // Aplicar um template ao gráfico personalizado
      input ENUM_BOOL                  forceFasterRefresh = true;                   // Forçar atualização mais rápida do gráfico
      input ENUM_BOOL                  forBacktester = false;                       // Criar gráfico apenas para backtest
   
   #endif // end of USE_CUSTOM_SYMBOL
      
   #ifndef USE_CUSTOM_SYMBOL // Main Inputs block
       
      input string                  TradingSessionTime = "00:00-00:00";             // Horário da Sessão de Trade
      input ENUM_PIVOT_POINTS       showPivots = ppNone;                            // Mostrar Níveis de Pivô
      input ENUM_PIVOT_TYPE         pivotPointCalculationType = ppHLC3;             // Cálculo do Ponto de Pivô
      input color                   RColor = clrDodgerBlue;                         // Cor da linha de Resistência
      input color                   PColor = clrGold;                               // Cor da linha de Pivô
      input color                   SColor = clrFireBrick;                          // Cor da linha de Resistência
      input color                   PDHColor = clrHotPink;                          // Cor da máxima do dia anterior
      input color                   PDLColor = clrLightSkyBlue;                     // Cor da mínima do dia anterior
      input color                   PDCColor = clrGainsboro;                        // Cor do fechamento do dia anterior
            ENUM_BOOL               showNextBarLevels = false;                      // Mostrar projeção de fechamento do box
            color                   HighThresholdIndicatorColor = clrLime;          // Cor da projetção do box de alta
            color                   LowThresholdIndicatorColor = clrRed;            // Cor da projetção do box de baixa
            color                   InfoTextColor = clrNONE;                        // Cor da informação do horário de abertura da barra atual
      input ENUM_ALERT_WHEN         AlertMeWhen = ALERT_WHEN_None;                  // Condição de Alerta
      input ENUM_ALERT_NOTIFY_TYPE  AlertNotificationType = ALERT_NOTIFY_TYPE_None; // Tipo de Notificação do Alerta
      
      input ENUM_BOOL               MA1on = false;                                  // Mostrar 1a. Média Móvel 
      input ENUM_MA_LINE_TYPE       MA1lineType = MA_LINE;                          // Esboçar 1a. Média Móvel como
      input int                     MA1period = 9;                                  // Período da 1a. Média Móvel
      input ENUM_MA_METHOD_EXT      MA1method =  _MODE_EMA;                         // Tipo da 1a. Média Móvel
      input ENUM_APPLIED_PRICE      MA1applyTo = PRICE_CLOSE;                       // Aplicar a
      input int                     MA1shift = 0;                                   // Deslocamento 1a. Média Móvel
      input ENUM_BOOL               MA1priceLabel = false;                          // Exibir preço da 1a. Média Móvel
      
      input ENUM_BOOL               MA2on = false;                                  // Mostrar 2a. Média Móvel 
      input ENUM_MA_LINE_TYPE       MA2lineType = MA_LINE;                          // Esboçar 2a. Média Móvel como
      input int                     MA2period = 86;                                 // Período da 2a. Média Móvel
      input ENUM_MA_METHOD_EXT      MA2method = _LINEAR_REGRESSION;                 // Tipo da 2a. Média Móvel
      input ENUM_APPLIED_PRICE      MA2applyTo = PRICE_CLOSE;                       // Aplicar a
      input int                     MA2shift = 0;                                   // Deslocamento 2a. Média Móvel
      input ENUM_BOOL               MA2priceLabel = false;                          // Exibir preço da 2a. Média Móvel
      
      input ENUM_BOOL               MA3on = false;                                  // Mostrar 3a. Média Móvel 
      input ENUM_MA_LINE_TYPE       MA3lineType = MA_LINE;                          // Esboçar 3a. Média Móvel como
      input int                     MA3period = 20;                                 // Período da 3a. Média Móvel
      input ENUM_MA_METHOD_EXT      MA3method = _VWAP_TICKVOL;                      // Tipo da 3a. Média Móvel
      input ENUM_APPLIED_PRICE      MA3applyTo = PRICE_CLOSE;                       // Aplicar a
      input int                     MA3shift = 0;                                   // Deslocamento 3a. Média Móvel
      input ENUM_BOOL               MA3priceLabel = false;                          // Exibir preço da 3a. Média Móvel

      input ENUM_BOOL               MA4on = false;                                  // Mostrar 4a. Média Móvel 
      input ENUM_MA_LINE_TYPE       MA4lineType = MA_LINE;                          // Esboçar 4a. Média Móvel como
      input int                     MA4period = 21;                                 // Período da 4a. Média Móvel
      input ENUM_MA_METHOD_EXT      MA4method = _MODE_SMA;                          // Tipo da 4a. Média Móvel
      input ENUM_APPLIED_PRICE      MA4applyTo = PRICE_CLOSE;                       // Aplicar a
      input int                     MA4shift = 0;                                   // Deslocamento 4a. Média Móvel
      input ENUM_BOOL               MA4priceLabel = false;                          // Exibir preço da 4a. Média Móvel
      
      input ENUM_CHANNEL_TYPE       ShowChannel = _None;                            // Mostrar Bandas & Canais
      input int                     ChannelPeriod = 20;                             // Período dos Canais
      input int                     ChannelAtrPeriod = 10;                          // Período ATR do Canais
      input ENUM_APPLIED_PRICE      ChannelAppliedPrice = PRICE_CLOSE;              // Aplicar Canais em
      input double                  ChannelMultiplier = 2;                          // Multiplicador dos Canais
      input double                  ChannelBandsDeviations = 2.0;                   // Desvio das Banda
      input ENUM_BOOL               ChannelPriceLabel = false;                      // Exibir preço das bandas   
      input ENUM_BOOL               ChannelMidPriceLabel = false;                   // Exibir preço da linha média das bandas
                        
      input ENUM_BOOL               UsedInEA = false;                               // Indicator used in EA via iCustom() 
      input double                  TopBottomPaddingPercentage = 0.30;              // Ajuste de plotagem margens (0.0 - 1.0)
      input ENUM_BOOL               showCurrentBarOpenTime = true;                  // Mostrar informações do gráfico
      input string                  SoundFileBull = "news.wav";                     // Som do fechamento de box de alta
      input string                  SoundFileBear = "timeout.wav";                  // Som do fechamento de box de baixa      
      input ENUM_BOOL               DisplayAsBarChart = false;                      // Mostrar em forma de barras
      input ENUM_BOOL               ShiftObj = false;                               // Deslocar objetos com gráfico

   #endif // !USE_CUSTOM_SYMBOL

#else // don't SHOW_INDICATOR_INPUTS

   //
   //  This block sets default values
   //
   
   string                     TradingSessionTime = "0:0-0:0"; 
   double                     TopBottomPaddingPercentage = 0;
   ENUM_PIVOT_POINTS          showPivots = ppNone;
   ENUM_PIVOT_TYPE            pivotPointCalculationType = ppHLC3;
   color                      RColor = clrNONE;
   color                      PColor = clrNONE;
   color                      SColor = clrNONE;
   color                      PDHColor = clrNONE;
   color                      PDLColor = clrNONE;
   color                      PDCColor = clrNONE;
   ENUM_BOOL                  showNextBarLevels = false;
   color                      HighThresholdIndicatorColor = clrNONE;
   color                      LowThresholdIndicatorColor = clrNONE;
   ENUM_BOOL                  showCurrentBarOpenTime = false;
   color                      InfoTextColor = clrNONE;
   
   ENUM_ALERT_WHEN            AlertMeWhen = ALERT_WHEN_None;  
   ENUM_ALERT_NOTIFY_TYPE     AlertNotificationType = ALERT_NOTIFY_TYPE_None; 
      
   string                     SoundFileBull = "";
   string                     SoundFileBear = "";
   ENUM_BOOL                  DisplayAsBarChart = true;
   ENUM_BOOL                  ShiftObj = false;
   ENUM_BOOL                  UsedInEA = true; // This should always be set to TRUE for EAs & Indicators
          
#endif // SHOW_INDICATOR_INPUTS
