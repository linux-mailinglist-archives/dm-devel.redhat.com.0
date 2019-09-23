Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DE51BBB33A
	for <lists+dm-devel@lfdr.de>; Mon, 23 Sep 2019 13:56:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A2B0C300DA78;
	Mon, 23 Sep 2019 11:56:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7937060600;
	Mon, 23 Sep 2019 11:56:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D9E8618089C8;
	Mon, 23 Sep 2019 11:56:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8NBQr1M028614 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Sep 2019 07:26:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0763019D70; Mon, 23 Sep 2019 11:26:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DF4E19C58;
	Mon, 23 Sep 2019 11:26:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mx1.redhat.com (Postfix) with ESMTP id 9BEE21196E60;
	Mon, 23 Sep 2019 11:26:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E29C2142F;
	Mon, 23 Sep 2019 04:26:46 -0700 (PDT)
Received: from [10.1.194.37] (e113632-lin.cambridge.arm.com [10.1.194.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8451E3F694;
	Mon, 23 Sep 2019 04:26:45 -0700 (PDT)
To: Julia Lawall <julia.lawall@lip6.fr>
References: <a43fe392-bd6a-71f5-8611-c6b764ba56c3@arm.com>
	<7e3e784c-e8e6-f9ba-490f-ec3bf956d96b@web.de>
	<0c4dcb91-4830-0013-b8c6-64b9e1ce47d4@arm.com>
	<32d65b15-1855-e7eb-e9c4-81560fab62ea@arm.com>
	<alpine.DEB.2.21.1909231228200.2272@hadrien>
From: Valentin Schneider <valentin.schneider@arm.com>
Message-ID: <d529c390-546e-a8a4-f475-c3ee41f97645@arm.com>
Date: Mon, 23 Sep 2019 12:26:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1909231228200.2272@hadrien>
Content-Language: en-US
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Mon, 23 Sep 2019 11:26:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Mon, 23 Sep 2019 11:26:49 +0000 (UTC) for IP:'217.140.110.172'
	DOMAIN:'foss.arm.com' HELO:'foss.arm.com'
	FROM:'valentin.schneider@arm.com' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 217.140.110.172 foss.arm.com 217.140.110.172
	foss.arm.com <valentin.schneider@arm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.65
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 23 Sep 2019 07:51:30 -0400
Cc: Andrea Arcangeli <aarcange@redhat.com>, rcu@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Ingo Molnar <mingo@redhat.com>,
	Markus Elfring <Markus.Elfring@web.de>, Jens Axboe <axboe@kernel.dk>,
	Alexey Dobriyan <adobriyan@gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 23 Sep 2019 11:56:24 +0000 (UTC)

On 23/09/2019 11:34, Julia Lawall wrote:
>> // FIXME: current not recognized as task_struct*, fixhack with regexp
>> identifier current =~ "^current$";
> 
> Please don't do this.  Just use the word current.  It doesn't have to be a
> metavariable.  You will though get a warning about it.  To eliminate the
> warning, you can say symbol current;
> 

Didn't know about that way to get rid of the warning, thanks!

>> identifier task_state =~ "^TASK_";
> 
> Are there a lot of options?  You can also enumerate them in {}, ie
> 
> identifier task_state = {TASK_BLAH, TASK_BLAHBLAH};
> 

Around a dozen, can be enumerated easily and is indeed probably better than
a regexp.

>> identifier state_var;
>> position pos;
>> @@
>>
>> (
>>   p->state & state_var@pos
>> |
>>   current->state & state_var@pos
>> |
>>   p->state | state_var@pos
>> |
>>   current->state | state_var@pos
>> |
>>   p->state < state_var@pos
>> |
>>   current->state < state_var@pos
>> |
>>   p->state > state_var@pos
>> |
>>   current->state > state_var@pos
>> |
>>   state_var@pos = p->state
>> |
>>   state_var@pos = current->state
>> |
>>   p->state == state_var@pos
>> |
>>   current->state == state_var@pos
>> |
>>   p->state != state_var@pos
>> |
>>   current->state != state_var@pos
>> |
>> // FIXME: match functions that do something with state_var underneath?
>> // How to do recursive rules?
> 
> You want to look at the definitions of called functions?  Coccinelle
> doesn't really support that, but there are hackish ways to add that.  How
> many function calls would you expect have to be unrolled?
> 

I wouldn't expect more than a handful (~5). I suppose this has to do with
injecting some Python/Ocaml code? I have some examples bookmarked but
haven't gotten to stare at them long enough.

>>   set_current_state(state_var@pos)
>> |
>>   set_special_state(state_var@pos)
>> |
>>   signal_pending_state(state_var@pos, p)
>> |
>>   signal_pending_state(state_var@pos, current)
>> |
>>   state_var@pos & task_state
>> |
>>   state_var@pos | task_state
>> )
>>
>> // Fixup local variables
>> @depends on patch && state_access@
>> identifier state_var = state_access.state_var;
>> @@
>> (
>> - long
>> + int
>> |
>> - unsigned long
>> + unsigned int
>> )
>> state_var;
>>
>> // Fixup function parameters
>> @depends on patch && state_access@
>> identifier fn;
>> identifier state_var = state_access.state_var;
>> @@
>>
>> fn(...,
>> - long state_var
>> + int state_var
>> ,...)
>> {
>> 	...
>> }
>>
>> // FIXME: find a way to squash that with the above?
> 
> I think that you can make a disjunction on a function parameter
> 
> fn(...,
> (
> - T1 x1
> + T2 x2
> |
> - T3 x3
> + T4 x4
> )
> , ...) { ... }
> 

My attempt at this gives me "minus: parse error", which is why I went
with the split.

Something simple like this works:
---
virtual patch
virtual report

@@
identifier fn;
identifier p;
@@

fn(...,
- long
+ int
p
,...)
{
	...
}
---

but this doesn't:
---
virtual patch
virtual report

@@
identifier fn;
identifier p;
@@

fn(...,
(
- long p
+ int p
|
- unsigned long p
+ unsigned int p
)
,...)
{
	...
}
---

> julia
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
