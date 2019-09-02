Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E764BA5D51
	for <lists+dm-devel@lfdr.de>; Mon,  2 Sep 2019 23:07:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C91801026FFB;
	Mon,  2 Sep 2019 21:07:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB7985D9D6;
	Mon,  2 Sep 2019 21:07:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E45D81802218;
	Mon,  2 Sep 2019 21:06:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x82L67k5010910 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Sep 2019 17:06:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 50F591001B05; Mon,  2 Sep 2019 21:06:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B242E1001959;
	Mon,  2 Sep 2019 21:06:04 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F567308427C;
	Mon,  2 Sep 2019 21:06:03 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r17so12782365wme.0;
	Mon, 02 Sep 2019 14:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:mime-version:content-disposition
	:user-agent; bh=i9Rrhmbqb2mFPN/a2zoo7GHIS5cnhO4Yw2rdnmKy3JU=;
	b=u/0d+RqKS0zwJxL7VIkd+iVL5AzgtRl2SiU0z+2h5PU7fYRiTBKj78+VHVneq9virZ
	oQS6LdYDdVq0HXt449ABFWcLuYqQIDj7bSgP+VgN7+KVGcVyxowIi+34xmN/xyh6+fRX
	zVEHL45VbgMHz9HONvszCI4oHNbZ6HD0ff7Kiots38zSjFN2ifYtHIyOENGy9l+sm+oy
	u6UO4R+nSqdtx8YXG1/1R2lLl9Zx5EATBPQlnRUXMn0auCxYNQogzzeDJpFw3wPyh06z
	ugVtX+I0gDR6lFgLmGtzebYqkdAbvPK9mw+Je9zRWfM3q2eWw4z1tjydYkNDvpBPXzPS
	HUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=i9Rrhmbqb2mFPN/a2zoo7GHIS5cnhO4Yw2rdnmKy3JU=;
	b=ZFyt8Ip/L+SHnYuQNxtQ0ZW3kYEgHOFrwoywMrzUU38tEO9zpt9ckBAjeiXLIwnqno
	e6rlHAqCJ7dTRX7QHyrPoOHJGNZV21s6LBdtw7dbdLx1JKk8ha0oLloILXcHY1ptYWHr
	MOmdotM1zmwkXdhx08ZEqXUOg3Z7e5EjRnCtAqW6mEHhigT3kz7KV7+nB/mrCGb8Bkxq
	Ub1a8XNAii9Fwj4InMaxG9hsAM8ZTMl9H/ITOkiwCpId4JmRXQy4EMlhYajn6+04DxuU
	8CS5OvMoLXZZu8cCRPd3hAIC0ZXOKkiUZAtPC7T8g5GznjzX1UBd76JTW54pKYXIraYd
	DZlw==
X-Gm-Message-State: APjAAAUSvM6J3KkUTpulQGlB6NWO+sKU4Y/GBnBDgtiQ0uKHme7f0Bfz
	bsQQTA/QSAFuC/VW72Z9zEcuRCk=
X-Google-Smtp-Source: APXvYqydHuLn1At+NoxffadcP9gYYUDdqm7QAAfLK0Km5XuyTNfEnlRmALf7H0AnrYbOiRhB/WlSJQ==
X-Received: by 2002:a1c:a8cb:: with SMTP id
	r194mr37137849wme.156.1567458361620; 
	Mon, 02 Sep 2019 14:06:01 -0700 (PDT)
Received: from avx2 ([46.53.250.246]) by smtp.gmail.com with ESMTPSA id
	f23sm17993143wmj.37.2019.09.02.14.06.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Sep 2019 14:06:00 -0700 (PDT)
Date: Tue, 3 Sep 2019 00:05:58 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: mingo@redhat.com, peterz@infradead.org
Message-ID: <20190902210558.GA23013@avx2>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 02 Sep 2019 21:06:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Mon, 02 Sep 2019 21:06:03 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'adobriyan@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <adobriyan@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: aarcange@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	dm-devel@redhat.com, axboe@kernel.dk
Subject: [dm-devel] [PATCH] sched: make struct task_struct::state 32-bit
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]); Mon, 02 Sep 2019 21:07:14 +0000 (UTC)

32-bit accesses are shorter than 64-bit accesses on x86_64.
Nothing uses 64-bitness of ->state.

Space savings are ~2KB on F30 kernel config.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 arch/ia64/kernel/perfmon.c   |    4 ++--
 block/blk-mq.c               |    2 +-
 drivers/md/dm.c              |    4 ++--
 fs/userfaultfd.c             |    2 +-
 include/linux/sched.h        |    6 +++---
 include/linux/sched/debug.h  |    2 +-
 include/linux/sched/signal.h |    2 +-
 kernel/freezer.c             |    2 +-
 kernel/kthread.c             |    4 ++--
 kernel/locking/mutex.c       |    6 +++---
 kernel/locking/semaphore.c   |    2 +-
 kernel/rcu/rcutorture.c      |    4 ++--
 kernel/rcu/tree_stall.h      |    6 +++---
 kernel/sched/core.c          |    8 ++++----
 lib/syscall.c                |    2 +-
 15 files changed, 28 insertions(+), 28 deletions(-)

--- a/arch/ia64/kernel/perfmon.c
+++ b/arch/ia64/kernel/perfmon.c
@@ -2538,7 +2538,7 @@ pfm_task_incompatible(pfm_context_t *ctx, struct task_struct *task)
 	if (task == current) return 0;
 
 	if (!task_is_stopped_or_traced(task)) {
-		DPRINT(("cannot attach to non-stopped task [%d] state=%ld\n", task_pid_nr(task), task->state));
+		DPRINT(("cannot attach to non-stopped task [%d] state=%d\n", task_pid_nr(task), task->state));
 		return -EBUSY;
 	}
 	/*
@@ -4614,7 +4614,7 @@ pfm_check_task_state(pfm_context_t *ctx, int cmd, unsigned long flags)
 		return 0;
 	}
 
-	DPRINT(("context %d state=%d [%d] task_state=%ld must_stop=%d\n",
+	DPRINT(("context %d state=%d [%d] task_state=%d must_stop=%d\n",
 		ctx->ctx_fd,
 		state,
 		task_pid_nr(task),
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3471,7 +3471,7 @@ static bool blk_mq_poll_hybrid(struct request_queue *q,
 int blk_poll(struct request_queue *q, blk_qc_t cookie, bool spin)
 {
 	struct blk_mq_hw_ctx *hctx;
-	long state;
+	int state;
 
 	if (!blk_qc_t_valid(cookie) ||
 	    !test_bit(QUEUE_FLAG_POLL, &q->queue_flags))
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -2424,7 +2424,7 @@ void dm_put(struct mapped_device *md)
 }
 EXPORT_SYMBOL_GPL(dm_put);
 
-static int dm_wait_for_completion(struct mapped_device *md, long task_state)
+static int dm_wait_for_completion(struct mapped_device *md, int task_state)
 {
 	int r = 0;
 	DEFINE_WAIT(wait);
@@ -2570,7 +2570,7 @@ static void unlock_fs(struct mapped_device *md)
  * are being added to md->deferred list.
  */
 static int __dm_suspend(struct mapped_device *md, struct dm_table *map,
-			unsigned suspend_flags, long task_state,
+			unsigned suspend_flags, int task_state,
 			int dmf_suspended_flag)
 {
 	bool do_lockfs = suspend_flags & DM_SUSPEND_LOCKFS_FLAG;
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -356,7 +356,7 @@ vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason)
 	struct userfaultfd_wait_queue uwq;
 	vm_fault_t ret = VM_FAULT_SIGBUS;
 	bool must_wait, return_to_userland;
-	long blocking_state;
+	int blocking_state;
 
 	/*
 	 * We don't do userfault handling for the final child pid update.
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -643,7 +643,7 @@ struct task_struct {
 	struct thread_info		thread_info;
 #endif
 	/* -1 unrunnable, 0 runnable, >0 stopped: */
-	volatile long			state;
+	volatile int			state;
 
 	/*
 	 * This begins the randomizable portion of task_struct. Only
@@ -1702,10 +1702,10 @@ extern char *__get_task_comm(char *to, size_t len, struct task_struct *tsk);
 
 #ifdef CONFIG_SMP
 void scheduler_ipi(void);
-extern unsigned long wait_task_inactive(struct task_struct *, long match_state);
+unsigned long wait_task_inactive(struct task_struct *, int match_state);
 #else
 static inline void scheduler_ipi(void) { }
-static inline unsigned long wait_task_inactive(struct task_struct *p, long match_state)
+static inline unsigned long wait_task_inactive(struct task_struct *p, int match_state)
 {
 	return 1;
 }
--- a/include/linux/sched/debug.h
+++ b/include/linux/sched/debug.h
@@ -14,7 +14,7 @@ extern void dump_cpu_task(int cpu);
 /*
  * Only dump TASK_* tasks. (0 for all tasks)
  */
-extern void show_state_filter(unsigned long state_filter);
+void show_state_filter(unsigned int state_filter);
 
 static inline void show_state(void)
 {
--- a/include/linux/sched/signal.h
+++ b/include/linux/sched/signal.h
@@ -367,7 +367,7 @@ static inline int fatal_signal_pending(struct task_struct *p)
 	return signal_pending(p) && __fatal_signal_pending(p);
 }
 
-static inline int signal_pending_state(long state, struct task_struct *p)
+static inline int signal_pending_state(int state, struct task_struct *p)
 {
 	if (!(state & (TASK_INTERRUPTIBLE | TASK_WAKEKILL)))
 		return 0;
--- a/kernel/freezer.c
+++ b/kernel/freezer.c
@@ -64,7 +64,7 @@ bool __refrigerator(bool check_kthr_stop)
 	/* Hmm, should we be allowed to suspend when there are realtime
 	   processes around? */
 	bool was_frozen = false;
-	long save = current->state;
+	int save = current->state;
 
 	pr_debug("%s entered refrigerator\n", current->comm);
 
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -392,7 +392,7 @@ struct task_struct *kthread_create_on_node(int (*threadfn)(void *data),
 }
 EXPORT_SYMBOL(kthread_create_on_node);
 
-static void __kthread_bind_mask(struct task_struct *p, const struct cpumask *mask, long state)
+static void __kthread_bind_mask(struct task_struct *p, const struct cpumask *mask, int state)
 {
 	unsigned long flags;
 
@@ -408,7 +408,7 @@ static void __kthread_bind_mask(struct task_struct *p, const struct cpumask *mas
 	raw_spin_unlock_irqrestore(&p->pi_lock, flags);
 }
 
-static void __kthread_bind(struct task_struct *p, unsigned int cpu, long state)
+static void __kthread_bind(struct task_struct *p, unsigned int cpu, int state)
 {
 	__kthread_bind_mask(p, cpumask_of(cpu), state);
 }
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -897,7 +897,7 @@ __ww_mutex_add_waiter(struct mutex_waiter *waiter,
  * Lock a mutex (possibly interruptible), slowpath:
  */
 static __always_inline int __sched
-__mutex_lock_common(struct mutex *lock, long state, unsigned int subclass,
+__mutex_lock_common(struct mutex *lock, int state, unsigned int subclass,
 		    struct lockdep_map *nest_lock, unsigned long ip,
 		    struct ww_acquire_ctx *ww_ctx, const bool use_ww_ctx)
 {
@@ -1071,14 +1071,14 @@ __mutex_lock_common(struct mutex *lock, long state, unsigned int subclass,
 }
 
 static int __sched
-__mutex_lock(struct mutex *lock, long state, unsigned int subclass,
+__mutex_lock(struct mutex *lock, int state, unsigned int subclass,
 	     struct lockdep_map *nest_lock, unsigned long ip)
 {
 	return __mutex_lock_common(lock, state, subclass, nest_lock, ip, NULL, false);
 }
 
 static int __sched
-__ww_mutex_lock(struct mutex *lock, long state, unsigned int subclass,
+__ww_mutex_lock(struct mutex *lock, int state, unsigned int subclass,
 		struct lockdep_map *nest_lock, unsigned long ip,
 		struct ww_acquire_ctx *ww_ctx)
 {
--- a/kernel/locking/semaphore.c
+++ b/kernel/locking/semaphore.c
@@ -201,7 +201,7 @@ struct semaphore_waiter {
  * constant, and thus optimised away by the compiler.  Likewise the
  * 'timeout' parameter for the cases without timeouts.
  */
-static inline int __sched __down_common(struct semaphore *sem, long state,
+static inline int __sched __down_common(struct semaphore *sem, int state,
 								long timeout)
 {
 	struct semaphore_waiter waiter;
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -1472,10 +1472,10 @@ rcu_torture_stats_print(void)
 		srcutorture_get_gp_data(cur_ops->ttype, srcu_ctlp,
 					&flags, &gp_seq);
 		wtp = READ_ONCE(writer_task);
-		pr_alert("??? Writer stall state %s(%d) g%lu f%#x ->state %#lx cpu %d\n",
+		pr_alert("??? Writer stall state %s(%d) g%lu f%#x ->state %#x cpu %d\n",
 			 rcu_torture_writer_state_getname(),
 			 rcu_torture_writer_state, gp_seq, flags,
-			 wtp == NULL ? ~0UL : wtp->state,
+			 wtp == NULL ? ~0U : wtp->state,
 			 wtp == NULL ? -1 : (int)task_cpu(wtp));
 		if (!splatted && wtp) {
 			sched_show_task(wtp);
--- a/kernel/rcu/tree_stall.h
+++ b/kernel/rcu/tree_stall.h
@@ -337,7 +337,7 @@ static void rcu_check_gp_kthread_starvation(void)
 
 	j = jiffies - READ_ONCE(rcu_state.gp_activity);
 	if (j > 2 * HZ) {
-		pr_err("%s kthread starved for %ld jiffies! g%ld f%#x %s(%d) ->state=%#lx ->cpu=%d\n",
+		pr_err("%s kthread starved for %ld jiffies! g%ld f%#x %s(%d) ->state=%#x ->cpu=%d\n",
 		       rcu_state.name, j,
 		       (long)rcu_seq_current(&rcu_state.gp_seq),
 		       READ_ONCE(rcu_state.gp_flags),
@@ -559,10 +559,10 @@ void show_rcu_gp_kthreads(void)
 	ja = j - READ_ONCE(rcu_state.gp_activity);
 	jr = j - READ_ONCE(rcu_state.gp_req_activity);
 	jw = j - READ_ONCE(rcu_state.gp_wake_time);
-	pr_info("%s: wait state: %s(%d) ->state: %#lx delta ->gp_activity %lu ->gp_req_activity %lu ->gp_wake_time %lu ->gp_wake_seq %ld ->gp_seq %ld ->gp_seq_needed %ld ->gp_flags %#x\n",
+	pr_info("%s: wait state: %s(%d) ->state: %#x delta ->gp_activity %lu ->gp_req_activity %lu ->gp_wake_time %lu ->gp_wake_seq %ld ->gp_seq %ld ->gp_seq_needed %ld ->gp_flags %#x\n",
 		rcu_state.name, gp_state_getname(rcu_state.gp_state),
 		rcu_state.gp_state,
-		rcu_state.gp_kthread ? rcu_state.gp_kthread->state : 0x1ffffL,
+		rcu_state.gp_kthread ? rcu_state.gp_kthread->state : 0x1ffff,
 		ja, jr, jw, (long)READ_ONCE(rcu_state.gp_wake_seq),
 		(long)READ_ONCE(rcu_state.gp_seq),
 		(long)READ_ONCE(rcu_get_root()->gp_seq_needed),
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1769,7 +1769,7 @@ int migrate_swap(struct task_struct *cur, struct task_struct *p,
  * smp_call_function() if an IPI is sent by the same process we are
  * waiting to become inactive.
  */
-unsigned long wait_task_inactive(struct task_struct *p, long match_state)
+unsigned long wait_task_inactive(struct task_struct *p, int match_state)
 {
 	int running, queued;
 	struct rq_flags rf;
@@ -5761,7 +5761,7 @@ void sched_show_task(struct task_struct *p)
 EXPORT_SYMBOL_GPL(sched_show_task);
 
 static inline bool
-state_filter_match(unsigned long state_filter, struct task_struct *p)
+state_filter_match(unsigned int state_filter, struct task_struct *p)
 {
 	/* no filter, everything matches */
 	if (!state_filter)
@@ -5782,7 +5782,7 @@ state_filter_match(unsigned long state_filter, struct task_struct *p)
 }
 
 
-void show_state_filter(unsigned long state_filter)
+void show_state_filter(unsigned int state_filter)
 {
 	struct task_struct *g, *p;
 
@@ -6553,7 +6553,7 @@ void __might_sleep(const char *file, int line, int preempt_offset)
 	 */
 	WARN_ONCE(current->state != TASK_RUNNING && current->task_state_change,
 			"do not call blocking ops when !TASK_RUNNING; "
-			"state=%lx set at [<%p>] %pS\n",
+			"state=%x set at [<%p>] %pS\n",
 			current->state,
 			(void *)current->task_state_change,
 			(void *)current->task_state_change);
--- a/lib/syscall.c
+++ b/lib/syscall.c
@@ -61,7 +61,7 @@ static int collect_syscall(struct task_struct *target, struct syscall_info *info
  */
 int task_current_syscall(struct task_struct *target, struct syscall_info *info)
 {
-	long state;
+	int state;
 	unsigned long ncsw;
 
 	if (target == current)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
