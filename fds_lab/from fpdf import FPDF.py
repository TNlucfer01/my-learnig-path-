from fpdf import FPDF

# Create PDF document with given details
pdf = FPDF()
pdf.set_auto_page_break(auto=True, margin=15)

# Cover Page
pdf.add_page()
pdf.set_font("Arial", "I", 16)
pdf.cell(0, 10, "DPCO SEMINAR", ln=True, align="C")
pdf.ln(10)
pdf.set_font("Arial", "", 14)
pdf.cell(0, 10, "TOPIC: DIRECT MEMORY ACCESS", ln=True, align="C")
pdf.ln(10)
pdf.cell(0, 10, "PREPARED BY: AATHI S", ln=True, align="C")

# Page 2 - Title and Outline
pdf.add_page()
pdf.set_font("Arial", "B", 14)
pdf.cell(0, 10, "Direct Memory Access (DMA)", ln=True, align="C")
pdf.ln(10)

# Subtopics and brief introduction
content = [
    ("Introduction", 
     "Direct Memory Access (DMA) is a feature that allows devices to directly access memory, "
     "reducing CPU workload and enabling faster data transfers in a computer system. "
     "The DMA controller takes over the data transfer process, freeing up the CPU for other tasks."),
    
    ("Why DMA is Needed", 
     "In traditional data transfers, the CPU must manage each part of the process, which consumes "
     "significant resources. DMA allows data to be moved independently, improving system efficiency."),
    
    ("How DMA Works", 
     "DMA operates via a DMA controller that handles data movement between memory and devices. "
     "The CPU configures the controller with source, destination, and data length, allowing it to operate independently."),
    
    ("Types of DMA Transfers", 
     "DMA can perform transfers such as Memory-to-Memory, I/O-to-Memory, and Memory-to-I/O, "
     "depending on the source and destination of the data."),
    
    ("DMA Transfer Modes", 
     "DMA supports Burst Mode, Cycle Stealing Mode, and Transparent Mode, allowing flexible data transfer speeds "
     "and minimal impact on CPU performance."),
    
    ("Advantages of DMA", 
     "DMA improves speed and efficiency, reduces CPU load, and enables simultaneous operations, making it ideal "
     "for applications like multimedia processing and data storage."),
    
    ("Disadvantages of DMA", 
     "Complexity and potential memory conflicts are common challenges, along with security risks that can be managed "
     "with modern protective technologies."),
    
    ("Applications of DMA", 
     "DMA is used in graphics processing, audio devices, networking, and storage, where high-speed data transfer is essential."),
    
    ("Conclusion", 
     "DMA is a powerful feature in computer architecture, enhancing data transfer speeds and system efficiency, "
     "especially in modern computing applications.")
]

# Adding subtopics to Page 2
pdf.set_font("Arial", "", 12)
for title, description in content:
    pdf.set_font("Arial", "B", 12)
    pdf.cell(0, 10, title, ln=True)
    pdf.set_font("Arial", "", 12)
    pdf.multi_cell(0, 10, description)
    pdf.ln(5)

# Save PDF
output_path = "DPCO_Seminar_DMA_Aathi_S.pdf"
pdf.output(output_path)

output_path
