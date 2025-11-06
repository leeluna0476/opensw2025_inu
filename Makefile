PROJ_DIR=$(shell pwd)
SRCS_DIR=$(PROJ_DIR)/src
OBJS_DIR=$(PROJ_DIR)/obj
BINS_DIR=$(PROJ_DIR)/bin

SRCS=$(wildcard $(SRCS_DIR)/*.c)
OBJS=$(subst $(SRCS_DIR),$(OBJS_DIR),$(SRCS:.c=.o))

CC=gcc

NAME=$(BINS_DIR)/myapp

.PHONY: all clean

all: $(OBJS_DIR) $(BINS_DIR) $(BINS_DIR)/myapp

$(BINS_DIR)/myapp: $(OBJS)
	$(CC) $^ -o $@

$(OBJS_DIR)/%.o: $(SRCS_DIR)/%.c
	$(CC) -c $< -I./include -o $@

$(BINS_DIR):
	mkdir -p $(BINS_DIR)

$(OBJS_DIR):
	mkdir -p $(OBJS_DIR)

clean:
	$(RM) $(OBJS) $(NAME)
