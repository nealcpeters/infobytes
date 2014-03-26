describe("List", function() {
  it("can be created with an id", function() {
    list = new List(5)
    expect(list.id).toEqual(5);
  });

});

describe("Item", function() {
  it("can be created with an order", function() {
    item = new Item(5)
    expect(item.number).toEqual(5);
  });
});

describe("Paragraph blank varaibles", function() {
  it("are created blank", function() {
    expect(display).toEqual(null);
    expect(adder).toEqual(null);
    expect(link).toEqual(null);
    expect(linkText).toEqual(null);
  });
});