Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5C2A626C
	for <lists+dm-devel@lfdr.de>; Tue,  3 Sep 2019 09:28:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E053AA36F09;
	Tue,  3 Sep 2019 07:28:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B10D81001947;
	Tue,  3 Sep 2019 07:28:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1746B2551C;
	Tue,  3 Sep 2019 07:28:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x82N2tRF012937 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Sep 2019 19:02:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 286AD5D6B7; Mon,  2 Sep 2019 23:02:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx25.extmail.prod.ext.phx2.redhat.com
	[10.5.110.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 987025D6B0;
	Mon,  2 Sep 2019 23:02:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mx1.redhat.com (Postfix) with ESMTP id 315A810F23E5;
	Mon,  2 Sep 2019 23:02:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82626344;
	Mon,  2 Sep 2019 16:02:49 -0700 (PDT)
Received: from [10.0.2.15] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2D2563F59C; 
	Mon,  2 Sep 2019 16:02:48 -0700 (PDT)
To: Alexey Dobriyan <adobriyan@gmail.com>, mingo@redhat.com,
	peterz@infradead.org
References: <20190902210558.GA23013@avx2>
From: Valentin Schneider <valentin.schneider@arm.com>
Message-ID: <7b94004e-4a65-462b-cd6b-5cbd23d607bf@arm.com>
Date: Tue, 3 Sep 2019 00:02:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902210558.GA23013@avx2>
Content-Language: en-US
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]);
	Mon, 02 Sep 2019 23:02:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]);
	Mon, 02 Sep 2019 23:02:51 +0000 (UTC) for IP:'217.140.110.172'
	DOMAIN:'foss.arm.com' HELO:'foss.arm.com'
	FROM:'valentin.schneider@arm.com' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 217.140.110.172 foss.arm.com 217.140.110.172
	foss.arm.com <valentin.schneider@arm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.66
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 03 Sep 2019 03:28:11 -0400
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]); Tue, 03 Sep 2019 07:28:22 +0000 (UTC)

Hi,

On 02/09/2019 22:05, Alexey Dobriyan wrote:
> 32-bit accesses are shorter than 64-bit accesses on x86_64.
> Nothing uses 64-bitness of ->state.
> 
> Space savings are ~2KB on F30 kernel config.
> 
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---

Interestingly this has been volatile long since forever (or 2002, which is
my take on "forever" given the history tree), although the task states
seem to have never gone above 0x1000 (the current TASK_STATE_MAX).

[...]

> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -643,7 +643,7 @@ struct task_struct {
>  	struct thread_info		thread_info;
>  #endif
>  	/* -1 unrunnable, 0 runnable, >0 stopped: */
> -	volatile long			state;
> +	volatile int			state;

This leads to having some padding after this field (w/o randomization):

struct task_struct {
	struct thread_info         thread_info;          /*     0    24 */
	volatile int               state;                /*    24     4 */

	/* XXX 4 bytes hole, try to pack */

	void *                     stack;                /*    32     8 */

Though seeing as this is also the boundary of the randomized layout we can't
really do much better without changing the boundary itself. So much for
cacheline use :/

Anyway, task_struct doesn't shrink but we can cut some corners in the asm,
I guess that's fine?

[...]

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
