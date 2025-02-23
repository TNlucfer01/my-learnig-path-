def find_waiting_time(processes, n, bt, wt):
    wt[0] = 0
    for i in range(1, n):
        wt[i] = bt[i-1] + wt[i-1]

def find_turn_around_time(processes, n, bt, wt, tat):
    for i in range(n):
        tat[i] = bt[i] + wt[i]

def find_avg_time(processes, n, bt):
    wt = [0] * n
    tat = [0] * n
    total_wt = 0
    total_tat = 0
    
    find_waiting_time(processes, n, bt, wt)
    find_turn_around_time(processes, n, bt, wt, tat)
    
    print("Process\tBurst Time\tWaiting Time\tTurn Around Time")
    
    for i in range(n):
        total_wt = total_wt + wt[i]
        total_tat = total_tat + tat[i]
        print(" " + str(i+1) + "\t\t" + str(bt[i]) + "\t\t" + str(wt[i]) + "\t\t" + str(tat[i]))
    
    print("Average Waiting Time = " + str(total_wt / n))
    print("Average Turn Around Time = " + str(total_tat / n))

if __name__ == "__main__":
    process = [1, 2, 3]
    n = len(process)
    bt = [10, 5, 8]
    find_avg_time(process, n, bt)
