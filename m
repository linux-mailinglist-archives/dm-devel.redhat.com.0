Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 285DBA7E6F
	for <lists+dm-devel@lfdr.de>; Wed,  4 Sep 2019 10:53:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 056F030832DC;
	Wed,  4 Sep 2019 08:53:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBBDB1001958;
	Wed,  4 Sep 2019 08:53:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6754E2551D;
	Wed,  4 Sep 2019 08:53:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x83HTFJv020624 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 13:29:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 54CB96013A; Tue,  3 Sep 2019 17:29:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx22.extmail.prod.ext.phx2.redhat.com
	[10.5.110.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E00C960126;
	Tue,  3 Sep 2019 17:29:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mx1.redhat.com (Postfix) with ESMTP id 9227718B3D85;
	Tue,  3 Sep 2019 17:29:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52AB3360;
	Tue,  3 Sep 2019 10:29:09 -0700 (PDT)
Received: from [10.1.194.37] (e113632-lin.cambridge.arm.com [10.1.194.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3302E3F59C;
	Tue,  3 Sep 2019 10:29:08 -0700 (PDT)
To: Alexey Dobriyan <adobriyan@gmail.com>, mingo@redhat.com,
	peterz@infradead.org
References: <20190902210558.GA23013@avx2>
From: Valentin Schneider <valentin.schneider@arm.com>
Message-ID: <d8ad0be1-4ed7-df74-d415-2b1c9a44bac7@arm.com>
Date: Tue, 3 Sep 2019 18:29:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902210558.GA23013@avx2>
Content-Language: en-US
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]);
	Tue, 03 Sep 2019 17:29:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]);
	Tue, 03 Sep 2019 17:29:10 +0000 (UTC) for IP:'217.140.110.172'
	DOMAIN:'foss.arm.com' HELO:'foss.arm.com'
	FROM:'valentin.schneider@arm.com' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 217.140.110.172 foss.arm.com 217.140.110.172
	foss.arm.com <valentin.schneider@arm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.63
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 04 Sep 2019 04:53:21 -0400
Cc: aarcange@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	dm-devel@redhat.com, axboe@kernel.dk
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Wed, 04 Sep 2019 08:53:31 +0000 (UTC)

On 02/09/2019 22:05, Alexey Dobriyan wrote:
> 32-bit accesses are shorter than 64-bit accesses on x86_64.
> Nothing uses 64-bitness of ->state.
> 
> Space savings are ~2KB on F30 kernel config.
> 
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
> 
>  arch/ia64/kernel/perfmon.c   |    4 ++--
>  block/blk-mq.c               |    2 +-
>  drivers/md/dm.c              |    4 ++--
>  fs/userfaultfd.c             |    2 +-
>  include/linux/sched.h        |    6 +++---
>  include/linux/sched/debug.h  |    2 +-
>  include/linux/sched/signal.h |    2 +-
>  kernel/freezer.c             |    2 +-
>  kernel/kthread.c             |    4 ++--
>  kernel/locking/mutex.c       |    6 +++---
>  kernel/locking/semaphore.c   |    2 +-
>  kernel/rcu/rcutorture.c      |    4 ++--
>  kernel/rcu/tree_stall.h      |    6 +++---
>  kernel/sched/core.c          |    8 ++++----
>  lib/syscall.c                |    2 +-
>  15 files changed, 28 insertions(+), 28 deletions(-)
> 

It looks like you missed a few places. There's a long prev_state in
sched/core.c::finish_task_switch() for instance.

I suppose that's where coccinelle oughta help but I'm really not fluent
in that. Is there a way to make it match p.state accesses with p task_struct?
And if so, can we make it change the type of the variable being read from
/ written to?

How did you come up with this changeset, did you pickaxe for some regexp?

[...]

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
