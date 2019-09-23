Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9DCBB283
	for <lists+dm-devel@lfdr.de>; Mon, 23 Sep 2019 12:59:21 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E70A6A26687;
	Mon, 23 Sep 2019 10:59:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82E6B60BF7;
	Mon, 23 Sep 2019 10:59:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA24D4EE68;
	Mon, 23 Sep 2019 10:59:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8NAQC9t024515 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Sep 2019 06:26:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 246EE5D9E2; Mon, 23 Sep 2019 10:26:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FE065D9CA;
	Mon, 23 Sep 2019 10:26:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mx1.redhat.com (Postfix) with ESMTP id 4682183F40;
	Mon, 23 Sep 2019 10:26:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BECCE142F;
	Mon, 23 Sep 2019 03:26:06 -0700 (PDT)
Received: from [10.1.194.37] (e113632-lin.cambridge.arm.com [10.1.194.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69C883F694;
	Mon, 23 Sep 2019 03:26:05 -0700 (PDT)
From: Valentin Schneider <valentin.schneider@arm.com>
To: Markus Elfring <Markus.Elfring@web.de>,
	Alexey Dobriyan <adobriyan@gmail.com>, dm-devel@redhat.com,
	linux-block@vger.kernel.org, rcu@vger.kernel.org
References: <a43fe392-bd6a-71f5-8611-c6b764ba56c3@arm.com>
	<7e3e784c-e8e6-f9ba-490f-ec3bf956d96b@web.de>
	<0c4dcb91-4830-0013-b8c6-64b9e1ce47d4@arm.com>
Message-ID: <32d65b15-1855-e7eb-e9c4-81560fab62ea@arm.com>
Date: Mon, 23 Sep 2019 11:26:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0c4dcb91-4830-0013-b8c6-64b9e1ce47d4@arm.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Mon, 23 Sep 2019 10:26:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Mon, 23 Sep 2019 10:26:08 +0000 (UTC) for IP:'217.140.110.172'
	DOMAIN:'foss.arm.com' HELO:'foss.arm.com'
	FROM:'valentin.schneider@arm.com' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 217.140.110.172 foss.arm.com 217.140.110.172
	foss.arm.com <valentin.schneider@arm.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 23 Sep 2019 06:59:02 -0400
Cc: Andrea Arcangeli <aarcange@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	Julia Lawall <julia.lawall@lip6.fr>, Ingo Molnar <mingo@redhat.com>
Subject: Re: [dm-devel] sched: make struct task_struct::state 32-bit
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]); Mon, 23 Sep 2019 10:59:20 +0000 (UTC)

On 05/09/2019 17:52, Valentin Schneider wrote:
> I actually got rid of the task_struct* parameter and now just match
> against task_struct.p accesses in the function body, which has the
> added bonus of not caring about the order of the parameters.
> 
> Still not there yet but making progress in the background, hope it's
> passable entertainment to see me struggle my way there :)
> 

Bit of hiatus on my end there. I did play around some more with Coccinelle 
on the way to/from Plumbers. The main problems I'm facing ATM is "current"
not being recognized as a task_struct* expression, and the need to 
"recursively" match task_struct.state modifiers, i.e. catch both functions
for something like:

foo(long state)
{
	__foo(state);
}

__foo(long state)
{
	current->state = state;
}


Here's where I'm at:
---
virtual patch
virtual report

// Match variables that represent task states
// They can be read from / written to task_struct.state, or be compared
// to TASK_* values
@state_access@
struct task_struct *p;
// FIXME: current not recognized as task_struct*, fixhack with regexp
identifier current =~ "^current$";
identifier task_state =~ "^TASK_";
identifier state_var;
position pos;
@@

(
  p->state & state_var@pos
|
  current->state & state_var@pos
|
  p->state | state_var@pos
|
  current->state | state_var@pos
|
  p->state < state_var@pos
|
  current->state < state_var@pos
|
  p->state > state_var@pos
|
  current->state > state_var@pos
|
  state_var@pos = p->state
|
  state_var@pos = current->state
|
  p->state == state_var@pos
|
  current->state == state_var@pos
|
  p->state != state_var@pos
|
  current->state != state_var@pos
|
// FIXME: match functions that do something with state_var underneath?
// How to do recursive rules?
  set_current_state(state_var@pos)
|
  set_special_state(state_var@pos)
|
  signal_pending_state(state_var@pos, p)
|
  signal_pending_state(state_var@pos, current)
|
  state_var@pos & task_state
|
  state_var@pos | task_state
)

// Fixup local variables
@depends on patch && state_access@
identifier state_var = state_access.state_var;
@@
(
- long
+ int
|
- unsigned long
+ unsigned int
)
state_var;

// Fixup function parameters
@depends on patch && state_access@
identifier fn;
identifier state_var = state_access.state_var;
@@

fn(...,
- long state_var
+ int state_var
,...)
{
	...
}

// FIXME: find a way to squash that with the above?
// Fixup function parameters
@depends on patch && state_access@
identifier fn;
identifier state_var = state_access.state_var;
@@

fn(...,
- unsigned long
+ unsigned int
state_var
,...)
{
	...
}
---

This gives me the following diff on kernel/:

---
diff -u -p a/locking/mutex.c b/locking/mutex.c
--- a/locking/mutex.c
+++ b/locking/mutex.c
@@ -923,7 +923,7 @@ __ww_mutex_add_waiter(struct mutex_waite
  * Lock a mutex (possibly interruptible), slowpath:
  */
 static __always_inline int __sched
-__mutex_lock_common(struct mutex *lock, long state, unsigned int subclass,
+__mutex_lock_common(struct mutex *lock, int state, unsigned int subclass,
 		    struct lockdep_map *nest_lock, unsigned long ip,
 		    struct ww_acquire_ctx *ww_ctx, const bool use_ww_ctx)
 {
@@ -1097,14 +1097,14 @@ err_early_kill:
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
diff -u -p a/locking/semaphore.c b/locking/semaphore.c
--- a/locking/semaphore.c
+++ b/locking/semaphore.c
@@ -201,7 +201,7 @@ struct semaphore_waiter {
  * constant, and thus optimised away by the compiler.  Likewise the
  * 'timeout' parameter for the cases without timeouts.
  */
-static inline int __sched __down_common(struct semaphore *sem, long state,
+static inline int __sched __down_common(struct semaphore *sem, int state,
 								long timeout)
 {
 	struct semaphore_waiter waiter;
diff -u -p a/freezer.c b/freezer.c
--- a/freezer.c
+++ b/freezer.c
@@ -64,7 +64,7 @@ bool __refrigerator(bool check_kthr_stop
 	/* Hmm, should we be allowed to suspend when there are realtime
 	   processes around? */
 	bool was_frozen = false;
-	long save = current->state;
+	int save = current->state;
 
 	pr_debug("%s entered refrigerator\n", current->comm);
 
diff -u -p a/sched/core.c b/sched/core.c
--- a/sched/core.c
+++ b/sched/core.c
@@ -1888,7 +1888,7 @@ out:
  * smp_call_function() if an IPI is sent by the same process we are
  * waiting to become inactive.
  */
-unsigned long wait_task_inactive(struct task_struct *p, long match_state)
+unsigned long wait_task_inactive(struct task_struct *p, int match_state)
 {
 	int running, queued;
 	struct rq_flags rf;
@@ -3185,7 +3185,7 @@ static struct rq *finish_task_switch(str
 {
 	struct rq *rq = this_rq();
 	struct mm_struct *mm = rq->prev_mm;
-	long prev_state;
+	int prev_state;
 
 	/*
 	 * The previous task will have left us with a preempt_count of 2
@@ -5964,7 +5964,7 @@ void sched_show_task(struct task_struct
 EXPORT_SYMBOL_GPL(sched_show_task);
 
 static inline bool
-state_filter_match(unsigned long state_filter, struct task_struct *p)
+state_filter_match(unsigned int state_filter, struct task_struct *p)
 {
 	/* no filter, everything matches */
 	if (!state_filter)
@@ -5985,7 +5985,7 @@ state_filter_match(unsigned long state_f
 }
 
 
-void show_state_filter(unsigned long state_filter)
+void show_state_filter(unsigned int state_filter)
 {
 	struct task_struct *g, *p;
 
---

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
