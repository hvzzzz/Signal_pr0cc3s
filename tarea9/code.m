clc;clear all;close all;
R=1e3
C=8E-9
ts=1/44100

B=[1,1]
A=[(1+((2*R*C)/ts)),(1-((2*R*C)/ts))]
freqz(B,A,2000)