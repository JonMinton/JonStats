#!/bin/bash
# Quick session logging helper
#
# Usage: ./scripts/log-session.sh [start|end|summary]

SESSION_LOG=".claude/session-tracker.md"
DATE=$(date +%Y-%m-%d)
DATETIME=$(date +"%Y-%m-%d %H:%M:%S")

case "$1" in
    start)
        echo ""
        echo "📊 Starting new Claude Code session: $DATETIME"
        echo ""
        echo "Current branch: $(git branch --show-current)"
        echo "Git status:"
        git status --short
        echo ""
        echo "Add your session goals to $SESSION_LOG"
        ;;

    end)
        echo ""
        echo "📊 Session Statistics ($DATE)"
        echo "================================"
        echo ""

        # Commits today
        COMMIT_COUNT=$(git log --since="midnight" --oneline | wc -l | tr -d ' ')
        echo "Commits today: $COMMIT_COUNT"

        if [ "$COMMIT_COUNT" -gt 0 ]; then
            echo ""
            echo "Commits:"
            git log --since="midnight" --oneline
            echo ""

            echo "Files changed:"
            git log --since="midnight" --name-only --pretty=format: | sort -u
            echo ""

            echo ""
            echo "Detailed stats:"
            git log --since="midnight" --stat --pretty=format:"%h %s" | head -50
        fi

        echo ""
        echo "Update $SESSION_LOG with session summary"
        ;;

    summary)
        echo ""
        echo "📊 Weekly Summary (last 7 days)"
        echo "================================"
        echo ""

        WEEK_COMMITS=$(git log --since="7 days ago" --oneline | wc -l | tr -d ' ')
        echo "Total commits: $WEEK_COMMITS"
        echo ""

        if [ "$WEEK_COMMITS" -gt 0 ]; then
            echo "Recent commits:"
            git log --since="7 days ago" --oneline
            echo ""

            echo "Files modified:"
            git log --since="7 days ago" --name-only --pretty=format: | sort -u
        fi
        ;;

    *)
        echo "Usage: $0 [start|end|summary]"
        echo ""
        echo "Commands:"
        echo "  start    - Begin a new session (shows current status)"
        echo "  end      - End session (shows what was accomplished)"
        echo "  summary  - Weekly summary of activity"
        echo ""
        echo "Session log location: $SESSION_LOG"
        exit 1
        ;;
esac

echo ""
