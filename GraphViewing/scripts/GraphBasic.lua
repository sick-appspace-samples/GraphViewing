--Start of Global Scope---------------------------------------------------------

print('AppEngine Version: ' .. Engine.getVersion())

-- Creating viewer handle
local v = View.create()

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

-- Plot function f(x) = (x-2)^2 - 2
local function plotFunction()
  local x = {0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0}
  local y = {2.0, 0.25, -1.0, -1.75, -2.0, -1.75, -1.0, 0.25, 2.0, 4.25, 7.0}

  -- Mark the minimum at x = 2.0 with a red cross
  local minimaPoint = Point.create(2.0, -2.0)

  local pointDeco = View.ShapeDecoration.create()
  pointDeco:setPointSize(0.3)
  pointDeco:setPointType('CROSS')
  pointDeco:setLineColor(255, 0, 0)

  -- Create a GraphDecoration object for setting visual properties of the graph plot
  local graphDeco = View.GraphDecoration.create()
  graphDeco:setLabels('x', 'f(x) = (x-2)² - 2')
  graphDeco:setAspectRatio('SQUARE')

  -- Plot the function and overlay the minima point on the graph
  v:clear()
  v:addGraph(y, x, graphDeco, 'graph')
  v:addShape(minimaPoint, pointDeco, 'point', 'graph')
  v:present()
end

 --Plot histogram of a Gaussian-shaped distribution
local function plotHistogram()
  local frequency, bin = {}, {}
  for t = -5.0, 5.0, 0.25 do
    table.insert(bin, t)
    table.insert(frequency, math.exp(-t * t / 4.0))
  end

  -- Create a GraphDecoration object for setting visual properties of the graph plot
  local histogramDeco = View.GraphDecoration.create()
  histogramDeco:setGraphType('BAR')
  histogramDeco:setDrawSize(0.1)

  -- Plot the histogram
  v:clear()
  v:addGraph(frequency, bin, histogramDeco)
  v:present()
end

--Plot mathematical spiral in polar form (r, phi)
local function plotSpiral()
  local r,
    phi = {}, {}
  for t = 0, 12 * math.pi, 0.1 do
    table.insert(phi, t)
    table.insert(r, t * t)
  end

  -- Create a GraphDecoration object, setting polar mode
  local polarDeco = View.GraphDecoration.create()
  polarDeco:setPolarPlot(true)
  polarDeco:setGraphColor(255, 0, 0)

  -- Plot the the spiral
  v:clear()
  v:addGraph(r, phi, polarDeco, 'graph')
  v:present()
end

local function main()
  -- Demonstrating the different graph options
  plotFunction()
  Script.sleep(3000)
  plotHistogram()
  Script.sleep(3000)
  plotSpiral()
  print('App finished.')
end

--The following registration is part of the global scope which runs once after startup
--Registration of the 'main' function to the 'Engine.OnStarted' event
Script.register('Engine.OnStarted', main)

--End of Function and Event Scope--------------------------------------------------
