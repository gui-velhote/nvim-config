
local overseer = require('overseer')
overseer.setup()

local M = {}

function M.rodarTeste()
  local task = overseer.new_task({
    name="run folha",
    strategy={
      "orchestrator",
      tasks={{
        name="run folha",
        cmd="cd folha2020" ..
            " && mvn -P teste package" ..
            " && java -cp target/folha-2020-1.0-SNAPSHOT-jar-with-dependencies.jar br.usp.jfolha2020.proc.TesteIndividual2",
      }}
    }
  })
  task:start()
end

return M
