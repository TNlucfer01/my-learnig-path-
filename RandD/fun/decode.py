import csv

def chunk_160(text):
    return [text[i:i+160] for i in range(0, len(text), 160)]

data = ""

chunks = chunk_160(data)

with open("chunks.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(["chunk"])        # header
    for c in chunks:
        writer.writerow([c])

print("Saved to chunks.csv")

