import requests
import time

# API endpoint
base_url = "http://localhost:8000"

def index_local_pdfs():
    """Trigger indexing of local PDF files"""
    
    print("=" * 60)
    print("Starting Local PDF Indexing")
    print("=" * 60)
    
    # Optional: specify custom directory and batch size
    index_data = {
        "pdf_directory": "./Dataset",  # Change this if your PDFs are elsewhere
        "batch_size": 50  # Adjust based on your system memory
    }
    
    print(f"\n📁 PDF Directory: {index_data['pdf_directory']}")
    print(f"📦 Batch Size: {index_data['batch_size']} pages at a time")
    print("\n⏳ This may take a while for large textbooks (1.5GB)...")
    print("    The server will show detailed progress in its console.\n")
    
    try:
        start_time = time.time()
        
        response = requests.post(
            f"{base_url}/index",
            json=index_data,
            timeout=7200  # 2 hour timeout for large files
        )
        
        elapsed = time.time() - start_time
        
        if response.status_code == 200:
            result = response.json()
            print("\n✅ Indexing Complete!")
            print("-" * 60)
            print(f"Message: {result.get('message', 'N/A')}")
            print(f"Total Chunks Created: {result.get('total_chunks', 'N/A')}")
            print(f"Vectorstore Chunks: {result.get('vectorstore_chunks', 'N/A')}")
            print(f"Persist Directory: {result.get('persist_directory', 'N/A')}")
            print(f"Time Taken: {elapsed/60:.2f} minutes")
            print("-" * 60)
        else:
            print(f"\n❌ Indexing Failed!")
            print(f"Status Code: {response.status_code}")
            print(f"Response: {response.text}")
    
    except requests.exceptions.ConnectionError:
        print("\n❌ Connection Error!")
        print("Make sure the RAG server is running at http://localhost:8000")
        print("Start it with: python rag.py")
    
    except requests.exceptions.Timeout:
        print("\n❌ Request Timeout!")
        print("Indexing is taking too long. Check the server console for progress.")
    
    except Exception as e:
        print(f"\n❌ Error: {str(e)}")
    
    print("\n" + "=" * 60)


def check_health():
    """Check RAG system health and status"""
    print("\n🏥 Checking System Health...")
    print("-" * 60)
    
    try:
        response = requests.get(f"{base_url}/health", timeout=10)
        
        if response.status_code == 200:
            result = response.json()
            print("✅ System Status: Healthy")
            print(f"Documents Indexed: {result.get('documents_indexed', 'N/A')}")
            print(f"Vectorstore Ready: {result.get('vectorstore_initialized', False)}")
            print(f"QA Chain Ready: {result.get('qa_chain_initialized', False)}")
            print(f"Embedding Model: {result.get('embedding_model', 'N/A')}")
            print(f"LLM Model: {result.get('llm_model', 'N/A')}")
            print(f"PDF Directory: {result.get('pdf_directory', 'N/A')}")
            print("-" * 60)
            return True
        else:
            print(f"❌ Health Check Failed: {response.status_code}")
            return False
    
    except Exception as e:
        print(f"❌ Health Check Error: {str(e)}")
        return False


def get_stats():
    """Get indexing statistics"""
    print("\n📊 Getting Statistics...")
    print("-" * 60)
    
    try:
        response = requests.get(f"{base_url}/stats", timeout=10)
        
        if response.status_code == 200:
            result = response.json()
            
            if "error" in result:
                print(f"Error: {result['error']}")
            else:
                print(f"Total Chunks: {result.get('total_chunks', 'N/A')}")
                print(f"Persist Directory: {result.get('persist_directory', 'N/A')}")
                print(f"Collection Name: {result.get('collection_name', 'N/A')}")
            print("-" * 60)
    
    except Exception as e:
        print(f"❌ Stats Error: {str(e)}")


def test_query():
    """Test the RAG system with sample medical queries"""
    query_url = f"{base_url}/query"
    
    print("\n🔍 Testing RAG System with Medical Queries...")
    print("-" * 60)
    
    queries = [
        "What is the structure and function of the heart?",
        "Explain the digestive system.",
        "What are common dental procedures?"
    ]
    
    for i, question in enumerate(queries, 1):
        print(f"\nQuery {i}: {question}")
        
        query_data = {
            "question": question,
            "top_k": 3
        }
        
        try:
            response = requests.post(query_url, json=query_data, timeout=60)
            
            if response.status_code == 200:
                result = response.json()
                print(f"\nAnswer:\n{result['answer'][:300]}...")
                print(f"\nSources: {len(result['source_documents'])} document(s)")
                
                for j, source in enumerate(result['source_documents'][:2], 1):
                    print(f"  {j}. {source['source_file']} (Page {source.get('page', 'N/A')})")
            else:
                print(f"❌ Query Failed: {response.status_code}")
        
        except Exception as e:
            print(f"❌ Query Error: {str(e)}")
        
        print("-" * 60)


def main_menu():
    """Interactive menu for RAG operations"""
    while True:
        print("\n" + "=" * 60)
        print("RAG System - Local PDF Indexing")
        print("=" * 60)
        print("\n1. Check System Health")
        print("2. Index Local PDFs (./Dataset)")
        print("3. Get Statistics")
        print("4. Test with Sample Queries")
        print("5. Exit")
        
        choice = input("\nEnter your choice (1-5): ").strip()
        
        if choice == "1":
            check_health()
        elif choice == "2":
            index_local_pdfs()
        elif choice == "3":
            get_stats()
        elif choice == "4":
            test_query()
        elif choice == "5":
            print("\n👋 Goodbye!")
            break
        else:
            print("\n❌ Invalid choice. Please try again.")


if __name__ == "__main__":
    print("\n🚀 RAG System Client")
    print("Make sure the RAG server is running: python rag.py\n")
    
    # Check if server is running
    if check_health():
        main_menu()
    else:
        print("\n⚠️  Server is not responding. Please start it with: python rag.py")