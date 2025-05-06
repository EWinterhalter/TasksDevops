package main

import (
	"io"
	"net/http"
	"testing"
	"time"
)

func TestServerResponse(t *testing.T) {
	go main()

	time.Sleep(500 * time.Millisecond)

	resp, err := http.Get("http://localhost:8080")
	if err != nil {
		t.Fatalf("http error: %v", err)
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		t.Fatalf("read error: %v", err)
	}

	expected := "Hello"
	if string(body) != expected {
		t.Errorf("expected: %q, received: %q", expected, string(body))
	}
}
