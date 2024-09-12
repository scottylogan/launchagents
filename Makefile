AGENT_DIR=$(HOME)/Library/LaunchAgents

.PHONY: install

install:
	@mkdir -p $(AGENT_DIR)
	@for a in *.plist; do \
		echo Installing $$a; \
		launchctl unload $(AGENT_DIR)/$$a; \
		rm -f $(AGENT_DIR)/$$a; \
		cp $$a $(AGENT_DIR); \
		launchctl load $(AGENT_DIR)/$$a; \
	done

