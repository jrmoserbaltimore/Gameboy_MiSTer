// vim: sw=4 ts=4 et
// Gameboy sound engine based on gbc_snd.vhdl from MiSTer GBC
// 
// John Moser <john.r.moser@gmail.com>
// 
// License:  MIT

module GBCSound
(
    input logic clk,
    input logic ce,
    input logic reset,

    input logic is_gbc,

    input logic s1_read,
    input logic s1_write,
    input logic [5:0] s1_addr,
    output logic [7:0] s1_readdata,
    input logic [7:0] s1_writedata,

    output logic [15:0] snd_left,
    output logic [15:0] snd_right
);
    bit en_snd;  // Enable at base sound frequency (4.19MHz)
    bit en_snd2; // Enable at clk/2
    bit en_snd4; // Enable at clk/4
    bit en_512;  // 512Hz enable 

    bit en_snden2; // Enable at clk/2
    bit en_snden4; // Enable at clk/4

    logic [0:31][3:0] wav_ram; // Wave table

    // ===============
    // = Square Wave =
    // ===============
    // This chanel comes in two flavours, with channel 2 not having a sweep
    // register.
    module GBCSoundSquare
    (
        // Sweep Register, only in Square 1; hardwire all to 0 for Square 2.
        input logic [2:0] SweepTime, // sq1_swper, bits 6-4
        input logic Direction, // sq1_swdir, bit 3
        input logic [2:0] Shift, // sq1_swshift, bits 2-0

        // Length and patern register
        input logic [1:0] Duty, // sq1_duty, bits 7-6
        input logic [5:0] Length, // sq1_slen

        // Volume Envelope register
        input logic [3:0] InitialVolume, // sq1_svol, bit 7-4 (is this what svol referenced?)
        input logic EnvelopeDirection, // sq1_envsgn, bit 3
        input logic EnvelopePeriod, // sq1_envper, bit 2-0  (is this what envper referenced?)

        // Frequency register, 16 bits
        input logic [10:0] Frequency, // sq1_freq, bit 2-0 concat NR13
        input logic Initial, // sq1_trigger, bit 7 (is this what trigger is?)
        input logic NoLoop, // sq1_lenchk, bit 6 (1 = don't loop, 0 = loop) (sustain?)

        output logic [3:0] Sample // PanDocs says the output is 0x0 to 0xf
    );
    // TODO:  rewrite sq1 and sq2 code in here
    endmodule

    // ================
    // = Wave Channel =
    // ================
    // TODO:  Sound channel 3 module

    // =================
    // = Noise Channel =
    // =================
    // TODO:  Noise channel module

    // TODO:  Port over VHDL stuff and try to make it less than 1KLOC
    //  - Instantiate two GBCSoundSquare modules
    //    - Hardwire Sweep register on Channel 2 to '0
    //  - Instantiate a wave channel
    //  - Instantiate a noise channel
    //  - ((Figure out if anything else should be abstracted))
    //  - Mixer to produce both headphone outputs
    //  - Glue together with control logic
endmodule
