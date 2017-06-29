$.ajax({
           type: "GET",
           contentType: "application/json; charset=utf-8",
           url: 'home/salary_data',
           dataType: 'json',
           success: function (data) {
               donut(data);
           },
           error: function (result) {
               error();
           }
       });

  function donut(data) {
    var dataset = {children: data};
    var width  = 400,
        height = 300,
        radius = Math.min(width, height) / 2;

    var color = d3.scale.ordinal()
        .range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"]);

    var arc = d3.svg.arc(dataset)
        .outerRadius(radius - 10)
        .innerRadius(radius - 70);

    var pie = d3.layout.pie(dataset)
        .sort(null)
        .value(function (d) {
            return d.count;
        });

    var svg = d3.select("chart3")
        .append("svg")
        .attr("width", width)
        .attr("height", height)
        .append("g")
        .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
     }
     var g = svg.selectAll(".arc")
        .data(pie(data))
        .enter().append("g")
        .attr("class", "arc");

    g.append("path")
        .attr("d", arc)
        .style("fill", function (d) {
            return color(d.data.name);
        });

    g.append("text")
        .attr("transform", function (d) {
            return "translate(" + arc.centroid(d) + ")";
        })
        .attr("dy", ".35em")
        .text(function (d) {
            return d.name;
        });

    function type(d) {
        d.count = +d.count;
        return d;
    }
