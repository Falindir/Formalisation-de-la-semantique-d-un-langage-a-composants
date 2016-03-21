port interface IPrinter {
  void print(int val);
}

port interface ICounter {
  void increment();
  void show();
}

component Printer {
  provides IPrinter p;

  methods m {
    void print (int val) {
      // ...
    }
  };

  plug m into p;
}

component Counter {
  provides ICounter c;
  requires IPrinter rp;

  methods m {
    int val = 0;

    void increment () {
      val = val + 1;
    }

    void show () {
      rp.print(val);
    }
  };

  plug m into c;
}

object interface OCounter {
  provides ICounter c;
}

object interface OPrinter {
  provides IPrinter p;
}

{
  OPrinter p1 = new Printer;
  OCounter c1 = new Counter with [rp := p1.p];

  c1.c.increment();
  c1.c.increment();
  c1.c.increment();
  c1.c.increment();
  c1.c.show();
}
