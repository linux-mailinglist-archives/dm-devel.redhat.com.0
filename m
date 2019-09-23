Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EC8BB282
	for <lists+dm-devel@lfdr.de>; Mon, 23 Sep 2019 12:59:21 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E495689810C;
	Mon, 23 Sep 2019 10:59:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ACCB5D71C;
	Mon, 23 Sep 2019 10:59:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA44A4EE69;
	Mon, 23 Sep 2019 10:59:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8NAYDvd024966 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Sep 2019 06:34:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4816260600; Mon, 23 Sep 2019 10:34:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C2FF60933;
	Mon, 23 Sep 2019 10:34:11 +0000 (UTC)
Received: from mail3-relais-sop.national.inria.fr
	(mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 64D4F3091785;
	Mon, 23 Sep 2019 10:34:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,539,1559512800"; d="scan'208";a="320310025"
Received: from unknown (HELO hadrien) ([65.39.69.237])
	by mail3-relais-sop.national.inria.fr with
	ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Sep 2019 12:34:06 +0200
Date: Mon, 23 Sep 2019 12:34:06 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Valentin Schneider <valentin.schneider@arm.com>
In-Reply-To: <32d65b15-1855-e7eb-e9c4-81560fab62ea@arm.com>
Message-ID: <alpine.DEB.2.21.1909231228200.2272@hadrien>
References: <a43fe392-bd6a-71f5-8611-c6b764ba56c3@arm.com>
	<7e3e784c-e8e6-f9ba-490f-ec3bf956d96b@web.de>
	<0c4dcb91-4830-0013-b8c6-64b9e1ce47d4@arm.com>
	<32d65b15-1855-e7eb-e9c4-81560fab62ea@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.41]); Mon, 23 Sep 2019 10:34:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Mon, 23 Sep 2019 10:34:10 +0000 (UTC) for IP:'192.134.164.104'
	DOMAIN:'mail3-relais-sop.national.inria.fr'
	HELO:'mail3-relais-sop.national.inria.fr'
	FROM:'julia.lawall@lip6.fr' RCPT:''
X-RedHat-Spam-Score: -4.347  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NEUTRAL) 192.134.164.104
	mail3-relais-sop.national.inria.fr 192.134.164.104
	mail3-relais-sop.national.inria.fr <julia.lawall@lip6.fr>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 23 Sep 2019 06:59:02 -0400
Cc: Andrea Arcangeli <aarcange@redhat.com>, rcu@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Julia Lawall <julia.lawall@lip6.fr>, dm-devel@redhat.com,
	Ingo Molnar <mingo@redhat.com>, Markus Elfring <Markus.Elfring@web.de>,
	Jens Axboe <axboe@kernel.dk>, Alexey Dobriyan <adobriyan@gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]); Mon, 23 Sep 2019 10:59:20 +0000 (UTC)



On Mon, 23 Sep 2019, Valentin Schneider wrote:

> On 05/09/2019 17:52, Valentin Schneider wrote:
> > I actually got rid of the task_struct* parameter and now just match
> > against task_struct.p accesses in the function body, which has the
> > added bonus of not caring about the order of the parameters.
> >
> > Still not there yet but making progress in the background, hope it's
> > passable entertainment to see me struggle my way there :)
> >
>
> Bit of hiatus on my end there. I did play around some more with Coccinelle
> on the way to/from Plumbers. The main problems I'm facing ATM is "current"
> not being recognized as a task_struct* expression, and the need to
> "recursively" match task_struct.state modifiers, i.e. catch both functions
> for something like:
>
> foo(long state)
> {
> 	__foo(state);
> }
>
> __foo(long state)
> {
> 	current->state = state;
> }
>
>
> Here's where I'm at:
> ---
> virtual patch
> virtual report
>
> // Match variables that represent task states
> // They can be read from / written to task_struct.state, or be compared
> // to TASK_* values
> @state_access@
> struct task_struct *p;
> // FIXME: current not recognized as task_struct*, fixhack with regexp
> identifier current =~ "^current$";

Please don't do this.  Just use the word current.  It doesn't have to be a
metavariable.  You will though get a warning about it.  To eliminate the
warning, you can say symbol current;

> identifier task_state =~ "^TASK_";

Are there a lot of options?  You can also enumerate them in {}, ie

identifier task_state = {TASK_BLAH, TASK_BLAHBLAH};

> identifier state_var;
> position pos;
> @@
>
> (
>   p->state & state_var@pos
> |
>   current->state & state_var@pos
> |
>   p->state | state_var@pos
> |
>   current->state | state_var@pos
> |
>   p->state < state_var@pos
> |
>   current->state < state_var@pos
> |
>   p->state > state_var@pos
> |
>   current->state > state_var@pos
> |
>   state_var@pos = p->state
> |
>   state_var@pos = current->state
> |
>   p->state == state_var@pos
> |
>   current->state == state_var@pos
> |
>   p->state != state_var@pos
> |
>   current->state != state_var@pos
> |
> // FIXME: match functions that do something with state_var underneath?
> // How to do recursive rules?

You want to look at the definitions of called functions?  Coccinelle
doesn't really support that, but there are hackish ways to add that.  How
many function calls would you expect have to be unrolled?

>   set_current_state(state_var@pos)
> |
>   set_special_state(state_var@pos)
> |
>   signal_pending_state(state_var@pos, p)
> |
>   signal_pending_state(state_var@pos, current)
> |
>   state_var@pos & task_state
> |
>   state_var@pos | task_state
> )
>
> // Fixup local variables
> @depends on patch && state_access@
> identifier state_var = state_access.state_var;
> @@
> (
> - long
> + int
> |
> - unsigned long
> + unsigned int
> )
> state_var;
>
> // Fixup function parameters
> @depends on patch && state_access@
> identifier fn;
> identifier state_var = state_access.state_var;
> @@
>
> fn(...,
> - long state_var
> + int state_var
> ,...)
> {
> 	...
> }
>
> // FIXME: find a way to squash that with the above?

I think that you can make a disjunction on a function parameter

fn(...,
(
- T1 x1
+ T2 x2
|
- T3 x3
+ T4 x4
)
, ...) { ... }

julia

> // Fixup function parameters
> @depends on patch && state_access@
> identifier fn;
> identifier state_var = state_access.state_var;
> @@
>
> fn(...,
> - unsigned long
> + unsigned int
> state_var
> ,...)
> {
> 	...
> }
> ---
>
> This gives me the following diff on kernel/:
>
> ---
> diff -u -p a/locking/mutex.c b/locking/mutex.c
> --- a/locking/mutex.c
> +++ b/locking/mutex.c
> @@ -923,7 +923,7 @@ __ww_mutex_add_waiter(struct mutex_waite
>   * Lock a mutex (possibly interruptible), slowpath:
>   */
>  static __always_inline int __sched
> -__mutex_lock_common(struct mutex *lock, long state, unsigned int subclass,
> +__mutex_lock_common(struct mutex *lock, int state, unsigned int subclass,
>  		    struct lockdep_map *nest_lock, unsigned long ip,
>  		    struct ww_acquire_ctx *ww_ctx, const bool use_ww_ctx)
>  {
> @@ -1097,14 +1097,14 @@ err_early_kill:
>  }
>
>  static int __sched
> -__mutex_lock(struct mutex *lock, long state, unsigned int subclass,
> +__mutex_lock(struct mutex *lock, int state, unsigned int subclass,
>  	     struct lockdep_map *nest_lock, unsigned long ip)
>  {
>  	return __mutex_lock_common(lock, state, subclass, nest_lock, ip, NULL, false);
>  }
>
>  static int __sched
> -__ww_mutex_lock(struct mutex *lock, long state, unsigned int subclass,
> +__ww_mutex_lock(struct mutex *lock, int state, unsigned int subclass,
>  		struct lockdep_map *nest_lock, unsigned long ip,
>  		struct ww_acquire_ctx *ww_ctx)
>  {
> diff -u -p a/locking/semaphore.c b/locking/semaphore.c
> --- a/locking/semaphore.c
> +++ b/locking/semaphore.c
> @@ -201,7 +201,7 @@ struct semaphore_waiter {
>   * constant, and thus optimised away by the compiler.  Likewise the
>   * 'timeout' parameter for the cases without timeouts.
>   */
> -static inline int __sched __down_common(struct semaphore *sem, long state,
> +static inline int __sched __down_common(struct semaphore *sem, int state,
>  								long timeout)
>  {
>  	struct semaphore_waiter waiter;
> diff -u -p a/freezer.c b/freezer.c
> --- a/freezer.c
> +++ b/freezer.c
> @@ -64,7 +64,7 @@ bool __refrigerator(bool check_kthr_stop
>  	/* Hmm, should we be allowed to suspend when there are realtime
>  	   processes around? */
>  	bool was_frozen = false;
> -	long save = current->state;
> +	int save = current->state;
>
>  	pr_debug("%s entered refrigerator\n", current->comm);
>
> diff -u -p a/sched/core.c b/sched/core.c
> --- a/sched/core.c
> +++ b/sched/core.c
> @@ -1888,7 +1888,7 @@ out:
>   * smp_call_function() if an IPI is sent by the same process we are
>   * waiting to become inactive.
>   */
> -unsigned long wait_task_inactive(struct task_struct *p, long match_state)
> +unsigned long wait_task_inactive(struct task_struct *p, int match_state)
>  {
>  	int running, queued;
>  	struct rq_flags rf;
> @@ -3185,7 +3185,7 @@ static struct rq *finish_task_switch(str
>  {
>  	struct rq *rq = this_rq();
>  	struct mm_struct *mm = rq->prev_mm;
> -	long prev_state;
> +	int prev_state;
>
>  	/*
>  	 * The previous task will have left us with a preempt_count of 2
> @@ -5964,7 +5964,7 @@ void sched_show_task(struct task_struct
>  EXPORT_SYMBOL_GPL(sched_show_task);
>
>  static inline bool
> -state_filter_match(unsigned long state_filter, struct task_struct *p)
> +state_filter_match(unsigned int state_filter, struct task_struct *p)
>  {
>  	/* no filter, everything matches */
>  	if (!state_filter)
> @@ -5985,7 +5985,7 @@ state_filter_match(unsigned long state_f
>  }
>
>
> -void show_state_filter(unsigned long state_filter)
> +void show_state_filter(unsigned int state_filter)
>  {
>  	struct task_struct *g, *p;
>
> ---
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
