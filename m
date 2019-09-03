Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A06A7E71
	for <lists+dm-devel@lfdr.de>; Wed,  4 Sep 2019 10:53:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 38F2681DFF;
	Wed,  4 Sep 2019 08:53:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DC491EC;
	Wed,  4 Sep 2019 08:53:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F3E6180BA9B;
	Wed,  4 Sep 2019 08:53:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x83Lpj77028462 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 17:51:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 02FD65C22F; Tue,  3 Sep 2019 21:51:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6A9B5C207;
	Tue,  3 Sep 2019 21:51:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mx1.redhat.com (Postfix) with ESMTP id 4FC223001A9A;
	Tue,  3 Sep 2019 21:51:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6401D337;
	Tue,  3 Sep 2019 14:51:39 -0700 (PDT)
Received: from [10.0.2.15] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1A7FE3F718; 
	Tue,  3 Sep 2019 14:51:37 -0700 (PDT)
To: Alexey Dobriyan <adobriyan@gmail.com>
References: <20190902210558.GA23013@avx2>
	<d8ad0be1-4ed7-df74-d415-2b1c9a44bac7@arm.com>
	<20190903181920.GA22358@avx2>
From: Valentin Schneider <valentin.schneider@arm.com>
Message-ID: <92ead22e-0580-c720-1a29-7db79d76f7d7@arm.com>
Date: Tue, 3 Sep 2019 22:51:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903181920.GA22358@avx2>
Content-Language: en-US
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Tue, 03 Sep 2019 21:51:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Tue, 03 Sep 2019 21:51:41 +0000 (UTC) for IP:'217.140.110.172'
	DOMAIN:'foss.arm.com' HELO:'foss.arm.com'
	FROM:'valentin.schneider@arm.com' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 217.140.110.172 foss.arm.com 217.140.110.172
	foss.arm.com <valentin.schneider@arm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 04 Sep 2019 04:53:21 -0400
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, peterz@infradead.org,
	aarcange@redhat.com, linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org, dm-devel@redhat.com, mingo@redhat.com
Subject: Re: [dm-devel] [PATCH] sched: make struct task_struct::state 32-bit
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Wed, 04 Sep 2019 08:53:36 +0000 (UTC)

On 03/09/2019 19:19, Alexey Dobriyan wrote:
> On Tue, Sep 03, 2019 at 06:29:06PM +0100, Valentin Schneider wrote:
>> On 02/09/2019 22:05, Alexey Dobriyan wrote:
>>> 32-bit accesses are shorter than 64-bit accesses on x86_64.
>>> Nothing uses 64-bitness of ->state.
> 
>> It looks like you missed a few places. There's a long prev_state in
>> sched/core.c::finish_task_switch() for instance.
>>
>> I suppose that's where coccinelle oughta help but I'm really not fluent
>> in that. Is there a way to make it match p.state accesses with p task_struct?
>> And if so, can we make it change the type of the variable being read from
>> / written to?
> 
> Coccinelle is interesting: basic
> 
> 	- foo
> 	+ bar
> 
> doesn't find "foo" in function arguments.
> 
> I'm scared of coccinelle.> 

So am I, but I'm even more scared of having no other way of verifying this
than doing it "by hand". It's nothing critical here - just some variables
that will remain long instead of being int, but I'd like to have some way to
verify the change. A coccinelle script would be great, even if it misses
some places, I can at least have some trust in it.

If I have to verify the whole tree by hand, even with grep/ag, I don't trust
I'll do it right.


I gave Coccinelle a try, I think I got something for in-function variables:

---
@state_var@
struct task_struct *p;
identifier prev_state;
@@
prev_state = p->state

@@
identifier state_var.prev_state;
@@
- long prev_state;
+ int prev_state;
---

I tried something for function parameters, which seems to be feasible
according to [1], but couldn't get it to work (yet). Here's what I have
so far:

---
@func_param@
identifier func;
identifier p;
identifier state;
identifier mask;
@@

func(struct task_struct *p, const struct cpumask *mask, long state)
{
...
}

@@
identifier func_param.func;
identifier func_param.state;
expression E1;
expression E2;
@@

func(E1,
- long state,
+ int state,
E2)
---

(it should match against kernel/kthread.c::__kthread_bind_mask() but it
complains about me not knowing how to write coccinelle patches).

With a mix of these we might get somewhere...

[1]: http://coccinelle.lip6.fr/docs/main_grammar016.html

>> How did you come up with this changeset, did you pickaxe for some regexp?
> 
> No, manually, backtracking up to the call chain.
> Maybe I missed a few places.
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
