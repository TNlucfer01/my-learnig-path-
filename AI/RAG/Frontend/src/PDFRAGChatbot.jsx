import React, { useState, useRef, useEffect } from 'react';
import { Send, Settings, Loader2, CheckCircle2, XCircle } from 'lucide-react';

export default function PDFRAGChatbot() {
  const [messages, setMessages] = useState([]);
  const [input, setInput] = useState('');
  const [loading, setLoading] = useState(false);
  const [showSettings, setShowSettings] = useState(false);
  const [apiUrl, setApiUrl] = useState('http://localhost:5000');
  const [topK, setTopK] = useState(3);
  const [connected, setConnected] = useState(null);
  const messagesEndRef = useRef(null);

  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' });
  };

  useEffect(() => {
    scrollToBottom();
  }, [messages]);

  useEffect(() => {
    checkConnection();
  }, []);

  const checkConnection = async () => {
    try {
      const response = await fetch(`${apiUrl}/health`);
      const data = await response.json();
      setConnected(data.documents_loaded);
    } catch (err) {
      setConnected(null);
    }
  };

  const handleSubmit = async () => {
    if (!input.trim() || loading) return;

    const userMessage = { role: 'user', content: input };
    setMessages(prev => [...prev, userMessage]);
    setInput('');
    setLoading(true);

    try {
      const response = await fetch(`${apiUrl}/query`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          query: input.trim(),
          top_k: topK
        })
      });

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.error || 'Failed to fetch results');
      }

      const data = await response.json();
      const assistantMessage = {
        role: 'assistant',
        content: data.answer,
        contexts: data.contexts
      };
      setMessages(prev => [...prev, assistantMessage]);
    } catch (err) {
      const errorMessage = {
        role: 'error',
        content: err.message || 'An error occurred while processing your query'
      };
      setMessages(prev => [...prev, errorMessage]);
    } finally {
      setLoading(false);
    }
  };

  const handleKeyPress = (e) => {
    if (e.key === 'Enter' && !e.shiftKey) {
      e.preventDefault();
      handleSubmit();
    }
  };

  return (
    <div className="h-screen bg-[#0d1117] flex flex-col text-gray-100">
      {/* Header */}
      <div className="border-b border-gray-800 px-6 py-4 flex items-center justify-between">
        <div className="flex items-center gap-3">
          <div className="w-8 h-8 bg-gradient-to-br from-blue-500 to-purple-600 rounded-lg flex items-center justify-center">
            <span className="text-white font-bold text-sm">AI</span>
          </div>
          <div>
            <h1 className="text-lg font-semibold">Document Assistant</h1>
            {connected !== null && (
              <p className="text-xs text-gray-400">
                {connected} documents indexed
              </p>
            )}
          </div>
        </div>
        <button
          onClick={() => setShowSettings(!showSettings)}
          className="p-2 hover:bg-gray-800 rounded-lg transition-colors"
        >
          <Settings className="w-5 h-5 text-gray-400" />
        </button>
      </div>

      {/* Settings Panel */}
      {showSettings && (
        <div className="border-b border-gray-800 bg-[#161b22] px-6 py-4 space-y-3">
          <div>
            <label className="text-xs text-gray-400 mb-1 block">API Endpoint</label>
            <div className="flex gap-2">
              <input
                type="text"
                value={apiUrl}
                onChange={(e) => setApiUrl(e.target.value)}
                className="flex-1 bg-[#0d1117] border border-gray-700 rounded-lg px-3 py-2 text-sm focus:outline-none focus:border-blue-500"
              />
              <button
                onClick={checkConnection}
                className="px-4 py-2 bg-gray-800 hover:bg-gray-700 rounded-lg text-sm transition-colors"
              >
                Test
              </button>
            </div>
            {connected !== null ? (
              <div className="flex items-center gap-1 mt-1 text-xs text-green-400">
                <CheckCircle2 className="w-3 h-3" />
                Connected
              </div>
            ) : connected === null && (
              <div className="flex items-center gap-1 mt-1 text-xs text-red-400">
                <XCircle className="w-3 h-3" />
                Disconnected
              </div>
            )}
          </div>
          <div>
            <label className="text-xs text-gray-400 mb-1 block">Results per query</label>
            <input
              type="number"
              value={topK}
              onChange={(e) => setTopK(parseInt(e.target.value) || 1)}
              min="1"
              max="10"
              className="w-24 bg-[#0d1117] border border-gray-700 rounded-lg px-3 py-2 text-sm focus:outline-none focus:border-blue-500"
            />
          </div>
        </div>
      )}

      {/* Messages */}
      <div className="flex-1 overflow-y-auto px-6 py-6 space-y-6">
        {messages.length === 0 && (
          <div className="h-full flex items-center justify-center">
            <div className="text-center max-w-md">
              <div className="w-16 h-16 bg-gradient-to-br from-blue-500 to-purple-600 rounded-2xl flex items-center justify-center mx-auto mb-4">
                <span className="text-white font-bold text-2xl">AI</span>
              </div>
              <h2 className="text-xl font-semibold mb-2">Ask me anything</h2>
              <p className="text-gray-400 text-sm">
                I'll search through your documents to find relevant information
              </p>
            </div>
          </div>
        )}

        {messages.map((msg, idx) => (
          <div key={idx} className={`flex ${msg.role === 'user' ? 'justify-end' : 'justify-start'}`}>
            <div className={`max-w-3xl ${msg.role === 'user' ? 'w-auto' : 'w-full'}`}>
              {msg.role === 'user' && (
                <div className="bg-blue-600 text-white rounded-2xl px-4 py-3 inline-block">
                  {msg.content}
                </div>
              )}

              {msg.role === 'assistant' && (
                <div className="space-y-3">
                  <div className="bg-[#161b22] rounded-2xl px-4 py-3 border border-gray-800">
                    <p className="text-gray-100 leading-relaxed whitespace-pre-wrap text-sm">
                      {msg.content}
                    </p>
                  </div>

                  {msg.contexts && msg.contexts.length > 0 && (
                    <details className="group">
                      <summary className="text-xs text-gray-400 cursor-pointer hover:text-gray-300 select-none">
                        View {msg.contexts.length} source{msg.contexts.length > 1 ? 's' : ''}
                      </summary>
                      <div className="mt-2 space-y-2">
                        {msg.contexts.map((ctx, i) => (
                          <div key={i} className="bg-[#0d1117] border border-gray-800 rounded-lg px-3 py-2">
                            <div className="text-xs text-gray-500 mb-1">Source {i + 1}</div>
                            <p className="text-xs text-gray-400 leading-relaxed">
                              {ctx.length > 300 ? `${ctx.substring(0, 300)}...` : ctx}
                            </p>
                          </div>
                        ))}
                      </div>
                    </details>
                  )}
                </div>
              )}

              {msg.role === 'error' && (
                <div className="bg-red-900/20 border border-red-900/50 text-red-400 rounded-2xl px-4 py-3 text-sm">
                  {msg.content}
                </div>
              )}
            </div>
          </div>
        ))}

        {loading && (
          <div className="flex justify-start">
            <div className="bg-[#161b22] rounded-2xl px-4 py-3 border border-gray-800">
              <Loader2 className="w-5 h-5 text-gray-400 animate-spin" />
            </div>
          </div>
        )}

        <div ref={messagesEndRef} />
      </div>

      {/* Input */}
      <div className="border-t border-gray-800 px-6 py-4">
        <div className="max-w-4xl mx-auto flex gap-3 items-end">
          <textarea
            value={input}
            onChange={(e) => setInput(e.target.value)}
            onKeyPress={handleKeyPress}
            placeholder="Ask a question..."
            rows="1"
            className="flex-1 bg-[#161b22] border border-gray-700 rounded-xl px-4 py-3 focus:outline-none focus:border-blue-500 resize-none text-sm"
            style={{ minHeight: '44px', maxHeight: '120px' }}
          />
          <button
            onClick={handleSubmit}
            disabled={!input.trim() || loading}
            className="bg-blue-600 hover:bg-blue-700 disabled:bg-gray-800 disabled:cursor-not-allowed rounded-xl p-3 transition-colors"
          >
            <Send className="w-5 h-5" />
          </button>
        </div>
      </div>
    </div>
  );
}
