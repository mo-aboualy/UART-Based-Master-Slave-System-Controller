`timescale 1ns / 1ns

module auto_garage_tb();

    reg UP_Max_tb, activate_tb, DN_Max_tb;
    reg clk_tb, rst_tb;
    wire UP_M_tb, DN_M_tb;

    auto_garage DUT (
        .UP_Max(UP_Max_tb),
        .activate(activate_tb),
        .DN_Max(DN_Max_tb),
        .clk(clk_tb),
        .rst(rst_tb),
        .UP_M(UP_M_tb),
        .DN_M(DN_M_tb)
    );
    
    always #10 clk_tb = ~clk_tb;

    task open_door;
        begin
            activate_tb = 1;
            DN_Max_tb   = 1;
            UP_Max_tb   = 0;
            #20
            UP_Max_tb = 1; 
        end
    endtask

    task close_door;
        begin
            activate_tb = 1;
            DN_Max_tb   = 0;
            UP_Max_tb   = 1;
            #20
            DN_Max_tb = 1; 
        end
    endtask

    task idle;
        begin
            activate_tb = 0;
        end
    endtask

    initial begin
        $dumpfile("auto_garage_tb.vcd");
        $dumpvars;
        $monitor("t=%0t state_inputs: activate=%b UP_Max=%b DN_Max=%b | outputs: UP_M=%b DN_M=%b",
                  $time, activate_tb, UP_Max_tb, DN_Max_tb, UP_M_tb, DN_M_tb);

        UP_Max_tb = 0; activate_tb = 0; DN_Max_tb = 0; clk_tb = 0; rst_tb = 0;

        #5
        rst_tb = 1;   // release reset

        open_door;
        #30           
        
        close_door;
        #30           
        idle;
        #30          
        
        $finish;
    end

endmodule