//Codigo DSP
#define CHIP_6713
//bibliotecas de la tarjeta
#include "dsk6713.h"
#include "dsk6713_led.h"
#include "dsk6713_flash.h"
#include "dsk6713_aic23.h"
#include <dsk6713_dip.h>

//bibliotecas mcbsp
#include <c6x.h>
#include <csl.h>
#include <csl_mcbsp.h>
#include <csl_irq.h>

//tamaño buffer de datos de salida
#define size1 94

short i=0;
double att=10; //atenuacion;

//muestras señal sinusoidal; f=(1/96)*fs
double cos1_table[size1]={-29973,-29817,-28575
,-26867,-24537,-21276,-17393,-13356, -9473, -6212, -2951,   776,  3727,  6367,  8541,  9939, 11026, 11958, 11803
, 11492, 11026, 10250,  9784,  8541,  7144,  6212,  4970,  4193,  4814,  5125,  5435,  6833,  8386,  9939, 12269
, 14598, 16772, 18636, 20655, 22674, 24382, 25469, 26711, 27488, 28420, 29973, 31060, 31370, 31681, 32302, 32768
, 32613, 31992, 30594, 28730, 27022, 25469, 23139, 20810, 19568, 18791, 17859, 17704, 18015, 18791, 19568, 20655
, 22208, 23295, 24071, 24692, 25003, 24382, 23916, 23139, 21431, 19568, 17083, 13977, 11337,  9007,  6057,  2640
,  -776, -4659, -8541,-11958,-15375,-18636,-21587,-24382,-26867,-28730,-29817};
//Datos de inicializacion del  codec
DSK6713_AIC23_CodecHandle hCodec;

DSK6713_AIC23_Config config = { \
        0x0017, /* 0 DSK6713_AIC23_LEFTINVOL Left line input channel volume */ \
        0x0017, /* 1 DSK6713_AIC23_RIGHTINVOL Right line input channel volume */\
        0x01f9, /* 2 DSK6713_AIC23_LEFTHPVOL Left channel headphone volume */ \
        0x01f9, /* 3 DSK6713_AIC23_RIGHTHPVOL Right channel headphone volume */ \
        0x0011, /* 4 DSK6713_AIC23_ANAPATH Analog audio path control */ \
        0x0000, /* 5 DSK6713_AIC23_DIGPATH Digital audio path control */ \
        0x0000, /* 6 DSK6713_AIC23_POWERDOWN Power down control */ \
        0x0043, /* 7 DSK6713_AIC23_DIGIF Digital audio interface format */ \
        0x0081, /* 8 DSK6713_AIC23_SAMPLERATE Sample rate control */ \
        0x0001 /* 9 DSK6713_AIC23_DIGACT Digital interface activation */ \
    };

MCBSP_Config mcbspConfig = { 0x00010000, // SPCR is set for transmitting
0x000100A0, // 1-phase 32bit word for RCR
0x000100A0, // 1-phase 32bit word for XCR
0x00000000, // SRGR (Sample rate generator register FSGM)
0x00000000,
0x00000000,
0x00000000,
0x00000000,
};


void main()
{
    //Inicializacion codec
    DSK6713_AIC23_CodecHandle hCodec;
    Int32 OUT_L;
    int i=0;
    float d_n=0.0;

   DSK6713_init();
   hCodec = DSK6713_AIC23_openCodec(0, &config);

    // Ajustar frecuencia a 44KHz
    DSK6713_AIC23_setFreq(hCodec,DSK6713_AIC23_FREQ_44KHZ);
    extern far MCBSP_Handle DSK6713_AIC23_DATAHANDLE;
    MCBSP_config( DSK6713_AIC23_DATAHANDLE, &mcbspConfig );
    MCBSP_start( DSK6713_AIC23_DATAHANDLE, MCBSP_XMIT_START |
    MCBSP_SRGR_START | MCBSP_SRGR_FRAMESYNC , 220 );
    for(;;)
    {
        //Tomar datos de salida
        d_n=(cos1_table[i]/att);
        OUT_L = (Int32)(d_n);
       // Mandar muestra al codec
        while (!DSK6713_AIC23_write(hCodec, OUT_L));
        //Incrementar contador y reiniciarlo
        if (++i>size1-1) i=0;
    }
    DSK6713_AIC23_closeCodec(hCodec); // Cerradura del codec, no alcanzable

    }










