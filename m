Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1D0A9BC9
	for <lists+dm-devel@lfdr.de>; Thu,  5 Sep 2019 09:30:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EAD998830A;
	Thu,  5 Sep 2019 07:30:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8314194B2;
	Thu,  5 Sep 2019 07:30:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 60CAB180221D;
	Thu,  5 Sep 2019 07:30:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x84HmuAU001162 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Sep 2019 13:48:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 51F22100197A; Wed,  4 Sep 2019 17:48:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8B5A1001956;
	Wed,  4 Sep 2019 17:48:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mx1.redhat.com (Postfix) with ESMTP id E4471309B69C;
	Wed,  4 Sep 2019 17:48:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96343337;
	Wed,  4 Sep 2019 10:48:51 -0700 (PDT)
Received: from [10.1.194.37] (e113632-lin.cambridge.arm.com [10.1.194.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76BA03F67D;
	Wed,  4 Sep 2019 10:48:50 -0700 (PDT)
From: Valentin Schneider <valentin.schneider@arm.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
References: <20190902210558.GA23013@avx2>
	<d8ad0be1-4ed7-df74-d415-2b1c9a44bac7@arm.com>
	<20190903181920.GA22358@avx2>
	<92ead22e-0580-c720-1a29-7db79d76f7d7@arm.com>
	<a43fe392-bd6a-71f5-8611-c6b764ba56c3@arm.com>
Message-ID: <f0328a66-ca9f-974d-3799-e73308fb1d34@arm.com>
Date: Wed, 4 Sep 2019 18:48:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a43fe392-bd6a-71f5-8611-c6b764ba56c3@arm.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Wed, 04 Sep 2019 17:48:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Wed, 04 Sep 2019 17:48:53 +0000 (UTC) for IP:'217.140.110.172'
	DOMAIN:'foss.arm.com' HELO:'foss.arm.com'
	FROM:'valentin.schneider@arm.com' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 217.140.110.172 foss.arm.com 217.140.110.172
	foss.arm.com <valentin.schneider@arm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 05 Sep 2019 03:30:15 -0400
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Thu, 05 Sep 2019 07:30:28 +0000 (UTC)

On 04/09/2019 13:07, Valentin Schneider wrote:
> [...]
> Baby steps...


There's something regarding coccinelle disjunctions that just can't grasp,
and this also fails to recognize "current" as being "struct task_struct*".

Once I fix these, it's "just" a matter of finding out how to write a rule
for layered calls (e.g. __kthread_bind() -> __kthread_bind_mask() ->
wait_task_inactive()), and we should be close to having something somewhat
usable.

---
virtual patch
virtual report

@state_access@
identifier func;
struct task_struct *p;
identifier state_var;
position fpos;
position epos;
@@

func(...)@fpos
{
	<...
(
  p->state & state_var@epos
|
  p->state | state_var@epos
|
  p->state < state_var@epos
|
  p->state > state_var@epos
|
  state_var@epos = p->state
// For some reason adding this disjunction gives us more matches, but causes
// some to go away :/
// |
//   p->state == state_var@epos
|
  p->state != state_var@epos
)
	...>
}

@depends on patch@
identifier fn = state_access.func;
identifier state_var = state_access.state_var;
@@

fn(...,
- long state_var
+ int state_var
,...)
{
	...
}

// Should be merged in the above but can't get disjunction to work
@depends on patch@
identifier fn = state_access.func;
identifier state_var = state_access.state_var;
@@

fn(...,
- unsigned long state_var
+ unsigned int state_var
,...)
{
	...
}

// Is it possible to match without semicolons? :/
@depends on patch@
identifier state_var = state_access.state_var;
expression E;
@@

(
- long state_var;
+ int state_var;
|
- long state_var = E;
+ int state_var = E;
)

@script:python depends on report@
fp << state_access.fpos;
ep << state_access.epos;
@@
cocci.print_main("Func at", fp)
cocci.print_main("Expr at", ep)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
