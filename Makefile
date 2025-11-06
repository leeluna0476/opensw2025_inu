PROJ_DIR=$(shell pwd)
SRCS_DIR=$(PROJ_DIR)/src
OBJS_DIR=$(PROJ_DIR)/obj
BINS_DIR=$(PROJ_DIR)/bin

SRCS=$(wildcard $(SRCS_DIR)/*.c)
OBJS=$(subst $(SRCS_DIR),$(OBJS_DIR),$(SRCS:.c=.o))

CC=gcc

$(BINS_DIR)/myapp: $(OBJS)
	$(CC) $^ -o $@

$(OBJS_DIR)/%.o: $(SRCS_DIR)/%.c
	$(CC) -c $< -I./include -o $@
