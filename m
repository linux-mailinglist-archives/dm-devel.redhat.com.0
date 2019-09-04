Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8E4A9BCA
	for <lists+dm-devel@lfdr.de>; Thu,  5 Sep 2019 09:30:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8C5C30044CE;
	Thu,  5 Sep 2019 07:30:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADB2E5C207;
	Thu,  5 Sep 2019 07:30:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6301324F30;
	Thu,  5 Sep 2019 07:30:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x84C7Qxs021192 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Sep 2019 08:07:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3574D5D712; Wed,  4 Sep 2019 12:07:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B5865D6D0;
	Wed,  4 Sep 2019 12:07:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mx1.redhat.com (Postfix) with ESMTP id 8337787521B;
	Wed,  4 Sep 2019 12:07:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E0B8337;
	Wed,  4 Sep 2019 05:07:21 -0700 (PDT)
Received: from [10.1.194.37] (e113632-lin.cambridge.arm.com [10.1.194.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EB923F59C;
	Wed,  4 Sep 2019 05:07:19 -0700 (PDT)
From: Valentin Schneider <valentin.schneider@arm.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
References: <20190902210558.GA23013@avx2>
	<d8ad0be1-4ed7-df74-d415-2b1c9a44bac7@arm.com>
	<20190903181920.GA22358@avx2>
	<92ead22e-0580-c720-1a29-7db79d76f7d7@arm.com>
Message-ID: <a43fe392-bd6a-71f5-8611-c6b764ba56c3@arm.com>
Date: Wed, 4 Sep 2019 13:07:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <92ead22e-0580-c720-1a29-7db79d76f7d7@arm.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Wed, 04 Sep 2019 12:07:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Wed, 04 Sep 2019 12:07:23 +0000 (UTC) for IP:'217.140.110.172'
	DOMAIN:'foss.arm.com' HELO:'foss.arm.com'
	FROM:'valentin.schneider@arm.com' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 217.140.110.172 foss.arm.com 217.140.110.172
	foss.arm.com <valentin.schneider@arm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 05 Sep 2019 07:30:28 +0000 (UTC)

On 03/09/2019 22:51, Valentin Schneider wrote:
[...]
> I tried something for function parameters, which seems to be feasible
> according to [1], but couldn't get it to work (yet). Here's what I have
> so far:
> 
[...]

So now I have this:

---
@funcmatch@
identifier func;
identifier p;
identifier state_var;
@@

  func(..., struct task_struct *p, ...
-      , long state_var
+      , int state_var
       ,...)
{
	...
}
---

Which seems to be doing roughly what I want. I probably need another
version to cover functions with reverse parameter order, and also need
to make it match functions that assign state_var to p->state (or pass it
down to another function that might do it).

Baby steps...

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
