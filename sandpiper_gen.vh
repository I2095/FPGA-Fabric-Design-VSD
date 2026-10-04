`ifndef SANDPIPER_VH
  initial begin
    $error("SandPiper project's sp_<proj>.vh file must include sandpiper.vh.");
    $finish;
  end
`endif