$.ajax({
           type: "GET",
           contentType: "application/json; charset=utf-8",
           url: 'home/location_data',
           dataType: 'json',
           success: function (data) {
               draw(data);
           },
           error: function (result) {
               error();
           }
       });

 function draw(data) {
  var dataset = {children: data};
  var diameter = 600;
  var color = d3.scaleOrdinal(d3.schemeCategory20);

  var bubble = d3.pack(dataset)
          .size([diameter, diameter])
          .padding(1.5);
  var svg = d3.select(".chart2")
          .append("svg")
          .attr("width", diameter)
          .attr("height", diameter)
          .attr("class", "bubble");

  var nodes = d3.hierarchy(dataset)
          .sum(function(d) {
            console.log(d);
            return d.count;
          });

  var node = svg.selectAll(".node")
          .data(bubble(nodes).descendants())
          .enter()
          .filter(function(d){
              return  !d.children
          })
          .append("g")
          .attr("class", "node")
          .attr("transform", function(d) {
              return "translate(" + d.x + "," + d.y + ")";
          });

  node.append("title")
          .text((function(d) {
              return d.data.name + ": " + d.data.count;
          }));

  node.append("circle")
          .attr("r", function(d) {
              console.log(d);
              return d.r;
          })
          .style("fill", (function(d) {
              return color(d.value);
          }));

  node.append("text")
          .attr("dy", ".3em")
          .style("text-anchor", "middle")
          .text((function(d) {
              return d.data.name + ": " + d.data.count;
          }));

  d3.select(self.frameElement)
          .style("height", diameter + "px");
  }

  function error() {
    console.log("error")
  }
