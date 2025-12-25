#!/bin/bash

# Script to update /etc/hosts for local Kubernetes testing
# Usage: sudo ./scripts/update-hosts.sh

HOSTS_FILE="/etc/hosts"
HOSTS_ENTRIES=(
    "127.0.0.1 auth.local"
    "127.0.0.1 product.local"
)

echo "Updating /etc/hosts for Kubernetes microservices..."

# Check if entries already exist
for entry in "${HOSTS_ENTRIES[@]}"; do
    if grep -q "$entry" "$HOSTS_FILE"; then
        echo "✓ Entry already exists: $entry"
    else
        echo "$entry" >> "$HOSTS_FILE"
        echo "✓ Added: $entry"
    fi
done

echo ""
echo "Current entries in /etc/hosts:"
grep -E "auth.local|product.local" "$HOSTS_FILE" || echo "No entries found"

echo ""
echo "✅ Done! You can now access:"
echo "   - http://auth.local"
echo "   - http://product.local"

