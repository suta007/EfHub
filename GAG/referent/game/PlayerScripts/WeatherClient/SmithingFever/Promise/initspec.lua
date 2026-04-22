return function()
	local v_u_1 = require(script.Parent)
	v_u_1.TEST = true
	local v_u_2 = Instance.new("BindableEvent")
	v_u_1._timeEvent = v_u_2.Event
	local v_u_3 = 0
	function v_u_1._getTime()
		-- upvalues: (ref) v_u_3
		return v_u_3
	end
	local function v_u_6(p4)
		-- upvalues: (ref) v_u_3, (copy) v_u_2
		local v5 = p4 or 0.016666666666666666
		v_u_3 = v_u_3 + v5
		v_u_2:Fire(v5)
	end
	local function v_u_7(...)
		return select("#", ...), { ... }
	end
	describe("Promise.Status", function()
		-- upvalues: (copy) v_u_1
		it("should error if indexing nil value", function()
			-- upvalues: (ref) v_u_1
			expect(function()
				-- upvalues: (ref) v_u_1
				local _ = v_u_1.Status.wrong
			end).to.throw()
		end)
	end)
	describe("Unhandled rejection signal", function()
		-- upvalues: (copy) v_u_1, (ref) v_u_6
		it("should call unhandled rejection callbacks", function()
			-- upvalues: (ref) v_u_1, (ref) v_u_6
			local v_u_9 = v_u_1.new(function(_, p8)
				p8(1, 2)
			end)
			local v_u_10 = 0
			local function v14(p11, p12, p13)
				-- upvalues: (ref) v_u_10, (copy) v_u_9
				v_u_10 = v_u_10 + 1
				expect(p11).to.equal(v_u_9)
				expect(p12).to.equal(1)
				expect(p13).to.equal(2)
			end
			local v15 = v_u_1.onUnhandledRejection(v14)
			v_u_6()
			expect(v_u_10).to.equal(1)
			v15()
			v_u_1.new(function(_, p16)
				p16(3, 4)
			end)
			v_u_6()
			expect(v_u_10).to.equal(1)
		end)
	end)
	describe("Promise.new", function()
		-- upvalues: (copy) v_u_1
		it("should instantiate with a callback", function()
			-- upvalues: (ref) v_u_1
			local v17 = v_u_1.new(function() end)
			expect(v17).to.be.ok()
		end)
		it("should invoke the given callback with resolve and reject", function()
			-- upvalues: (ref) v_u_1
			local v_u_18 = 0
			local v_u_19 = nil
			local v_u_20 = nil
			local v23 = v_u_1.new(function(p21, p22)
				-- upvalues: (ref) v_u_18, (ref) v_u_19, (ref) v_u_20
				v_u_18 = v_u_18 + 1
				v_u_19 = p21
				v_u_20 = p22
			end)
			expect(v23).to.be.ok()
			expect(v_u_18).to.equal(1)
			expect(v_u_19).to.be.a("function")
			expect(v_u_20).to.be.a("function")
			expect(v23:getStatus()).to.equal(v_u_1.Status.Started)
		end)
		it("should resolve promises on resolve()", function()
			-- upvalues: (ref) v_u_1
			local v_u_24 = 0
			local v26 = v_u_1.new(function(p25)
				-- upvalues: (ref) v_u_24
				v_u_24 = v_u_24 + 1
				p25()
			end)
			expect(v26).to.be.ok()
			expect(v_u_24).to.equal(1)
			expect(v26:getStatus()).to.equal(v_u_1.Status.Resolved)
		end)
		it("should reject promises on reject()", function()
			-- upvalues: (ref) v_u_1
			local v_u_27 = 0
			local v29 = v_u_1.new(function(_, p28)
				-- upvalues: (ref) v_u_27
				v_u_27 = v_u_27 + 1
				p28()
			end)
			expect(v29).to.be.ok()
			expect(v_u_27).to.equal(1)
			expect(v29:getStatus()).to.equal(v_u_1.Status.Rejected)
		end)
		it("should reject on error in callback", function()
			-- upvalues: (ref) v_u_1
			local v_u_30 = 0
			local v31 = v_u_1.new(function()
				-- upvalues: (ref) v_u_30
				v_u_30 = v_u_30 + 1
				error("hahah")
			end)
			expect(v31).to.be.ok()
			expect(v_u_30).to.equal(1)
			expect(v31:getStatus()).to.equal(v_u_1.Status.Rejected)
			local v32 = expect
			local v33 = v31._values[1]
			v32(tostring(v33):find("hahah")).to.be.ok()
			local v34 = expect
			local v35 = v31._values[1]
			v34(tostring(v35):find("init.spec")).to.be.ok()
			local v36 = expect
			local v37 = v31._values[1]
			v36(tostring(v37):find("runExecutor")).to.be.ok()
		end)
		it("should work with C functions", function()
			-- upvalues: (ref) v_u_1
			expect(function()
				-- upvalues: (ref) v_u_1
				v_u_1.new(tick):andThen(tick)
			end).to.never.throw()
		end)
		it("should have a nice tostring", function()
			-- upvalues: (ref) v_u_1
			local v38 = expect
			local v39 = v_u_1.resolve
			v38(tostring(v39()):gmatch("Promise(Resolved)")).to.be.ok()
		end)
		it("should allow yielding", function()
			-- upvalues: (ref) v_u_1
			local v_u_40 = Instance.new("BindableEvent")
			local v42 = v_u_1.new(function(p41)
				-- upvalues: (copy) v_u_40
				v_u_40.Event:Wait()
				p41(5)
			end)
			expect(v42:getStatus()).to.equal(v_u_1.Status.Started)
			v_u_40:Fire()
			expect(v42:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(v42._values[1]).to.equal(5)
		end)
		it("should preserve stack traces of resolve-chained promises", function()
			-- upvalues: (ref) v_u_1
			local v44 = v_u_1.new(function(p43)
				-- upvalues: (ref) v_u_1
				p43(v_u_1.new(function()
					error("sample text")
				end))
			end)
			expect(v44:getStatus()).to.equal(v_u_1.Status.Rejected)
			local v45 = v44._values[1]
			local v46 = tostring(v45)
			expect(v46:find("sample text")).to.be.ok()
			expect(v46:find("nestedCall")).to.be.ok()
			expect(v46:find("runExecutor")).to.be.ok()
			expect(v46:find("runPlanNode")).to.be.ok()
			expect(v46:find("...Rejected because it was chained to the following Promise, which encountered an error:")).to.be.ok()
		end)
		it("should report errors from Promises with _error (< v2)", function()
			-- upvalues: (ref) v_u_1
			local v47 = v_u_1.reject()
			v47._error = "Sample error"
			local v48 = v_u_1.resolve():andThenReturn(v47)
			expect(v48:getStatus()).to.equal(v_u_1.Status.Rejected)
			local v49 = v48._values[1]
			local v50 = tostring(v49)
			expect(v50:find("Sample error")).to.be.ok()
			expect(v50:find("...Rejected because it was chained to the following Promise, which encountered an error:")).to.be.ok()
			expect(v50:find("%[No stack trace available")).to.be.ok()
		end)
		it("should allow callable tables", function()
			-- upvalues: (ref) v_u_1
			local v52 = v_u_1.new((setmetatable({}, {
				["__call"] = function(_, p51)
					p51(1)
				end
			})))
			local v_u_53 = false
			local v55 = {
				["__call"] = function(_, p54)
					-- upvalues: (ref) v_u_53
					expect(p54).to.equal(1)
					v_u_53 = true
				end
			}
			v52:andThen((setmetatable({}, v55)))
			expect(v_u_53).to.equal(true)
		end)
		itSKIP("should close the thread after resolve", function()
			-- upvalues: (ref) v_u_1
			local v_u_56 = 0
			v_u_1.new(function(p57)
				-- upvalues: (ref) v_u_56, (ref) v_u_1
				v_u_56 = v_u_56 + 1
				p57()
				v_u_1.delay(1):await()
				v_u_56 = v_u_56 + 1
			end)
			task.wait(1)
			expect(v_u_56).to.equal(1)
		end)
	end)
	describe("Promise.defer", function()
		-- upvalues: (copy) v_u_1, (ref) v_u_6
		it("should execute after the time event", function()
			-- upvalues: (ref) v_u_1, (ref) v_u_6
			local v_u_58 = 0
			local v63 = v_u_1.defer(function(p59, p60, p61, p62)
				-- upvalues: (ref) v_u_58
				expect((type(p59))).to.equal("function")
				expect((type(p60))).to.equal("function")
				expect((type(p61))).to.equal("function")
				expect((type(p62))).to.equal("nil")
				v_u_58 = v_u_58 + 1
				p59("foo")
			end)
			expect(v_u_58).to.equal(0)
			expect(v63:getStatus()).to.equal(v_u_1.Status.Started)
			v_u_6()
			expect(v_u_58).to.equal(1)
			expect(v63:getStatus()).to.equal(v_u_1.Status.Resolved)
			v_u_6()
			expect(v_u_58).to.equal(1)
		end)
	end)
	describe("Promise.delay", function()
		-- upvalues: (copy) v_u_1, (ref) v_u_6
		it("should schedule promise resolution", function()
			-- upvalues: (ref) v_u_1, (ref) v_u_6
			local v64 = v_u_1.delay(1)
			expect(v64:getStatus()).to.equal(v_u_1.Status.Started)
			v_u_6()
			expect(v64:getStatus()).to.equal(v_u_1.Status.Started)
			v_u_6(1)
			expect(v64:getStatus()).to.equal(v_u_1.Status.Resolved)
		end)
		it("should allow for delays to be cancelled", function()
			-- upvalues: (ref) v_u_1, (ref) v_u_6
			local v_u_65 = v_u_1.delay(2)
			v_u_1.delay(1):andThen(function()
				-- upvalues: (copy) v_u_65
				v_u_65:cancel()
			end)
			expect(v_u_65:getStatus()).to.equal(v_u_1.Status.Started)
			v_u_6()
			expect(v_u_65:getStatus()).to.equal(v_u_1.Status.Started)
			v_u_6(1)
			expect(v_u_65:getStatus()).to.equal(v_u_1.Status.Cancelled)
			v_u_6(1)
		end)
	end)
	describe("Promise.resolve", function()
		-- upvalues: (copy) v_u_1
		it("should immediately resolve with a value", function()
			-- upvalues: (ref) v_u_1
			local v66 = v_u_1.resolve(5, 6)
			expect(v66).to.be.ok()
			expect(v66:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(v66._values[1]).to.equal(5)
			expect(v66._values[2]).to.equal(6)
		end)
		it("should chain onto passed promises", function()
			-- upvalues: (ref) v_u_1
			local v68 = v_u_1.resolve(v_u_1.new(function(_, p67)
				p67(7)
			end))
			expect(v68).to.be.ok()
			expect(v68:getStatus()).to.equal(v_u_1.Status.Rejected)
			expect(v68._values[1]).to.equal(7)
		end)
	end)
	describe("Promise.reject", function()
		-- upvalues: (copy) v_u_1
		it("should immediately reject with a value", function()
			-- upvalues: (ref) v_u_1
			local v69 = v_u_1.reject(6, 7)
			expect(v69).to.be.ok()
			expect(v69:getStatus()).to.equal(v_u_1.Status.Rejected)
			expect(v69._values[1]).to.equal(6)
			expect(v69._values[2]).to.equal(7)
		end)
		it("should pass a promise as-is as an error", function()
			-- upvalues: (ref) v_u_1
			local v71 = v_u_1.new(function(p70)
				p70(6)
			end)
			local v72 = v_u_1.reject(v71)
			expect(v72).to.be.ok()
			expect(v72:getStatus()).to.equal(v_u_1.Status.Rejected)
			expect(v72._values[1]).to.equal(v71)
		end)
	end)
	describe("Promise:andThen", function()
		-- upvalues: (copy) v_u_1, (copy) v_u_7
		it("should allow yielding", function()
			-- upvalues: (ref) v_u_1
			local v_u_73 = Instance.new("BindableEvent")
			local v74 = v_u_1.resolve():andThen(function()
				-- upvalues: (copy) v_u_73
				v_u_73.Event:Wait()
				return 5
			end)
			expect(v74:getStatus()).to.equal(v_u_1.Status.Started)
			v_u_73:Fire()
			expect(v74:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(v74._values[1]).to.equal(5)
		end)
		it("should run andThens on a new thread", function()
			-- upvalues: (ref) v_u_1
			local v_u_75 = Instance.new("BindableEvent")
			local v_u_76 = nil
			local v78 = v_u_1.new(function(p77)
				-- upvalues: (ref) v_u_76
				v_u_76 = p77
			end)
			local v79 = v78:andThen(function()
				-- upvalues: (copy) v_u_75
				v_u_75.Event:Wait()
				return 5
			end)
			local v80 = v78:andThen(function()
				return "foo"
			end)
			expect(v78:getStatus()).to.equal(v_u_1.Status.Started)
			v_u_76()
			expect(v80:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(v80._values[1]).to.equal("foo")
			expect(v79:getStatus()).to.equal(v_u_1.Status.Started)
		end)
		it("should chain onto resolved promises", function()
			-- upvalues: (ref) v_u_1, (ref) v_u_7
			local v_u_81 = nil
			local v_u_82 = nil
			local v_u_83 = 0
			local v_u_84 = 0
			local v85 = v_u_1.resolve(5)
			local v88 = v85:andThen(function(...)
				-- upvalues: (ref) v_u_82, (ref) v_u_81, (ref) v_u_7, (ref) v_u_83
				local v86, v87 = v_u_7(...)
				v_u_82 = v86
				v_u_81 = v87
				v_u_83 = v_u_83 + 1
			end, function()
				-- upvalues: (ref) v_u_84
				v_u_84 = v_u_84 + 1
			end)
			expect(v_u_84).to.equal(0)
			expect(v_u_83).to.equal(1)
			expect(v_u_82).to.equal(1)
			expect(v_u_81[1]).to.equal(5)
			expect(v85).to.be.ok()
			expect(v85:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(v85._values[1]).to.equal(5)
			expect(v88).to.be.ok()
			expect(v88).never.to.equal(v85)
			expect(v88:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(#v88._values).to.equal(0)
		end)
		it("should chain onto rejected promises", function()
			-- upvalues: (ref) v_u_1, (ref) v_u_7
			local v_u_89 = nil
			local v_u_90 = nil
			local v_u_91 = 0
			local v_u_92 = 0
			local v93 = v_u_1.reject(5)
			local v96 = v93:andThen(function(...)
				-- upvalues: (ref) v_u_92
				v_u_92 = v_u_92 + 1
			end, function(...)
				-- upvalues: (ref) v_u_90, (ref) v_u_89, (ref) v_u_7, (ref) v_u_91
				local v94, v95 = v_u_7(...)
				v_u_90 = v94
				v_u_89 = v95
				v_u_91 = v_u_91 + 1
			end)
			expect(v_u_92).to.equal(0)
			expect(v_u_91).to.equal(1)
			expect(v_u_90).to.equal(1)
			expect(v_u_89[1]).to.equal(5)
			expect(v93).to.be.ok()
			expect(v93:getStatus()).to.equal(v_u_1.Status.Rejected)
			expect(v93._values[1]).to.equal(5)
			expect(v96).to.be.ok()
			expect(v96).never.to.equal(v93)
			expect(v96:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(#v96._values).to.equal(0)
		end)
		it("should reject on error in callback", function()
			-- upvalues: (ref) v_u_1
			local v_u_97 = 0
			local v98 = v_u_1.resolve(1):andThen(function()
				-- upvalues: (ref) v_u_97
				v_u_97 = v_u_97 + 1
				error("hahah")
			end)
			expect(v98).to.be.ok()
			expect(v_u_97).to.equal(1)
			expect(v98:getStatus()).to.equal(v_u_1.Status.Rejected)
			local v99 = expect
			local v100 = v98._values[1]
			v99(tostring(v100):find("hahah")).to.be.ok()
			local v101 = expect
			local v102 = v98._values[1]
			v101(tostring(v102):find("init.spec")).to.be.ok()
			local v103 = expect
			local v104 = v98._values[1]
			v103(tostring(v104):find("runExecutor")).to.be.ok()
		end)
		it("should chain onto asynchronously resolved promises", function()
			-- upvalues: (ref) v_u_1
			local v_u_105 = nil
			local v_u_106 = nil
			local v_u_107 = 0
			local v_u_108 = 0
			local v_u_109 = nil
			local v111 = v_u_1.new(function(p110)
				-- upvalues: (ref) v_u_109
				v_u_109 = p110
			end)
			local v112 = v111:andThen(function(...)
				-- upvalues: (ref) v_u_105, (ref) v_u_106, (ref) v_u_107
				v_u_105 = { ... }
				v_u_106 = select("#", ...)
				v_u_107 = v_u_107 + 1
			end, function()
				-- upvalues: (ref) v_u_108
				v_u_108 = v_u_108 + 1
			end)
			expect(v_u_107).to.equal(0)
			expect(v_u_108).to.equal(0)
			v_u_109(6)
			expect(v_u_108).to.equal(0)
			expect(v_u_107).to.equal(1)
			expect(v_u_106).to.equal(1)
			expect(v_u_105[1]).to.equal(6)
			expect(v111).to.be.ok()
			expect(v111:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(v111._values[1]).to.equal(6)
			expect(v112).to.be.ok()
			expect(v112).never.to.equal(v111)
			expect(v112:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(#v112._values).to.equal(0)
		end)
		it("should chain onto asynchronously rejected promises", function()
			-- upvalues: (ref) v_u_1
			local v_u_113 = nil
			local v_u_114 = nil
			local v_u_115 = 0
			local v_u_116 = 0
			local v_u_117 = nil
			local v119 = v_u_1.new(function(_, p118)
				-- upvalues: (ref) v_u_117
				v_u_117 = p118
			end)
			local v120 = v119:andThen(function()
				-- upvalues: (ref) v_u_116
				v_u_116 = v_u_116 + 1
			end, function(...)
				-- upvalues: (ref) v_u_113, (ref) v_u_114, (ref) v_u_115
				v_u_113 = { ... }
				v_u_114 = select("#", ...)
				v_u_115 = v_u_115 + 1
			end)
			expect(v_u_115).to.equal(0)
			expect(v_u_116).to.equal(0)
			v_u_117(6)
			expect(v_u_116).to.equal(0)
			expect(v_u_115).to.equal(1)
			expect(v_u_114).to.equal(1)
			expect(v_u_113[1]).to.equal(6)
			expect(v119).to.be.ok()
			expect(v119:getStatus()).to.equal(v_u_1.Status.Rejected)
			expect(v119._values[1]).to.equal(6)
			expect(v120).to.be.ok()
			expect(v120).never.to.equal(v119)
			expect(v120:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(#v120._values).to.equal(0)
		end)
		it("should propagate errors through multiple levels", function()
			-- upvalues: (ref) v_u_1
			local v_u_121 = nil
			local v_u_122 = nil
			local v_u_123 = nil
			v_u_1.new(function(_, p124)
				p124(1, 2, 3)
			end):andThen(function() end):catch(function(p125, p126, p127)
				-- upvalues: (ref) v_u_121, (ref) v_u_122, (ref) v_u_123
				v_u_121 = p125
				v_u_122 = p126
				v_u_123 = p127
			end)
			expect(v_u_121).to.equal(1)
			expect(v_u_122).to.equal(2)
			expect(v_u_123).to.equal(3)
		end)
		it("should not call queued callbacks from a cancelled sub-promise", function()
			-- upvalues: (ref) v_u_1
			local v_u_128 = nil
			local v_u_129 = 0
			local v131 = v_u_1.new(function(p130)
				-- upvalues: (ref) v_u_128
				v_u_128 = p130
			end)
			v131:andThen(function()
				-- upvalues: (ref) v_u_129
				v_u_129 = v_u_129 + 1
			end)
			v131:andThen(function()
				-- upvalues: (ref) v_u_129
				v_u_129 = v_u_129 + 1
			end):cancel()
			v_u_128("foo")
			expect(v_u_129).to.equal(1)
		end)
	end)
	describe("Promise:cancel", function()
		-- upvalues: (copy) v_u_1, (ref) v_u_6
		it("should mark promises as cancelled and not resolve or reject them", function()
			-- upvalues: (ref) v_u_1
			local v_u_132 = 0
			local v_u_133 = 0
			local v134 = v_u_1.new(function() end):andThen(function()
				-- upvalues: (ref) v_u_132
				v_u_132 = v_u_132 + 1
			end):finally(function()
				-- upvalues: (ref) v_u_133
				v_u_133 = v_u_133 + 1
			end)
			v134:cancel()
			v134:cancel()
			expect(v_u_132).to.equal(0)
			expect(v_u_133).to.equal(1)
			expect(v134:getStatus()).to.equal(v_u_1.Status.Cancelled)
		end)
		it("should call the cancellation hook once", function()
			-- upvalues: (ref) v_u_1
			local v_u_135 = 0
			local v137 = v_u_1.new(function(_, _, p136)
				-- upvalues: (ref) v_u_135
				p136(function()
					-- upvalues: (ref) v_u_135
					v_u_135 = v_u_135 + 1
				end)
			end)
			v137:cancel()
			v137:cancel()
			expect(v_u_135).to.equal(1)
		end)
		it("should propagate cancellations", function()
			-- upvalues: (ref) v_u_1
			local v138 = v_u_1.new(function() end)
			local v139 = v138:andThen()
			local v140 = v138:andThen()
			expect(v138:getStatus()).to.equal(v_u_1.Status.Started)
			expect(v139:getStatus()).to.equal(v_u_1.Status.Started)
			expect(v140:getStatus()).to.equal(v_u_1.Status.Started)
			v139:cancel()
			expect(v138:getStatus()).to.equal(v_u_1.Status.Started)
			expect(v139:getStatus()).to.equal(v_u_1.Status.Cancelled)
			expect(v140:getStatus()).to.equal(v_u_1.Status.Started)
			v140:cancel()
			expect(v138:getStatus()).to.equal(v_u_1.Status.Cancelled)
			expect(v139:getStatus()).to.equal(v_u_1.Status.Cancelled)
			expect(v140:getStatus()).to.equal(v_u_1.Status.Cancelled)
		end)
		it("should affect downstream promises", function()
			-- upvalues: (ref) v_u_1
			local v141 = v_u_1.new(function() end)
			local v142 = v141:andThen()
			v141:cancel()
			expect(v142:getStatus()).to.equal(v_u_1.Status.Cancelled)
		end)
		it("should track consumers", function()
			-- upvalues: (ref) v_u_1
			local v_u_143 = v_u_1.new(function() end)
			local v144 = v_u_1.resolve()
			local v_u_145 = v144:andThen(function()
				-- upvalues: (copy) v_u_143
				return v_u_143
			end)
			local v147 = v_u_1.new(function(p146)
				-- upvalues: (copy) v_u_145
				p146(v_u_145)
			end)
			local v148 = v147:andThen(function() end)
			expect(v_u_145._parent).to.never.equal(v144)
			expect(v147._parent).to.never.equal(v_u_145)
			expect(v147._consumers[v148]).to.be.ok()
			expect(v148._parent).to.equal(v147)
		end)
		it("should cancel resolved pending promises", function()
			-- upvalues: (ref) v_u_1
			local v_u_149 = v_u_1.new(function() end)
			local v151 = v_u_1.new(function(p150)
				-- upvalues: (copy) v_u_149
				p150(v_u_149)
			end):finally(function() end)
			v151:cancel()
			expect(v_u_149._status).to.equal(v_u_1.Status.Cancelled)
			expect(v151._status).to.equal(v_u_1.Status.Cancelled)
		end)
		it("should close the promise thread", function()
			-- upvalues: (ref) v_u_1, (ref) v_u_6
			local v_u_152 = 0
			v_u_1.new(function()
				-- upvalues: (ref) v_u_152, (ref) v_u_1
				v_u_152 = v_u_152 + 1
				v_u_1.delay(1):await()
				v_u_152 = v_u_152 + 1
			end):cancel()
			v_u_6(2)
			expect(v_u_152).to.equal(1)
		end)
	end)
	describe("Promise:finally", function()
		-- upvalues: (copy) v_u_1
		it("should be called upon resolve, reject, or cancel", function()
			-- upvalues: (ref) v_u_1
			local v_u_153 = 0
			local function v154()
				-- upvalues: (ref) v_u_153
				v_u_153 = v_u_153 + 1
			end
			v_u_1.new(function(p155, _)
				p155()
			end):finally(v154)
			v_u_1.resolve():andThen(function() end):finally(v154):finally(v154)
			v_u_1.reject():finally(v154)
			v_u_1.new(function() end):finally(v154):cancel()
			expect(v_u_153).to.equal(5)
		end)
		it("should not forward return values", function()
			-- upvalues: (ref) v_u_1
			local v_u_156 = nil
			v_u_1.resolve(2):finally(function()
				return 1
			end):andThen(function(p157)
				-- upvalues: (ref) v_u_156
				v_u_156 = p157
			end)
			expect(v_u_156).to.equal(2)
		end)
		it("should not consume rejections", function()
			-- upvalues: (ref) v_u_1
			local v_u_158 = false
			local v_u_159 = false
			v_u_1.reject(5):finally(function()
				return 42
			end):andThen(function()
				-- upvalues: (ref) v_u_159
				v_u_159 = true
			end):catch(function(p160)
				-- upvalues: (ref) v_u_158
				v_u_158 = true
				expect(p160).to.equal(5)
			end)
			expect(v_u_158).to.equal(true)
			expect(v_u_159).to.equal(false)
		end)
		it("should wait for returned promises", function()
			-- upvalues: (ref) v_u_1
			local v_u_161 = nil
			local v163 = v_u_1.reject("foo"):finally(function()
				-- upvalues: (ref) v_u_1, (ref) v_u_161
				return v_u_1.new(function(p162)
					-- upvalues: (ref) v_u_161
					v_u_161 = p162
				end)
			end)
			expect(v163:getStatus()).to.equal(v_u_1.Status.Started)
			v_u_161()
			expect(v163:getStatus()).to.equal(v_u_1.Status.Rejected)
			local _, v164 = v163:_unwrap()
			expect(v164).to.equal("foo")
		end)
		it("should reject with a returned rejected promise\'s value", function()
			-- upvalues: (ref) v_u_1
			local v_u_165 = nil
			local v167 = v_u_1.reject("foo"):finally(function()
				-- upvalues: (ref) v_u_1, (ref) v_u_165
				return v_u_1.new(function(_, p166)
					-- upvalues: (ref) v_u_165
					v_u_165 = p166
				end)
			end)
			expect(v167:getStatus()).to.equal(v_u_1.Status.Started)
			v_u_165("bar")
			expect(v167:getStatus()).to.equal(v_u_1.Status.Rejected)
			local _, v168 = v167:_unwrap()
			expect(v168).to.equal("bar")
		end)
		it("should reject when handler errors", function()
			-- upvalues: (ref) v_u_1
			local v_u_169 = {}
			local v170, v171 = v_u_1.reject("bar"):finally(function()
				-- upvalues: (copy) v_u_169
				error(v_u_169)
			end):_unwrap()
			expect(v170).to.equal(false)
			expect(v171).to.equal(v_u_169)
		end)
		it("should not prevent cancellation", function()
			-- upvalues: (ref) v_u_1
			local v172 = v_u_1.new(function() end)
			local v_u_173 = false
			v172:finally(function()
				-- upvalues: (ref) v_u_173
				v_u_173 = true
			end)
			v172:andThen(function() end):cancel()
			expect(v172:getStatus()).to.equal(v_u_1.Status.Cancelled)
			expect(v_u_173).to.equal(true)
		end)
		it("should propagate cancellation downwards", function()
			-- upvalues: (ref) v_u_1
			local v_u_174 = false
			local v175 = v_u_1.new(function() end)
			local v176 = v175:finally(function()
				-- upvalues: (ref) v_u_174
				v_u_174 = true
			end)
			v175:cancel()
			expect(v175:getStatus()).to.equal(v_u_1.Status.Cancelled)
			expect(v176:getStatus()).to.equal(v_u_1.Status.Cancelled)
			expect(v_u_174).to.equal(true)
			expect(false).to.equal(false)
		end)
		it("should propagate cancellation upwards", function()
			-- upvalues: (ref) v_u_1
			local v_u_177 = false
			local v178 = v_u_1.new(function() end)
			local v179 = v178:finally(function()
				-- upvalues: (ref) v_u_177
				v_u_177 = true
			end)
			v179:cancel()
			expect(v178:getStatus()).to.equal(v_u_1.Status.Cancelled)
			expect(v179:getStatus()).to.equal(v_u_1.Status.Cancelled)
			expect(v_u_177).to.equal(true)
			expect(false).to.equal(false)
		end)
		it("should cancel returned promise if cancelled", function()
			-- upvalues: (ref) v_u_1
			local v_u_180 = v_u_1.new(function() end)
			v_u_1.resolve():finally(function()
				-- upvalues: (copy) v_u_180
				return v_u_180
			end):cancel()
			expect(v_u_180:getStatus()).to.equal(v_u_1.Status.Cancelled)
		end)
	end)
	describe("Promise.all", function()
		-- upvalues: (copy) v_u_1, (copy) v_u_7
		it("should error if given something other than a table", function()
			-- upvalues: (ref) v_u_1
			expect(function()
				-- upvalues: (ref) v_u_1
				v_u_1.all(1)
			end).to.throw()
		end)
		it("should resolve instantly with an empty table if given no promises", function()
			-- upvalues: (ref) v_u_1
			local v181 = v_u_1.all({})
			local v182, v183 = v181:_unwrap()
			expect(v182).to.equal(true)
			expect(v181:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(v183).to.be.a("table")
			expect(next(v183)).to.equal(nil)
		end)
		it("should error if given non-promise values", function()
			-- upvalues: (ref) v_u_1
			expect(function()
				-- upvalues: (ref) v_u_1
				v_u_1.all({
					{},
					{},
					{}
				})
			end).to.throw()
		end)
		it("should wait for all promises to be resolved and return their values", function()
			-- upvalues: (ref) v_u_7, (ref) v_u_1
			local v184, v_u_185 = v_u_7(1, "A string", nil, false)
			local v_u_186 = {}
			local v187 = {}
			for v_u_188 = 1, v184 do
				v187[v_u_188] = v_u_1.new(function(p189)
					-- upvalues: (copy) v_u_186, (copy) v_u_188, (copy) v_u_185
					v_u_186[v_u_188] = { p189, v_u_185[v_u_188] }
				end)
			end
			local v190 = v_u_1.all(v187)
			for _, v191 in ipairs(v_u_186) do
				expect(v190:getStatus()).to.equal(v_u_1.Status.Started)
				v191[1](v191[2])
			end
			local v192, v193 = v_u_7(v190:_unwrap())
			local v194, v195 = unpack(v193, 1, v192)
			expect(v192).to.equal(2)
			expect(v194).to.equal(true)
			expect(v195).to.be.a("table")
			expect(#v195).to.equal(#v187)
			for v196 = 1, v184 do
				expect(v195[v196]).to.equal(v_u_185[v196])
			end
		end)
		it("should reject if any individual promise rejected", function()
			-- upvalues: (ref) v_u_1, (ref) v_u_7
			local v_u_197 = nil
			local v_u_198 = nil
			local v200 = v_u_1.new(function(_, p199)
				-- upvalues: (ref) v_u_197
				v_u_197 = p199
			end)
			local v202 = v_u_1.new(function(p201)
				-- upvalues: (ref) v_u_198
				v_u_198 = p201
			end)
			local v203 = v_u_1.all({ v200, v202 })
			expect(v203:getStatus()).to.equal(v_u_1.Status.Started)
			v_u_197("baz", "qux")
			v_u_198("foo", "bar")
			local v204, v205 = v_u_7(v203:_unwrap())
			local v206, v207, v208 = unpack(v205, 1, v204)
			expect(v204).to.equal(3)
			expect(v206).to.equal(false)
			expect(v207).to.equal("baz")
			expect(v208).to.equal("qux")
			expect(v202:getStatus()).to.equal(v_u_1.Status.Cancelled)
		end)
		it("should not resolve if resolved after rejecting", function()
			-- upvalues: (ref) v_u_1, (ref) v_u_7
			local v_u_209 = nil
			local v_u_210 = nil
			local v213 = { v_u_1.new(function(_, p211)
					-- upvalues: (ref) v_u_209
					v_u_209 = p211
				end), (v_u_1.new(function(p212)
					-- upvalues: (ref) v_u_210
					v_u_210 = p212
				end)) }
			local v214 = v_u_1.all(v213)
			expect(v214:getStatus()).to.equal(v_u_1.Status.Started)
			v_u_209("baz", "qux")
			v_u_210("foo", "bar")
			local v215, v216 = v_u_7(v214:_unwrap())
			local v217, v218, v219 = unpack(v216, 1, v215)
			expect(v215).to.equal(3)
			expect(v217).to.equal(false)
			expect(v218).to.equal("baz")
			expect(v219).to.equal("qux")
		end)
		it("should only reject once", function()
			-- upvalues: (ref) v_u_1, (ref) v_u_7
			local v_u_220 = nil
			local v_u_221 = nil
			local v224 = { v_u_1.new(function(_, p222)
					-- upvalues: (ref) v_u_220
					v_u_220 = p222
				end), (v_u_1.new(function(_, p223)
					-- upvalues: (ref) v_u_221
					v_u_221 = p223
				end)) }
			local v225 = v_u_1.all(v224)
			expect(v225:getStatus()).to.equal(v_u_1.Status.Started)
			v_u_220("foo", "bar")
			expect(v225:getStatus()).to.equal(v_u_1.Status.Rejected)
			v_u_221("baz", "qux")
			local v226, v227 = v_u_7(v225:_unwrap())
			local v228, v229, v230 = unpack(v227, 1, v226)
			expect(v226).to.equal(3)
			expect(v228).to.equal(false)
			expect(v229).to.equal("foo")
			expect(v230).to.equal("bar")
		end)
		it("should error if a non-array table is passed in", function()
			-- upvalues: (ref) v_u_1
			local v231, v232 = pcall(function()
				-- upvalues: (ref) v_u_1
				v_u_1.all(v_u_1.new(function() end))
			end)
			expect(v231).to.be.ok()
			expect(v232:find("Non%-promise")).to.be.ok()
		end)
		it("should cancel pending promises if one rejects", function()
			-- upvalues: (ref) v_u_1
			local v233 = v_u_1.new(function() end)
			expect(v_u_1.all({ v_u_1.resolve(), v_u_1.reject(), v233 }):getStatus()).to.equal(v_u_1.Status.Rejected)
			expect(v233:getStatus()).to.equal(v_u_1.Status.Cancelled)
		end)
		it("should cancel promises if it is cancelled", function()
			-- upvalues: (ref) v_u_1
			local v234 = v_u_1.new(function() end)
			v234:andThen(function() end)
			local v235 = { v_u_1.new(function() end), v_u_1.new(function() end), v234 }
			v_u_1.all(v235):cancel()
			expect(v235[1]:getStatus()).to.equal(v_u_1.Status.Cancelled)
			expect(v235[2]:getStatus()).to.equal(v_u_1.Status.Cancelled)
			expect(v235[3]:getStatus()).to.equal(v_u_1.Status.Started)
		end)
	end)
	describe("Promise.fold", function()
		-- upvalues: (copy) v_u_1, (ref) v_u_6
		it("should return the initial value in a promise when the list is empty", function()
			-- upvalues: (ref) v_u_1
			local v236 = {}
			local v237 = v_u_1.fold({}, function()
				error("should not be called")
			end, v236)
			expect(v_u_1.is(v237)).to.equal(true)
			expect(v237:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(v237:expect()).to.equal(v236)
		end)
		it("should accept promises in the list", function()
			-- upvalues: (ref) v_u_1
			local v_u_238 = nil
			local v242 = v_u_1.fold({ v_u_1.new(function(p239)
					-- upvalues: (ref) v_u_238
					v_u_238 = p239
				end), 2, 3 }, function(p240, p241)
				return p240 + p241
			end, 0)
			v_u_238(1)
			expect(v_u_1.is(v242)).to.equal(true)
			expect(v242:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(v242:expect()).to.equal(6)
		end)
		it("should always return a promise even if the list or reducer don\'t use them", function()
			-- upvalues: (ref) v_u_1, (ref) v_u_6
			local v246 = v_u_1.fold({ 1, 2, 3 }, function(p243, p244, p245)
				-- upvalues: (ref) v_u_1
				if p245 == 2 then
					return v_u_1.delay(1):andThenReturn(p243 + p244)
				else
					return p243 + p244
				end
			end, 0)
			expect(v_u_1.is(v246)).to.equal(true)
			expect(v246:getStatus()).to.equal(v_u_1.Status.Started)
			v_u_6(2)
			expect(v246:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(v246:expect()).to.equal(6)
		end)
		it("should return the first rejected promise", function()
			-- upvalues: (ref) v_u_1
			local v250 = v_u_1.fold({ 1, 2, 3 }, function(p247, p248, p249)
				-- upvalues: (ref) v_u_1
				if p249 == 2 then
					return v_u_1.reject("foo")
				else
					return p247 + p248
				end
			end, 0)
			expect(v_u_1.is(v250)).to.equal(true)
			local v251, v252 = v250:awaitStatus()
			expect(v251).to.equal(v_u_1.Status.Rejected)
			expect(v252).to.equal("foo")
		end)
		it("should return the first canceled promise", function()
			-- upvalues: (ref) v_u_1
			local v_u_253 = nil
			local v257 = v_u_1.fold({ 1, 2, 3 }, function(p254, p255, p256)
				-- upvalues: (ref) v_u_253, (ref) v_u_1
				if p256 == 1 then
					return p254 + p255
				end
				if p256 == 2 then
					v_u_253 = v_u_1.delay(1):andThenReturn(p254 + p255)
					return v_u_253
				end
				error("this should not run if the promise is cancelled")
			end, 0)
			expect(v_u_1.is(v257)).to.equal(true)
			expect(v257:getStatus()).to.equal(v_u_1.Status.Started)
			v_u_253:cancel()
			expect(v257:getStatus()).to.equal(v_u_1.Status.Cancelled)
		end)
	end)
	describe("Promise.race", function()
		-- upvalues: (copy) v_u_1
		it("should resolve with the first settled value", function()
			-- upvalues: (ref) v_u_1
			local v259 = v_u_1.race({ v_u_1.resolve(1), v_u_1.resolve(2) }):andThen(function(p258)
				expect(p258).to.equal(1)
			end)
			expect(v259:getStatus()).to.equal(v_u_1.Status.Resolved)
		end)
		it("should cancel other promises", function()
			-- upvalues: (ref) v_u_1
			local v260 = v_u_1.new(function() end)
			v260:andThen(function() end)
			local v262 = { v260, v_u_1.new(function() end), v_u_1.new(function(p261)
					p261(2)
				end) }
			local v263 = v_u_1.race(v262)
			expect(v263:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(v263._values[1]).to.equal(2)
			expect(v262[1]:getStatus()).to.equal(v_u_1.Status.Started)
			expect(v262[2]:getStatus()).to.equal(v_u_1.Status.Cancelled)
			expect(v262[3]:getStatus()).to.equal(v_u_1.Status.Resolved)
			local v264 = v_u_1.new(function() end)
			expect(v_u_1.race({ v_u_1.reject(), v_u_1.resolve(), v264 }):getStatus()).to.equal(v_u_1.Status.Rejected)
			expect(v264:getStatus()).to.equal(v_u_1.Status.Cancelled)
		end)
		it("should error if a non-array table is passed in", function()
			-- upvalues: (ref) v_u_1
			local v265, v266 = pcall(function()
				-- upvalues: (ref) v_u_1
				v_u_1.race(v_u_1.new(function() end))
			end)
			expect(v265).to.be.ok()
			expect(v266:find("Non%-promise")).to.be.ok()
		end)
		it("should cancel promises if it is cancelled", function()
			-- upvalues: (ref) v_u_1
			local v267 = v_u_1.new(function() end)
			v267:andThen(function() end)
			local v268 = { v_u_1.new(function() end), v_u_1.new(function() end), v267 }
			v_u_1.race(v268):cancel()
			expect(v268[1]:getStatus()).to.equal(v_u_1.Status.Cancelled)
			expect(v268[2]:getStatus()).to.equal(v_u_1.Status.Cancelled)
			expect(v268[3]:getStatus()).to.equal(v_u_1.Status.Started)
		end)
	end)
	describe("Promise.promisify", function()
		-- upvalues: (copy) v_u_1
		it("should wrap functions", function()
			-- upvalues: (ref) v_u_1
			local v270 = v_u_1.promisify(function(p269)
				return p269 + 1
			end)(1)
			local v271, v272 = v270:_unwrap()
			expect(v271).to.equal(true)
			expect(v270:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(v272).to.equal(2)
		end)
		it("should catch errors after a yield", function()
			-- upvalues: (ref) v_u_1
			local v_u_273 = Instance.new("BindableEvent")
			local v274 = v_u_1.promisify(function()
				-- upvalues: (copy) v_u_273
				v_u_273.Event:Wait()
				error("errortext")
			end)()
			expect(v274:getStatus()).to.equal(v_u_1.Status.Started)
			v_u_273:Fire()
			expect(v274:getStatus()).to.equal(v_u_1.Status.Rejected)
			local v275 = expect
			local v276 = v274._values[1]
			v275(tostring(v276):find("errortext")).to.be.ok()
		end)
	end)
	describe("Promise.tap", function()
		-- upvalues: (copy) v_u_1
		it("should thread through values", function()
			-- upvalues: (ref) v_u_1
			local v_u_277 = nil
			local v_u_278 = nil
			v_u_1.resolve(1):andThen(function(p279)
				return p279 + 1
			end):tap(function(p280)
				-- upvalues: (ref) v_u_277
				v_u_277 = p280
				return p280 + 1
			end):andThen(function(p281)
				-- upvalues: (ref) v_u_278
				v_u_278 = p281
			end)
			expect(v_u_277).to.equal(2)
			expect(v_u_278).to.equal(2)
		end)
		it("should chain onto promises", function()
			-- upvalues: (ref) v_u_1
			local v_u_282 = nil
			local v_u_283 = nil
			local v286 = v_u_1.resolve(1):tap(function()
				-- upvalues: (ref) v_u_1, (ref) v_u_282
				return v_u_1.new(function(p284)
					-- upvalues: (ref) v_u_282
					v_u_282 = p284
				end)
			end):andThen(function(p285)
				-- upvalues: (ref) v_u_283
				v_u_283 = p285
			end)
			expect(v286:getStatus()).to.equal(v_u_1.Status.Started)
			expect(v_u_283).to.never.be.ok()
			v_u_282(1)
			expect(v286:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(v_u_283).to.equal(1)
		end)
	end)
	describe("Promise.try", function()
		-- upvalues: (copy) v_u_1
		it("should catch synchronous errors", function()
			-- upvalues: (ref) v_u_1
			local v_u_287 = nil
			v_u_1.try(function()
				error("errortext")
			end):catch(function(p288)
				-- upvalues: (ref) v_u_287
				v_u_287 = tostring(p288)
			end)
			expect(v_u_287:find("errortext")).to.be.ok()
		end)
		it("should reject with error objects", function()
			-- upvalues: (ref) v_u_1
			local v_u_289 = {}
			local v290, v291 = v_u_1.try(function()
				-- upvalues: (copy) v_u_289
				error(v_u_289)
			end):_unwrap()
			expect(v290).to.equal(false)
			expect(v291).to.equal(v_u_289)
		end)
		it("should catch asynchronous errors", function()
			-- upvalues: (ref) v_u_1
			local v_u_292 = Instance.new("BindableEvent")
			local v293 = v_u_1.try(function()
				-- upvalues: (copy) v_u_292
				v_u_292.Event:Wait()
				error("errortext")
			end)
			expect(v293:getStatus()).to.equal(v_u_1.Status.Started)
			v_u_292:Fire()
			expect(v293:getStatus()).to.equal(v_u_1.Status.Rejected)
			local v294 = expect
			local v295 = v293._values[1]
			v294(tostring(v295):find("errortext")).to.be.ok()
		end)
	end)
	describe("Promise:andThenReturn", function()
		-- upvalues: (copy) v_u_1
		it("should return the given values", function()
			-- upvalues: (ref) v_u_1
			local v_u_296 = nil
			local v_u_297 = nil
			v_u_1.resolve():andThenReturn(1, 2):andThen(function(p298, p299)
				-- upvalues: (ref) v_u_296, (ref) v_u_297
				v_u_296 = p298
				v_u_297 = p299
			end)
			expect(v_u_296).to.equal(1)
			expect(v_u_297).to.equal(2)
		end)
	end)
	describe("Promise:andThenCall", function()
		-- upvalues: (copy) v_u_1
		it("should call the given function with arguments", function()
			-- upvalues: (ref) v_u_1
			local v_u_300 = nil
			local v_u_301 = nil
			v_u_1.resolve():andThenCall(function(p302, p303)
				-- upvalues: (ref) v_u_300, (ref) v_u_301
				v_u_300 = p302
				v_u_301 = p303
			end, 3, 4)
			expect(v_u_300).to.equal(3)
			expect(v_u_301).to.equal(4)
		end)
	end)
	describe("Promise.some", function()
		-- upvalues: (copy) v_u_1
		it("should resolve once the goal is reached", function()
			-- upvalues: (ref) v_u_1
			local v304 = v_u_1.some({ v_u_1.resolve(1), v_u_1.reject(), v_u_1.resolve(2) }, 2)
			expect(v304:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(v304._values[1][1]).to.equal(1)
			expect(v304._values[1][2]).to.equal(2)
		end)
		it("should error if the goal can\'t be reached", function()
			-- upvalues: (ref) v_u_1
			expect(v_u_1.some({ v_u_1.resolve(), v_u_1.reject() }, 2):getStatus()).to.equal(v_u_1.Status.Rejected)
			local v_u_305 = nil
			local v307 = v_u_1.some({ v_u_1.resolve(), v_u_1.new(function(_, p306)
					-- upvalues: (ref) v_u_305
					v_u_305 = p306
				end) }, 2)
			expect(v307:getStatus()).to.equal(v_u_1.Status.Started)
			v_u_305("foo")
			expect(v307:getStatus()).to.equal(v_u_1.Status.Rejected)
			expect(v307._values[1]).to.equal("foo")
		end)
		it("should cancel pending Promises once the goal is reached", function()
			-- upvalues: (ref) v_u_1
			local v_u_308 = nil
			local v309 = v_u_1.new(function() end)
			local v311 = v_u_1.new(function(p310)
				-- upvalues: (ref) v_u_308
				v_u_308 = p310
			end)
			local v312 = v_u_1.some({ v309, v311, v_u_1.resolve() }, 2)
			expect(v312:getStatus()).to.equal(v_u_1.Status.Started)
			expect(v309:getStatus()).to.equal(v_u_1.Status.Started)
			expect(v311:getStatus()).to.equal(v_u_1.Status.Started)
			v_u_308()
			expect(v312:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(v309:getStatus()).to.equal(v_u_1.Status.Cancelled)
			expect(v311:getStatus()).to.equal(v_u_1.Status.Resolved)
		end)
		it("should error if passed a non-number", function()
			-- upvalues: (ref) v_u_1
			expect(function()
				-- upvalues: (ref) v_u_1
				v_u_1.some({}, "non-number")
			end).to.throw()
		end)
		it("should return an empty array if amount is 0", function()
			-- upvalues: (ref) v_u_1
			local v313 = v_u_1.some({ v_u_1.resolve(2) }, 0)
			expect(v313:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(#v313._values[1]).to.equal(0)
		end)
		it("should not return extra values", function()
			-- upvalues: (ref) v_u_1
			local v314 = v_u_1.some({
				v_u_1.resolve(1),
				v_u_1.resolve(2),
				v_u_1.resolve(3),
				v_u_1.resolve(4)
			}, 2)
			expect(v314:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(#v314._values[1]).to.equal(2)
			expect(v314._values[1][1]).to.equal(1)
			expect(v314._values[1][2]).to.equal(2)
		end)
		it("should cancel promises if it is cancelled", function()
			-- upvalues: (ref) v_u_1
			local v315 = v_u_1.new(function() end)
			v315:andThen(function() end)
			local v316 = { v_u_1.new(function() end), v_u_1.new(function() end), v315 }
			v_u_1.some(v316, 3):cancel()
			expect(v316[1]:getStatus()).to.equal(v_u_1.Status.Cancelled)
			expect(v316[2]:getStatus()).to.equal(v_u_1.Status.Cancelled)
			expect(v316[3]:getStatus()).to.equal(v_u_1.Status.Started)
		end)
		describe("Promise.any", function()
			-- upvalues: (ref) v_u_1
			it("should return the value directly", function()
				-- upvalues: (ref) v_u_1
				local v317 = v_u_1.any({ v_u_1.reject(), v_u_1.reject(), v_u_1.resolve(1) })
				expect(v317:getStatus()).to.equal(v_u_1.Status.Resolved)
				expect(v317._values[1]).to.equal(1)
			end)
			it("should error if all are rejected", function()
				-- upvalues: (ref) v_u_1
				expect(v_u_1.any({ v_u_1.reject(), v_u_1.reject(), v_u_1.reject() }):getStatus()).to.equal(v_u_1.Status.Rejected)
			end)
		end)
	end)
	describe("Promise.allSettled", function()
		-- upvalues: (copy) v_u_1
		it("should resolve with an array of PromiseStatuses", function()
			-- upvalues: (ref) v_u_1
			local v_u_318 = nil
			local v320 = v_u_1.allSettled({
				v_u_1.resolve(),
				v_u_1.reject(),
				v_u_1.resolve(),
				v_u_1.new(function(_, p319)
					-- upvalues: (ref) v_u_318
					v_u_318 = p319
				end)
			})
			expect(v320:getStatus()).to.equal(v_u_1.Status.Started)
			v_u_318()
			expect(v320:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(v320._values[1][1]).to.equal(v_u_1.Status.Resolved)
			expect(v320._values[1][2]).to.equal(v_u_1.Status.Rejected)
			expect(v320._values[1][3]).to.equal(v_u_1.Status.Resolved)
			expect(v320._values[1][4]).to.equal(v_u_1.Status.Rejected)
		end)
		it("should cancel promises if it is cancelled", function()
			-- upvalues: (ref) v_u_1
			local v321 = v_u_1.new(function() end)
			v321:andThen(function() end)
			local v322 = { v_u_1.new(function() end), v_u_1.new(function() end), v321 }
			v_u_1.allSettled(v322):cancel()
			expect(v322[1]:getStatus()).to.equal(v_u_1.Status.Cancelled)
			expect(v322[2]:getStatus()).to.equal(v_u_1.Status.Cancelled)
			expect(v322[3]:getStatus()).to.equal(v_u_1.Status.Started)
		end)
	end)
	describe("Promise:await", function()
		-- upvalues: (copy) v_u_1, (ref) v_u_6
		it("should return the correct values", function()
			-- upvalues: (ref) v_u_1
			local v323, v324, v325, v326, v327 = v_u_1.resolve(5, 6, nil, 7):await()
			expect(v323).to.equal(true)
			expect(v324).to.equal(5)
			expect(v325).to.equal(6)
			expect(v326).to.equal(nil)
			expect(v327).to.equal(7)
		end)
		it("should work if yielding is needed", function()
			-- upvalues: (ref) v_u_1, (ref) v_u_6
			local v_u_328 = false
			task.spawn(function()
				-- upvalues: (ref) v_u_1, (ref) v_u_328
				local _, v329 = v_u_1.delay(1):await()
				expect((type(v329))).to.equal("number")
				v_u_328 = true
			end)
			v_u_6(2)
			expect(v_u_328).to.equal(true)
		end)
	end)
	describe("Promise:expect", function()
		-- upvalues: (copy) v_u_1
		it("should throw the correct values", function()
			-- upvalues: (ref) v_u_1
			local v330 = {}
			local v_u_331 = v_u_1.reject(v330)
			local v332, v333 = pcall(function()
				-- upvalues: (copy) v_u_331
				v_u_331:expect()
			end)
			expect(v332).to.equal(false)
			expect(v333).to.equal(v330)
		end)
	end)
	describe("Promise:now", function()
		-- upvalues: (copy) v_u_1
		it("should resolve if the Promise is resolved", function()
			-- upvalues: (ref) v_u_1
			local v334, v335 = v_u_1.resolve("foo"):now():_unwrap()
			expect(v334).to.equal(true)
			expect(v335).to.equal("foo")
		end)
		it("should reject if the Promise is not resolved", function()
			-- upvalues: (ref) v_u_1
			local v336, v337 = v_u_1.new(function() end):now():_unwrap()
			expect(v336).to.equal(false)
			expect(v_u_1.Error.isKind(v337, "NotResolvedInTime")).to.equal(true)
		end)
		it("should reject with a custom rejection value", function()
			-- upvalues: (ref) v_u_1
			local v338, v339 = v_u_1.new(function() end):now("foo"):_unwrap()
			expect(v338).to.equal(false)
			expect(v339).to.equal("foo")
		end)
	end)
	describe("Promise.each", function()
		-- upvalues: (copy) v_u_1
		it("should iterate", function()
			-- upvalues: (ref) v_u_1
			local v340, v341 = v_u_1.each({
				"foo",
				"bar",
				"baz",
				"qux"
			}, function(...)
				return { ... }
			end):_unwrap()
			expect(v340).to.equal(true)
			expect(v341[1][1]).to.equal("foo")
			expect(v341[1][2]).to.equal(1)
			expect(v341[2][1]).to.equal("bar")
			expect(v341[2][2]).to.equal(2)
			expect(v341[3][1]).to.equal("baz")
			expect(v341[3][2]).to.equal(3)
			expect(v341[4][1]).to.equal("qux")
			expect(v341[4][2]).to.equal(4)
		end)
		it("should iterate serially", function()
			-- upvalues: (ref) v_u_1
			local v_u_342 = {}
			local v_u_343 = {}
			local v349 = v_u_1.each({ "foo", "bar", "baz" }, function(p_u_344, p345)
				-- upvalues: (copy) v_u_343, (ref) v_u_1, (copy) v_u_342
				v_u_343[p345] = (v_u_343[p345] or 0) + 1
				return v_u_1.new(function(p_u_346)
					-- upvalues: (ref) v_u_342, (copy) p_u_344
					local v347 = v_u_342
					local function v348()
						-- upvalues: (copy) p_u_346, (ref) p_u_344
						p_u_346(p_u_344:upper())
					end
					table.insert(v347, v348)
				end)
			end)
			expect(v349:getStatus()).to.equal(v_u_1.Status.Started)
			expect(#v_u_342).to.equal(1)
			expect(v_u_343[1]).to.equal(1)
			expect(v_u_343[2]).to.never.be.ok()
			table.remove(v_u_342, 1)()
			expect(v349:getStatus()).to.equal(v_u_1.Status.Started)
			expect(#v_u_342).to.equal(1)
			expect(v_u_343[1]).to.equal(1)
			expect(v_u_343[2]).to.equal(1)
			expect(v_u_343[3]).to.never.be.ok()
			table.remove(v_u_342, 1)()
			expect(v349:getStatus()).to.equal(v_u_1.Status.Started)
			expect(v_u_343[1]).to.equal(1)
			expect(v_u_343[2]).to.equal(1)
			expect(v_u_343[3]).to.equal(1)
			table.remove(v_u_342, 1)()
			expect(v349:getStatus()).to.equal(v_u_1.Status.Resolved)
			local v350 = expect
			local v351 = v349._values[1]
			v350((type(v351))).to.equal("table")
			local v352 = expect
			local v353 = v349._values[2]
			v352((type(v353))).to.equal("nil")
			local v354 = v349._values[1]
			expect(v354[1]).to.equal("FOO")
			expect(v354[2]).to.equal("BAR")
			expect(v354[3]).to.equal("BAZ")
		end)
		it("should reject with the value if the predicate promise rejects", function()
			-- upvalues: (ref) v_u_1
			local v355 = v_u_1.each({ 1, 2, 3 }, function()
				-- upvalues: (ref) v_u_1
				return v_u_1.reject("foobar")
			end)
			expect(v355:getStatus()).to.equal(v_u_1.Status.Rejected)
			expect(v355._values[1]).to.equal("foobar")
		end)
		it("should allow Promises to be in the list and wait when it gets to them", function()
			-- upvalues: (ref) v_u_1
			local v_u_356 = nil
			local v358 = { (v_u_1.new(function(p357)
					-- upvalues: (ref) v_u_356
					v_u_356 = p357
				end)) }
			local v360 = v_u_1.each(v358, function(p359)
				return p359 * 2
			end)
			expect(v360:getStatus()).to.equal(v_u_1.Status.Started)
			v_u_356(2)
			expect(v360:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(v360._values[1][1]).to.equal(4)
		end)
		it("should reject with the value if a Promise from the list rejects", function()
			-- upvalues: (ref) v_u_1
			local v_u_361 = false
			local v362 = v_u_1.each({ 1, 2, v_u_1.reject("foobar") }, function(_)
				-- upvalues: (ref) v_u_361
				v_u_361 = true
				return "never"
			end)
			expect(v362:getStatus()).to.equal(v_u_1.Status.Rejected)
			expect(v362._values[1]).to.equal("foobar")
			expect(v_u_361).to.equal(false)
		end)
		it("should reject immediately if there\'s a cancelled Promise in the list initially", function()
			-- upvalues: (ref) v_u_1
			local v363 = v_u_1.new(function() end)
			v363:cancel()
			local v_u_364 = false
			local v365 = v_u_1.each({ 1, 2, v363 }, function()
				-- upvalues: (ref) v_u_364
				v_u_364 = true
			end)
			expect(v365:getStatus()).to.equal(v_u_1.Status.Rejected)
			expect(v_u_364).to.equal(false)
			expect(v365._values[1].kind).to.equal(v_u_1.Error.Kind.AlreadyCancelled)
		end)
		it("should stop iteration if Promise.each is cancelled", function()
			-- upvalues: (ref) v_u_1
			local v_u_366 = {}
			local v368 = v_u_1.each({ "foo", "bar", "baz" }, function(_, p367)
				-- upvalues: (copy) v_u_366, (ref) v_u_1
				v_u_366[p367] = (v_u_366[p367] or 0) + 1
				return v_u_1.new(function() end)
			end)
			expect(v368:getStatus()).to.equal(v_u_1.Status.Started)
			expect(v_u_366[1]).to.equal(1)
			expect(v_u_366[2]).to.never.be.ok()
			v368:cancel()
			expect(v368:getStatus()).to.equal(v_u_1.Status.Cancelled)
			expect(v_u_366[1]).to.equal(1)
			expect(v_u_366[2]).to.never.be.ok()
		end)
		it("should cancel the Promise returned from the predicate if Promise.each is cancelled", function()
			-- upvalues: (ref) v_u_1
			local v_u_369 = nil
			v_u_1.each({ "foo", "bar", "baz" }, function(_, _)
				-- upvalues: (ref) v_u_369, (ref) v_u_1
				v_u_369 = v_u_1.new(function() end)
				return v_u_369
			end):cancel()
			expect(v_u_369:getStatus()).to.equal(v_u_1.Status.Cancelled)
		end)
		it("should cancel Promises in the list if Promise.each is cancelled", function()
			-- upvalues: (ref) v_u_1
			local v370 = v_u_1.new(function() end)
			v_u_1.each({ v370 }, function() end):cancel()
			expect(v370:getStatus()).to.equal(v_u_1.Status.Cancelled)
		end)
	end)
	describe("Promise.retry", function()
		-- upvalues: (copy) v_u_1
		it("should retry N times", function()
			-- upvalues: (ref) v_u_1
			local v_u_371 = 0
			local v373 = v_u_1.retry(function(p372)
				-- upvalues: (ref) v_u_371, (ref) v_u_1
				expect(p372).to.equal("foo")
				v_u_371 = v_u_371 + 1
				if v_u_371 == 5 then
					return v_u_1.resolve("ok")
				else
					return v_u_1.reject("fail")
				end
			end, 5, "foo")
			expect(v373:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(v373._values[1]).to.equal("ok")
		end)
		it("should reject if threshold is exceeded", function()
			-- upvalues: (ref) v_u_1
			local v374 = v_u_1.retry(function()
				-- upvalues: (ref) v_u_1
				return v_u_1.reject("fail")
			end, 5)
			expect(v374:getStatus()).to.equal(v_u_1.Status.Rejected)
			expect(v374._values[1]).to.equal("fail")
		end)
	end)
	describe("Promise.retryWithDelay", function()
		-- upvalues: (copy) v_u_1, (ref) v_u_6
		it("should retry after a delay", function()
			-- upvalues: (ref) v_u_1, (ref) v_u_6
			local v_u_375 = 0
			local v377 = v_u_1.retryWithDelay(function(p376)
				-- upvalues: (ref) v_u_375, (ref) v_u_1
				expect(p376).to.equal("foo")
				v_u_375 = v_u_375 + 1
				if v_u_375 == 3 then
					return v_u_1.resolve("ok")
				else
					return v_u_1.reject("fail")
				end
			end, 3, 10, "foo")
			expect(v_u_375).to.equal(1)
			v_u_6(11)
			expect(v_u_375).to.equal(2)
			v_u_6(11)
			expect(v_u_375).to.equal(3)
			expect(v377:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(v377._values[1]).to.equal("ok")
		end)
	end)
	describe("Promise.fromEvent", function()
		-- upvalues: (copy) v_u_1
		it("should convert a Promise into an event", function()
			-- upvalues: (ref) v_u_1
			local v378 = Instance.new("BindableEvent")
			local v379 = v_u_1.fromEvent(v378.Event)
			expect(v379:getStatus()).to.equal(v_u_1.Status.Started)
			v378:Fire("foo")
			expect(v379:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(v379._values[1]).to.equal("foo")
		end)
		it("should convert a Promise into an event with the predicate", function()
			-- upvalues: (ref) v_u_1
			local v380 = Instance.new("BindableEvent")
			local v382 = v_u_1.fromEvent(v380.Event, function(p381)
				return p381 == "foo"
			end)
			expect(v382:getStatus()).to.equal(v_u_1.Status.Started)
			v380:Fire("bar")
			expect(v382:getStatus()).to.equal(v_u_1.Status.Started)
			v380:Fire("foo")
			expect(v382:getStatus()).to.equal(v_u_1.Status.Resolved)
			expect(v382._values[1]).to.equal("foo")
		end)
	end)
	describe("Promise.is", function()
		-- upvalues: (copy) v_u_1
		it("should work with current version", function()
			-- upvalues: (ref) v_u_1
			local v383 = v_u_1.resolve(1)
			expect(v_u_1.is(v383)).to.equal(true)
		end)
		it("should work with any object with an andThen", function()
			-- upvalues: (ref) v_u_1
			expect(v_u_1.is({
				["andThen"] = function()
					return 1
				end
			})).to.equal(true)
		end)
		it("should work with older promises", function()
			-- upvalues: (ref) v_u_1
			local v384 = {
				["prototype"] = {}
			}
			v384.__index = v384.prototype
			function v384.prototype.andThen(_) end
			local v385 = setmetatable({}, v384)
			expect(v_u_1.is(v385)).to.equal(true)
		end)
	end)
end