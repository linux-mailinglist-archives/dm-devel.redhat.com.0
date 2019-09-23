Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F2CBC285
	for <lists+dm-devel@lfdr.de>; Tue, 24 Sep 2019 09:25:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B1D1E30A76BE;
	Tue, 24 Sep 2019 07:25:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6C3F5D9E1;
	Tue, 24 Sep 2019 07:25:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9AC361803B37;
	Tue, 24 Sep 2019 07:25:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8NDO2J3004347 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Sep 2019 09:24:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A293019C78; Mon, 23 Sep 2019 13:24:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8A1F19C58;
	Mon, 23 Sep 2019 13:23:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mx1.redhat.com (Postfix) with ESMTP id BDC4E3090FC3;
	Mon, 23 Sep 2019 13:23:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07AF61000;
	Mon, 23 Sep 2019 06:23:57 -0700 (PDT)
Received: from [10.1.194.37] (e113632-lin.cambridge.arm.com [10.1.194.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A54F53F694;
	Mon, 23 Sep 2019 06:23:55 -0700 (PDT)
To: Julia Lawall <julia.lawall@lip6.fr>
References: <a43fe392-bd6a-71f5-8611-c6b764ba56c3@arm.com>
	<7e3e784c-e8e6-f9ba-490f-ec3bf956d96b@web.de>
	<0c4dcb91-4830-0013-b8c6-64b9e1ce47d4@arm.com>
	<32d65b15-1855-e7eb-e9c4-81560fab62ea@arm.com>
	<alpine.DEB.2.21.1909231228200.2272@hadrien>
	<d529c390-546e-a8a4-f475-c3ee41f97645@arm.com>
	<alpine.DEB.2.21.1909231340090.2227@hadrien>
From: Valentin Schneider <valentin.schneider@arm.com>
Message-ID: <84a9fa83-8048-44c8-3191-07aa63337cfb@arm.com>
Date: Mon, 23 Sep 2019 14:23:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1909231340090.2227@hadrien>
Content-Language: en-US
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Mon, 23 Sep 2019 13:23:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Mon, 23 Sep 2019 13:23:59 +0000 (UTC) for IP:'217.140.110.172'
	DOMAIN:'foss.arm.com' HELO:'foss.arm.com'
	FROM:'valentin.schneider@arm.com' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 217.140.110.172 foss.arm.com 217.140.110.172
	foss.arm.com <valentin.schneider@arm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 24 Sep 2019 03:25:30 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Tue, 24 Sep 2019 07:25:53 +0000 (UTC)

On 23/09/2019 12:43, Julia Lawall wrote:
>>>> // FIXME: match functions that do something with state_var underneath?
>>>> // How to do recursive rules?
>>>
>>> You want to look at the definitions of called functions?  Coccinelle
>>> doesn't really support that, but there are hackish ways to add that.  How
>>> many function calls would you expect have to be unrolled?
>>>
>>
>> I wouldn't expect more than a handful (~5). I suppose this has to do with
>> injecting some Python/Ocaml code? I have some examples bookmarked but
>> haven't gotten to stare at them long enough.
> 
> You can look at iteration.cocci, but it's a bit complex.
> 
> You could match definitions of functions that do what you are interested
> in, then store the names of these functions in a list (python/ocaml), and
> then look for calls to those functions.  Something like
> 
> identifier fn : script:ocaml() { in_my_list fn };
> 

That seems promising, will try to have a look when I get some spare cycles.
Thanks for the pointers!

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
